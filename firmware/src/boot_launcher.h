//------------------------------------------------------------------------------
/*!
 * @file       boot_launcher.h
 * @brief      API for launching boot loader from application
 * 
 * @copyright  Copyright &copy; 2016 Exosite LLC, All rights reserved.
 */
//------------------------------------------------------------------------------

#ifndef _X_BOOT_LAUNCHER_H
#define _X_BOOT_LAUNCHER_H

//------------------------------------------------------------------------------
// Header Files
//------------------------------------------------------------------------------
#include <stdint.h>
#include "debug_flags.h"

//------------------------------------------------------------------------------
// typedefs
//------------------------------------------------------------------------------

typedef struct
{
    uint32_t valid;
    uint16_t major;
    uint16_t minor;
    uint16_t patch;
} boot_version_t;

typedef enum
{
    BOOT_RESULT_NONE = 0,
    BOOT_RESULT_SUCCEEDED,
    BOOT_RESULT_FAILED,
    BOOT_RESULT_TRAP,
    BOOT_RESULT_0XFFFFFFFF = 0xffffffff
} BOOT_LOADER_RESULT_T;

//------------------------------------------------------------------------------
// #defines
//------------------------------------------------------------------------------

// CIK's are only 40 bytes plus 1 for the null, but round up to a power of 2
// for addressing issues
#define BOOT_LAUNCHER_CIK_STRING_MAX_LEN        (64)

// Product ID's are only 16 bytes plus 1 for the null, but round up to a power
// of 2 for addressing issues.
#define BOOT_LAUNCHER_PRODUCTID_STRING_MAX_LEN  (64)

#define BOOT_LAUNCHER_META_FILENAME_MAX_LEN     (64)

#define BOOT_LAUNCHER_DEBUG_FLAGS_MAX_LEN       (64)

#define BOOT_LAUNCHER_CIK_STRING_ADDRESS        (0xA007f000)
#define BOOT_LAUNCHER_PRODUCTID_ADDRESS         (BOOT_LAUNCHER_CIK_STRING_ADDRESS + BOOT_LAUNCHER_CIK_STRING_MAX_LEN)
#define BOOT_LAUNCHER_META_FILENAME_ADDRESS     (BOOT_LAUNCHER_PRODUCTID_ADDRESS + BOOT_LAUNCHER_PRODUCTID_STRING_MAX_LEN)
#define BOOT_LAUNCHER_DEBUG_FLAGS_ADDRESS       (BOOT_LAUNCHER_META_FILENAME_ADDRESS + BOOT_LAUNCHER_META_FILENAME_MAX_LEN)
#define BOOT_LAUNCHER_CODE_ADDRESS              (BOOT_LAUNCHER_DEBUG_FLAGS_ADDRESS + BOOT_LAUNCHER_DEBUG_FLAGS_MAX_LEN)
#define BOOT_LAUNCHER_RESULT_ADDRESS            (BOOT_LAUNCHER_CODE_ADDRESS + sizeof(uint32_t))
#define BOOT_LAUNCHER_VERSION_ADDRESS           (BOOT_LAUNCHER_RESULT_ADDRESS + sizeof(uint32_t))

#define BOOT_LAUNCHER_VERSION_VALID             (0x0b1e55ed)

#define BOOT_LAUNCHER_UPDATE_CODE               (0x87654321)
#define BOOT_LAUNCHER_POWER_UP_CODE             (0x97979797)
#define BOOT_LAUNCHER_APPLICATION_A_CODE        (0xA6A6A6A6)
#define BOOT_LAUNCHER_APPLICATION_B_CODE        (0xB5B5B5B5)

#define APPLICATION_NVM_BASE_ADDRESS_A          ((void *) 0x9d0f4000)
#define APPLICATION_NVM_BASE_ADDRESS_B          ((void *) 0x9d1f4000)

//------------------------------------------------------------------------------
// prototypes
//------------------------------------------------------------------------------

void boot_launcher_update( const char * product_id, const char * CIK_string, const char * metafile_name );

void * boot_launcher__get_NVM_base_address( void );

BOOT_LOADER_RESULT_T boot_loader_get_result( void );

void boot_loader_clear_result( void );

#endif  // _X_BOOT_LAUNCHER_H

// vim: tabstop=4 shiftwidth=4 expandtab
