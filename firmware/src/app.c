/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    app.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It 
    implements the logic of the application's state machine and it may call 
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2013-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *******************************************************************************/
// DOM-IGNORE-END


// *****************************************************************************
// *****************************************************************************
// Section: Included Files 
// *****************************************************************************
// *****************************************************************************

#include "app.h"
#include "boot_launcher.h"
#include "debug_flags.h"
#include "system/command/sys_command.h"
#include "system/wdt/sys_wdt.h"
#include "version.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.
    
    Application strings and buffers are be defined outside this structure.
*/

APP_DATA appData;

#define FLASH_PAGE_SIZE_MINUS_1 0x3fff
#define FLASH_ERASE_PATTERN     0xff

typedef struct {
    uint32_t    valid;
    uint8_t     major;
    uint8_t     minor;
    uint8_t     patch;
} nvm_t;

uint8_t NVMBuffer[FLASH_PAGE_SIZE_MINUS_1 + 1] =
{
    [0 ... FLASH_PAGE_SIZE_MINUS_1] = FLASH_ERASE_PATTERN
};

volatile nvm_t * NVMRead;
nvm_t * NVMWrite = (nvm_t *)&NVMBuffer;

#define MAX_CIK_BYTES           40
#define MAX_PRODUCT_ID_BYTES    16

char g_CIK[MAX_CIK_BYTES + 1] = { [0 ... MAX_CIK_BYTES] = 0};
char g_ProductID[MAX_PRODUCT_ID_BYTES + 1] = { [0 ... MAX_PRODUCT_ID_BYTES] = 0};

static int _Command_SetDebug(SYS_CMD_DEVICE_NODE* pCmdIO, int argc, char** argv);
static int _Command_SetCIK(SYS_CMD_DEVICE_NODE* pCmdIO, int argc, char** argv);
static int _Command_SetProduct(SYS_CMD_DEVICE_NODE* pCmdIO, int argc, char** argv);
static int _Command_Upgrade(SYS_CMD_DEVICE_NODE* pCmdIO, int argc, char** argv);

// Test command table
static const SYS_CMD_DESCRIPTOR    testCmdTbl[]=
{
    {"debug",       _Command_SetDebug,      ": Set the debug flags."            },
    {"cik",         _Command_SetCIK,        ": Set CIK to use."                 },
    {"product",     _Command_SetProduct,    ": Set the Product ID to use."      },
    {"upgrade",     _Command_Upgrade,       ": Upgrade with a given meta file." },
};

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/
void TimerCallBack(uintptr_t context, uint32_t tickCount)
{
    /* Toggle LED */       
    BSP_LEDToggle(BSP_LED_3);
   
    appData.count++;        
    
    /* Service the WDT */
    SYS_WDT_TimerClear();
}

/* Called from an ISR.  Don't do anything that you can't do in an ISR. */
void NVM_EventHandler(
    DRV_NVM_EVENT event,
    DRV_NVM_COMMAND_HANDLE commandHandle,
    uintptr_t context
)
{
    switch (event)
    {
        case DRV_NVM_EVENT_COMMAND_COMPLETE:
        {
            break;
        }

        case DRV_NVM_EVENT_COMMAND_ERROR:
        {
            break;
        }

        default:
        {
            break;
        }
    }
}

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************

uint32_t __attribute__((nomips16)) ReadCoreTimer(void)
{
    uint32_t timer;

    timer = __builtin_mfc0(9, 0);

    return timer;
}

void delay_us(uint32_t us)
{
    /* Delay for 100 uS.  ReadCoreTimer() increments at 1/2 the system clock,
     * so at a system clock of 200 MHz, ReadCoreTimer() ticks every 10 nS.  To
     * delay for 100 uS, we need to wait for 10,000 ticks (100,000 nS) to
     * elapse.
     */
    volatile uint32_t i;
    uint32_t end = ReadCoreTimer() + (us * 100);

    for (i = ReadCoreTimer(); i < end; i = ReadCoreTimer())
        ;
    
}

void hex_dump(volatile void * start)
{
    int i,j;
    uint8_t * ptr = (uint8_t *)start;

    for (i = 0; i < 1; i++)
    {
        SYS_CONSOLE_PRINT("0x%08x: ", ptr);
        for(j = 0; j < 16; j++, ptr++)
        {
            SYS_CONSOLE_PRINT("%02x ", *ptr);
        }
        SYS_CONSOLE_PRINT("\r\n");
    }
}

// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_Initialize ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Initialize ( void )
{
    /* Put the application into its initial state */
    appData.state = APP_STATE_TIMER_OBJECT_CREATE;   

    appData.count = 0;
}


/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks ( void )
{
   /* Take appropriate action, depending on the current state. */
    switch (appData.state)
    {

        /* Initial state is to create the timer object for periodic alarm */
        case APP_STATE_TIMER_OBJECT_CREATE:
        {
            NVMRead = boot_launcher__get_NVM_base_address();

            /* create command group */
            if (!SYS_CMD_ADDGRP(testCmdTbl, sizeof(testCmdTbl)/sizeof(*testCmdTbl), "test", ": commands"))
            {
                /* Complain but not a fatal error */
                SYS_CONSOLE_PRINT("Failed to create Test Commands\r\n");
            }

            appData.tmrServiceHandle = SYS_TMR_ObjectCreate(APP_LED_BLINK_DELAY, 1, TimerCallBack, SYS_TMR_FLAG_PERIODIC);
            if(SYS_TMR_HANDLE_INVALID != appData.tmrServiceHandle)
            {
                appData.state = APP_STATE_IDLE;
            }

            appData.nvmHandle = DRV_NVM_Open(0, DRV_IO_INTENT_READWRITE);
            if (DRV_HANDLE_INVALID == appData.nvmHandle)
            {
                SYS_CONSOLE_PRINT("Error: Can't open NVM driver\r\n");
            }

            /* Register for NVM driver events */
            DRV_NVM_EventHandlerSet(appData.nvmHandle, NVM_EventHandler, 1);

            /* Read the NVM Media Geometry. */
            appData.nvmGeometry = DRV_NVM_GeometryGet(appData.nvmHandle);
            if (NULL == appData.nvmGeometry)
            {
                SYS_CONSOLE_PRINT("Error: Can't get NVM geometry\r\n");
            }

            /* Print NVM geometry */
            SYS_CONSOLE_PRINT(
                "NVM:\r\n"
                " mediaProperty 0x%08x\r\n"
                " numReadRegions  %d\r\n"
                "  blocksize      %d\r\n"
                "  numBlocks      %d\r\n"
                " numWriteRegions %d\r\n"
                "  blocksize      %d\r\n"
                "  numBlocks      %d\r\n"
                " numEraseRegions %d\r\n"
                "  blocksize      %d\r\n"
                "  numBlocks      %d\r\n"
                " DRV_NVM_ROW_SIZE %d\r\n"
                " DRV_NVM_PAGE_SIZE %d\r\n",
                appData.nvmGeometry->mediaProperty,
                appData.nvmGeometry->numReadRegions,
                appData.nvmGeometry->geometryTable[0].blockSize,
                appData.nvmGeometry->geometryTable[0].numBlocks,
                appData.nvmGeometry->numWriteRegions,
                appData.nvmGeometry->geometryTable[1].blockSize,
                appData.nvmGeometry->geometryTable[1].numBlocks,
                appData.nvmGeometry->numEraseRegions,
                appData.nvmGeometry->geometryTable[2].blockSize,
                appData.nvmGeometry->geometryTable[2].numBlocks,
                DRV_NVM_ROW_SIZE,
                DRV_NVM_PAGE_SIZE
            );

            hex_dump(NVMRead);

            if (NVMRead->valid != 0xdeadbeef)
            {
                SYS_CONSOLE_PRINT("Uninitialized NVM\r\n");

                NVMWrite->valid = 0xdeadbeef;
                NVMWrite->major = 0x80 | MAJOR_VERSION;
                NVMWrite->minor = 0x40 | MINOR_VERSION;
                NVMWrite->patch = 0x20 | PATCH_VERSION;

                /* Write the current contents of the write buffer to NVM */
                DRV_NVM_EraseWrite(
                    appData.nvmHandle,
                    &appData.nvmCmdHandle,
                    NVMWrite,
                    0,
                    1
                );
                if (appData.nvmCmdHandle == DRV_NVM_COMMAND_HANDLE_INVALID)
                {
                    SYS_CONSOLE_PRINT("Unabled to write NVM\r\n");
                }
                else
                {
                    SYS_CONSOLE_PRINT("NVM Initialized\r\n");
                }
            }
            break;
        }

        /* LED will be toggled in Timer Callback function, 
         * so nothing is there to be done in this state */
        case APP_STATE_IDLE:
        {
            static bool printed = false;

            if (!printed && (appData.count > 10))
            {
                printed = true;
                hex_dump(NVMRead);
            }

            SYS_CMD_READY_TO_READ();
            break;
        }
        
        /* Should not come here during normal operation */
        default:
        {
            PLIB_ASSERT(false , "unknown application state");

            break;
        }

    }
}
 
