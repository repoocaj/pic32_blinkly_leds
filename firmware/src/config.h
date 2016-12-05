//****************************************************************************
// file name:       bootloader_config.h
// author:          Jeff Cooper, Cooper Software Consulting, LLC
//
// description:     Global program configuration settings
//
// Compiler:        XC32 (1.42)
//
// Processor:       PIC32MZ
// ***************************************************************************

#ifndef _X_CONFIG_H_X_
#define _X_CONFIG_H_X_

//------------------------------------------------------------------------------
// Header Files
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// #defines
//------------------------------------------------------------------------------

// If we're debugging make static variables visible 
#ifdef __DEBUG
#define STATIC
#else
#define STATIC static
#define NDEBUG
#endif

// Set to 1 to produce more detailed output when debugging.  Set to 0 to
// produce less output.
#define VERBOSE                     1

// Set to 1 to enable printing of debug messages. Set to 0 to compile without
// debug messages.
#define ENABLE_DEBUG_PRINTF         1

// Set to 1 to enable printing of debug messages that are enabled/disabled
// based on a debug level on the console.  Statement will print when their
// corrosponding debug level is <= to the level set vi set_debug_flags().  Set
// to 0 to compile without debug messages.
#define ENABLE_DEBUG_LVL_PRINTF     1

// Set to 1 to enable printing of debug messages that are enabled/disabled
// based on a debug flag on the console.  Statement will print when their
// corrosponding debug flag(s) is/are set vi set_debug_flags().  Set to 0 to
// compile without debug messages.
#define ENABLE_DEBUG_FLAG_PRINTF    1

// Set to 1 to enable printing when a function instrumented with
// DEBUG_FUNC_CALL() is executed.  Set to 0 to compile without function call
// messages.
#define ENABLE_DEBUG_FUNC_CALL      1

// Set to 1 to always accept the CRC of the downloaded data.  This can simplify
// debugging the download as you'll only need to download the app once to
// succesfully install it.
//
// TODO: Set to 0 for production code
#define ENABLE_CRC_CHEAT            0

//------------------------------------------------------------------------------
// Global Variables
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// prototypes
//------------------------------------------------------------------------------

#endif // _X_CONFIG_H_X_

// vim: tabstop=4 shiftwidth=4 expandtab
