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

uint8_t NVMWriteBuffer[FLASH_PAGE_SIZE_MINUS_1 + 1] =
{
    [0 ... FLASH_PAGE_SIZE_MINUS_1] = FLASH_ERASE_PATTERN
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

void hex_dump(void * start)
{
    int i,j;
    uint8_t * ptr = (uint8_t *)start;

    for (i = 0; i < 2; i++)
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
            uint8_t * nvm_addr = boot_launcher__get_NVM_base_address();

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

            hex_dump(nvm_addr);

            if (*nvm_addr == 0xff)
            {
                SYS_CONSOLE_PRINT("Uninitialized NVM\r\n");

                uint32_t * p = (uint32_t *) &NVMWriteBuffer;
                *p = 0xdeadbeef;

                /* Write the current contents of the write buffer to NVM */
                DRV_NVM_EraseWrite(
                    appData.nvmHandle,
                    &appData.nvmCmdHandle,
                    &NVMWriteBuffer,
                    0,
                    1
                );
                if (appData.nvmCmdHandle == DRV_NVM_COMMAND_HANDLE_INVALID)
                {
                    SYS_CONSOLE_PRINT("Unabled to write NVM\r\n");
                }
                else
                {
                    SYS_CONSOLE_PRINT("Writing 0x%08x to NVM\r\n", *p);
                }
            }
            break;
        }

        /* LED will be toggled in Timer Callback function, 
         * so nothing is there to be done in this state */
        case APP_STATE_IDLE:
        {
            if (appData.count > 120)
            {
                BSP_LEDOn(BSP_LED_2);
                SYS_CONSOLE_PRINT("Upgrade to: %s\r\n", UPGRADE_FILE);

                /* Wait a second */
                delay_us(1000000);

                set_debug_flags(DEBUG_LVL_INFO);
                boot_launcher_update(
                    "j1metmxb1z3bx1or",
                    "f3ecbe3bf48ae853216bc763f161d5cf00106d1a",
                    UPGRADE_FILE
                );
            }
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
 
// vim: tabstop=4 shiftwidth=4 expandtab
