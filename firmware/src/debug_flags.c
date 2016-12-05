//****************************************************************************
// file name:       debug_flags.c
// author:          Jeff Cooper, Cooper Software Consulting, LLC
//
// description:     API for setting and getting debug flags
//
// Compiler:        XC32 (1.42)
//
// Processor:       PIC32MZ
// ***************************************************************************

//------------------------------------------------------------------------------
// Header Files
//------------------------------------------------------------------------------

#include "debug_flags.h"
#include "boot_launcher.h"		// for BOOT_LAUNCHER_DEBUG_FLAGS_ADDRESS

//------------------------------------------------------------------------------
// #defines
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Global Variables
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Internal functions 
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// API
//------------------------------------------------------------------------------

void set_debug_flags(BOOT_DEBUG_FLAGS flags)
{
    BOOT_DEBUG_FLAGS * p_debug_flags = (BOOT_DEBUG_FLAGS *) BOOT_LAUNCHER_DEBUG_FLAGS_ADDRESS;

    *p_debug_flags = flags;
}

BOOT_DEBUG_FLAGS get_debug_flags(void)
{
    return *((BOOT_DEBUG_FLAGS *)BOOT_LAUNCHER_DEBUG_FLAGS_ADDRESS);
}

// vim: tabstop=4 shiftwidth=4 expandtab