int _Command_SetDebug(SYS_CMD_DEVICE_NODE* pCmdIO, int argc, char** argv)
{
    const void *cmdIoParam = pCmdIO->cmdIoParam;

    if (argc != 2)
    {
        goto usage;
    }

    long flags = strtol(argv[1], NULL, 0);
    set_debug_flags(flags);

    SYS_CONSOLE_PRINT("debug flags set to 0x%08x\r\n", get_debug_flags());

    return true;

usage:

    (*pCmdIO->pCmdApi->print)(cmdIoParam,
        "Usage: %s <value>\r\n"
        "Set system debug flags to the given value.\r\n",
        argv[0]
    );

    return false;
}

int _Command_SetCIK(SYS_CMD_DEVICE_NODE* pCmdIO, int argc, char** argv)
{
    const void *cmdIoParam = pCmdIO->cmdIoParam;

    if (argc != 2)
    {
        goto usage;
    }

    int len  = strlen(argv[1]);
    if (len != MAX_CIK_BYTES)
    {
        SYS_CONSOLE_PRINT(
            "Error: A CIK has %d characters, '%s' has %d.\r\n",
            MAX_CIK_BYTES,
            argv[1],
            len
        );
        return false;
    }

    memset(g_CIK, 0x0, MAX_CIK_BYTES + 1);
    strncpy(g_CIK, argv[1], MAX_CIK_BYTES);

    SYS_CONSOLE_PRINT("CIK: '%s'\r\n", g_CIK);

    return true;

usage:

    (*pCmdIO->pCmdApi->print)(cmdIoParam,
        "Usage: %s <CIK>\r\n"
        "Stores a CIK in RAM to use when executing an update.",
        argv[0]
    );

    return false;
}

int _Command_SetProduct(SYS_CMD_DEVICE_NODE* pCmdIO, int argc, char** argv)
{
    const void *cmdIoParam = pCmdIO->cmdIoParam;

    if (argc != 1)
    {
        goto usage;
    }

    int len  = strlen(argv[1]);
    if (len != MAX_PRODUCT_ID_BYTES)
    {
        SYS_CONSOLE_PRINT(
            "Error: A Product ID has %d characters, '%s' has %d.\r\n",
            MAX_PRODUCT_ID_BYTES,
            argv[1],
            len
        );
        return false;
    }

    memset(g_ProductID, 0x0, MAX_PRODUCT_ID_BYTES + 1);
    strncpy(g_ProductID, argv[1], MAX_PRODUCT_ID_BYTES);

    SYS_CONSOLE_PRINT("Product ID: '%s'\r\n", g_ProductID);

    return true;

usage:

    (*pCmdIO->pCmdApi->print)(cmdIoParam,
        "Usage: %s <Product ID>\r\n"
        "Stores a Product ID in RAM to use when executing an update.",
        argv[0]
    );

    return false;
}

int _Command_Upgrade(SYS_CMD_DEVICE_NODE* pCmdIO, int argc, char** argv)
{
    const void *cmdIoParam = pCmdIO->cmdIoParam;

    if (argc != 1)
    {
        goto usage;
    }

    if (0x0 == g_ProductID[0])
    {
        SYS_CONSOLE_PRINT("Need to set a product ID to upgrade from.\r\n");
    }

    if (0x0 == g_CIK[0])
    {
        SYS_CONSOLE_PRINT("Need to set a CIK to upgrade.\r\n");
    }

    BSP_LEDOn(BSP_LED_2);

    /* Wait a second */
    delay_us(1000000);

    boot_launcher_update(g_ProductID, g_CIK, argv[1]);

    /* We won't return from a successful call, if we do it's an error. */
    SYS_CONSOLE_PRINT("Error: Upgrade failed to start.\r\n");

    return false;

usage:

    (*pCmdIO->pCmdApi->print)(cmdIoParam,
        "Usage: %s <metafile>\r\n"
        "Upgrades the CIK from the Product ID using the given metafile.\r\n",
        argv[0]
    );

    return false;
}

// vim: tabstop=4 shiftwidth=4 expandtab
