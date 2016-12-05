//****************************************************************************
// file name:           boot_laucher.c
// Confidential -- Proprietary Information
// copyright 2016 SMT Engineering, LLC
// All Rights Reserved.
// author:              J Mosenfelder (SMT Engineering, LLC)
//
// description:         api for launching boot loader from application
//
//
// Version:            1.00.00
// Language:           C
// Compiler:           XC32 (1.42) [c:\Microchip\xc32\v1.42\bin
//
// Processor:       PIC32MZ
//
// revision history:
// yyyy/mm/dd    <three initials of revision author>  <description of revision>
// 2016/11/14   JRM new file
// ***************************************************************************

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Header Files
//------------------------------------------------------------------------------
#include <xc.h>          /* Defines special funciton registers, CP0 regs  */

#include <stdint.h>          /* For uint32_t definition                       */
#include <stdbool.h>         /* For true/false definition                     */
#include <stdlib.h>          /* ATOI */
#include <limits.h>
#include <string.h>
#include "system/reset/sys_reset.h" 
#include "boot_launcher.h"       // self header
//------------------------------------------------------------------------------
// #defines
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Global Variables
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// prototypes
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
/*!
 * @fn     void boot_launcher_update( p_CIK_string, const char * p_metafile_name)
 *
 * @brief   launch the boot loader
 *
 * @details places the parameters at a fixed address and forces a reset command
 *
 * @param   p_product_id a pointer to a product id string for the Murano Server
 * @param   p_CIK_string is a pointer to a CIK string for the Murano Server
 * @param   p_metafile_name is a pointer to the metafile for the firmware update
 *
 * @return  void  this function will not return.  When complete, the downloader
 *          will perform a software reset command to re-launch the application.
 */
//------------------------------------------------------------------------------
void boot_launcher_update(const char * p_product_id, const char * p_CIK_string, const char * p_metafile_name)
{
    void * p_CIK_string_buf = (void *) BOOT_LAUNCHER_CIK_STRING_ADDRESS;
    void * p_product_id_buf = (void *) BOOT_LAUNCHER_PRODUCTID_ADDRESS;
    void * p_meta_file_name_buf  = (void *) BOOT_LAUNCHER_META_FILENAME_ADDRESS;
    uint32_t * p_boot_launcher_code = (uint32_t * ) BOOT_LAUNCHER_CODE_ADDRESS;

    // clear the passed data
    memset(p_CIK_string_buf, NULL, BOOT_LAUNCHER_CIK_STRING_MAX_LEN );
    memset(p_product_id_buf, NULL, BOOT_LAUNCHER_PRODUCTID_STRING_MAX_LEN );
    memset(p_meta_file_name_buf, NULL,BOOT_LAUNCHER_META_FILENAME_MAX_LEN );
    * p_boot_launcher_code = 0xffff;

    // copy the strings into the shared data area
    strncpy( p_CIK_string_buf, p_CIK_string, BOOT_LAUNCHER_CIK_STRING_MAX_LEN );
    strncpy( p_product_id_buf, p_product_id, BOOT_LAUNCHER_PRODUCTID_STRING_MAX_LEN );
    strncpy( p_meta_file_name_buf, p_metafile_name, BOOT_LAUNCHER_META_FILENAME_MAX_LEN );

    // set the code to select the bootloader to launch
    * p_boot_launcher_code = BOOT_LAUNCHER_UPDATE_CODE ;

    Nop();
    Nop();

    // perform a software reset
    SYS_RESET_SoftwareReset();

    Nop();
    Nop();

    /* prevent any unwanted code execution until reset occurs*/
    while(1);

    Nop();
    Nop();
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
/*!
 * @fn     void * boot_launcher__get_NVM_base_address( void )
 *
 * @brief   returns base address of the application NVM area in program flash bank A
 *
 * @param   none
 *
 * @return  base address of NVM area as a void pointer
 */
//------------------------------------------------------------------------------
void * boot_launcher__get_NVM_base_address(void)
{
    void * result;
    if( 0 == NVMCONbits. PFSWAP)
    {
        result = APPLICATION_NVM_BASE_ADDRESS_A ;
    }
    else
    {
        result = APPLICATION_NVM_BASE_ADDRESS_B ;
    }

    return ( result );
}

//------------------------------------------------------------------------------
/*!
 * @fn     BOOT_LOADER_RESULT_T boot_loader_get_result( void )
 *
 * @brief   reports result of boot loader operation
 */
//------------------------------------------------------------------------------
BOOT_LOADER_RESULT_T boot_loader_get_result (void)
{
    BOOT_LOADER_RESULT_T * p_boot_result = (BOOT_LOADER_RESULT_T *) BOOT_LAUNCHER_RESULT_ADDRESS ;

    BOOT_LOADER_RESULT_T result = *p_boot_result;

    return( result );       // fixed 'return' typo - MRG 11/22/16
}

//------------------------------------------------------------------------------
/*!
 * @fn     void boot_loader_clear_result( void )
 *
 * @brief   clears boot loader result stored by boot loader
 */
//------------------------------------------------------------------------------
void boot_loader_clear_result (void)
{
    BOOT_LOADER_RESULT_T * p_boot_result = (BOOT_LOADER_RESULT_T *) BOOT_LAUNCHER_RESULT_ADDRESS ;

    *p_boot_result = BOOT_RESULT_NONE ;
}
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
/*
 * end of file
 */
// vim: tabstop=4 shiftwidth=4 expandtab
