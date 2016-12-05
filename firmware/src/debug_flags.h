//****************************************************************************
// file name:       debug_flags.h
// author:          Jeff Cooper, Cooper Software Consulting, LLC
//
// description:     API for setting and getting debug flags
//
// Compiler:        XC32 (1.42)
//
// Processor:       PIC32MZ
// ***************************************************************************

#ifndef _X_DEBUG_FLAGS_H_X_
#define _X_DEBUG_FLAGS_H_X_

//------------------------------------------------------------------------------
// Header Files
//------------------------------------------------------------------------------

#include "config.h"

//------------------------------------------------------------------------------
// #defines
//------------------------------------------------------------------------------

#if (ENABLE_DEBUG_PRINTF == 1)
# define DEBUG_PRINTF(fmt, ...)                                         \
    do                                                                  \
    {                                                                   \
        SYS_DEBUG_Print(fmt, ##__VA_ARGS__);                            \
    }while (0)
#else
# define DEBUG_LVL_PRINTF(flags, fmt, ...)
#endif

#if (ENABLE_DEBUG_LVL_PRINTF == 1)
# define DEBUG_LVL_PRINTF(lvl, fmt, ...)                                \
    do                                                                  \
    {                                                                   \
        if (((lvl) & DEBUG_LVL_MASK) <= (get_debug_flags() & DEBUG_LVL_MASK)) \
        {                                                               \
            SYS_DEBUG_Print(fmt, ##__VA_ARGS__);                        \
        }                                                               \
    }while (0)
# define DEBUG_LEVEL_FATAL(fmt, ...)  DEBUG_LVL_PRINTF(DEBUG_LVL_FATAL, "[!] " fmt, ##__VA_ARGS__)
# define DEBUG_LEVEL_ERROR(fmt, ...)  DEBUG_LVL_PRINTF(DEBUG_LVL_ERROR, "[*] " fmt, ##__VA_ARGS__)
# define DEBUG_LEVEL_WARN(fmt, ...)   DEBUG_LVL_PRINTF(DEBUG_LVL_WARN,  "[?] " fmt, ##__VA_ARGS__)
# define DEBUG_LEVEL_INFO(fmt, ...)   DEBUG_LVL_PRINTF(DEBUG_LVL_INFO,  "[#] " fmt, ##__VA_ARGS__)
# define DEBUG_LEVEL_DEBUG(fmt, ...)  DEBUG_LVL_PRINTF(DEBUG_LVL_DEBUG, "[.] " fmt, ##__VA_ARGS__)
#else
# define DEBUG_LVL_PRINTF(flags, fmt, ...)
# define DEBUG_LEVEL_FATAL(fmt, ...)
# define DEBUG_LEVEL_ERROR(fmt, ...)
# define DEBUG_LEVEL_WARN(fmt, ...)
# define DEBUG_LEVEL_INFO(fmt, ...)
# define DEBUG_LEVEL_DEBUG(fmt, ...)
#endif

#if (ENABLE_DEBUG_FLAG_PRINTF == 1)
# define DEBUG_FLAG_PRINTF(flags, fmt, ...)                             \
    do                                                                  \
    {                                                                   \
        if (((flags) & get_debug_flags()) == (flags))                   \
        {                                                               \
            SYS_DEBUG_Print(fmt, ##__VA_ARGS__);                        \
        }                                                               \
    }while (0)
#else
# define DEBUG_FLAG_PRINTF(flags, fmt, ...)
#endif

#if (ENABLE_DEBUG_FUNC_CALL == 1)
# define DEBUG_FUNC_CALL(flags)                                         \
    do                                                                  \
    {                                                                   \
        if (((flags) & get_debug_flags()) == (flags))                   \
        {                                                               \
            SYS_DEBUG_Print("%s\r\n", __func__);                        \
        }                                                               \
    }while (0)
#else
# define DEBUG_FUNC_CALL(flags)
#endif

//------------------------------------------------------------------------------
// Global Variables
//------------------------------------------------------------------------------

typedef enum {
    DEBUG_NONE                          = 0x00000000,

    // NOTE: Only enable 1 of the DEBUG_LVL flags at a time
    DEBUG_LVL_FATAL                     = 0x00000001,
    DEBUG_LVL_ERROR                     = 0x00000002,
    DEBUG_LVL_WARN                      = 0x00000003,
    DEBUG_LVL_INFO                      = 0x00000004,
    DEBUG_LVL_DEBUG                     = 0x00000005,

    // Used only for determining the current debug level
    DEBUG_LVL_MASK                      = 0x00000007,

    // OpsControl.c state machines
    DEBUG_OPS_CONTROL_SM                = 0x00000010,
    DEBUG_OPS_WRITE_FLASH_SM            = 0x00000020,
    DEBUG_OPS_READ_FLASH_SM             = 0x00000040,
    DEBUG_OPS_BLOCK_ERASE_SM            = 0x00000080,
    DEBUG_OPS_CLOSING_SM                = 0x00000100,
    DEBUG_OPS_TESTING_SM                = 0x00000200,

    // FirmwareControl.c state machines
    DEBUG_FIRM_UPDATE_SM                = 0x00000400,
    DEBUG_FIRM_UPDATE_PARSE_SM          = 0x00000800,

    // FW_Downloader.c state machines
    DEBUG_FW_TCP_SM                     = 0x00001000,
    DEBUG_FW_META_SM                    = 0x00002000,
    DEBUG_FW_DOWNLOAD_SM                = 0x00004000,

    // Flash_Helper.c state machine
    DEBUG_FLASH_SM                      = 0x00008000,

    // FWDL_sm.c state machines
    DEBUG_UPDATE_SM                     = 0x00010000,
    DEBUG_ETH_SM                        = 0x00020000,

    // Debug entry to tagged functions
    DEBUG_OPS_FUNCS                     = 0x10000000,
    DEBUG_FIRMWARE_FUNCS                = 0x20000000,
    DEBUG_UPDATE_FUNCS                  = 0x40000000,
    DEBUG_FLASH_FUNCS                   = 0x80000000,
} BOOT_DEBUG_FLAGS;

//------------------------------------------------------------------------------
// prototypes
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
/*!
 * @fn      void set_debug_flags(BOOT_DEBUG_FLAGS flags)
 *
 * @brief   Set the debug flags to use
 *
 * @details Stores the debug flags at a fixed address to be used on the next update.
 *
 * @param   flags a bitmask of the debug options to enable
 *
 * @return  Nothing
 */
//------------------------------------------------------------------------------
void set_debug_flags(BOOT_DEBUG_FLAGS flags);

//------------------------------------------------------------------------------
/*!
 * @fn      BOOT_DEBUG_FLAGS get_debug_flags(void)
 *
 * @brief   Returns the debug flags in use
 *
 * @details Retrieves the debug flags from a fixed address.
 *
 * @return  Bitmask of current flags.
 */
//------------------------------------------------------------------------------
BOOT_DEBUG_FLAGS get_debug_flags(void);

#endif // _X_DEBUG_FLAGS_H_X_

// vim: tabstop=4 shiftwidth=4 expandtab

