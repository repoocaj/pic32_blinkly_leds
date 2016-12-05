//****************************************************************************
// file name:           boot_laucher.h
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
// guard code
#ifndef __BOOT_LAUNCHER_H__
#define	__BOOT_LAUNCHER_H__
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Header Files
//------------------------------------------------------------------------------

#include <stdint.h>

#include "debug_flags.h"

//------------------------------------------------------------------------------
// #defines
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Global Variables
//------------------------------------------------------------------------------

// CIK's are only 40 bytes plus 1 for the null, but round up to a power of 2
// for addressing issues
#define BOOT_LAUNCHER_CIK_STRING_MAX_LEN (64)

// Product ID's are only 16 bytes plus 1 for the null, but round up to a power
// of 2 for addressing issues.
#define BOOT_LAUNCHER_PRODUCTID_STRING_MAX_LEN (64)

#define BOOT_LAUNCHER_META_FILENAME_MAX_LEN (64)

#define BOOT_LAUNCHER_DEBUG_FLAGS_MAX_LEN (64)

#define BOOT_LAUNCHER_CIK_STRING_ADDRESS ( 0xA007f000 )
#define BOOT_LAUNCHER_PRODUCTID_ADDRESS (BOOT_LAUNCHER_CIK_STRING_ADDRESS + BOOT_LAUNCHER_CIK_STRING_MAX_LEN )
#define BOOT_LAUNCHER_META_FILENAME_ADDRESS ( BOOT_LAUNCHER_PRODUCTID_ADDRESS + BOOT_LAUNCHER_PRODUCTID_STRING_MAX_LEN )
#define BOOT_LAUNCHER_DEBUG_FLAGS_ADDRESS ( BOOT_LAUNCHER_META_FILENAME_ADDRESS + BOOT_LAUNCHER_META_FILENAME_MAX_LEN )
#define BOOT_LAUNCHER_CODE_ADDRESS ( BOOT_LAUNCHER_DEBUG_FLAGS_ADDRESS + BOOT_LAUNCHER_DEBUG_FLAGS_MAX_LEN )
#define BOOT_LAUNCHER_RESULT_ADDRESS ( BOOT_LAUNCHER_CODE_ADDRESS +  sizeof( uint32_t ) )

#define BOOT_LAUNCHER_UPDATE_CODE (0x87654321)
#define BOOT_LAUNCHER_POWER_UP_CODE (0x97979797)
#define BOOT_LAUNCHER_APPLICATION_A_CODE (0xA6A6A6A6)
#define BOOT_LAUNCHER_APPLICATION_B_CODE (0xB5B5B5B5)


#define APPLICATION_NVM_BASE_ADDRESS_A  ((void *) 0x9d0f4000)
#define APPLICATION_NVM_BASE_ADDRESS_B  ((void *) 0x9d1f4000)

typedef enum {
    BOOT_RESULT_NONE = 0,
    BOOT_RESULT_SUCCEEDED,
    BOOT_RESULT_FAILED,
    BOOT_RESULT_TRAP,
    BOOT_RESULT_0XFFFFFFFF = 0xffffffff
} BOOT_LOADER_RESULT_T;

//------------------------------------------------------------------------------
// prototypes
//------------------------------------------------------------------------------

void boot_launcher_update( const char * product_id, const char * CIK_string, const char * metafile_name );

void * boot_launcher__get_NVM_base_address( void );

BOOT_LOADER_RESULT_T boot_loader_get_result( void );

void boot_loader_clear_result( void );



//#define boot_launcher__get_NVM_base_address( )  ((void  *)  (0x9d0f4000))
//------------------------------------------------------------------------------
#endif	/* __BOOT_LAUNCHER_H__ */
//------------------------------------------------------------------------------

// vim: tabstop=4 shiftwidth=4 expandtab
