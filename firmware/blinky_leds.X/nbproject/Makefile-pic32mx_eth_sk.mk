#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-pic32mx_eth_sk.mk)" "nbproject/Makefile-local-pic32mx_eth_sk.mk"
include nbproject/Makefile-local-pic32mx_eth_sk.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=pic32mx_eth_sk
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/blinky_leds.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/blinky_leds.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/system_config/pic32mx_eth_sk/bsp/bsp.c ../src/system_config/pic32mx_eth_sk/framework/system/clk/src/sys_clk_static.c ../src/system_config/pic32mx_eth_sk/framework/system/ports/src/sys_ports_static.c ../src/system_config/pic32mx_eth_sk/system_init.c ../src/system_config/pic32mx_eth_sk/system_interrupt.c ../src/system_config/pic32mx_eth_sk/system_exceptions.c ../src/system_config/pic32mx_eth_sk/system_tasks.c ../src/app.c ../src/main.c ../../../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c ../../../../../../../framework/system/devcon/src/sys_devcon.c ../../../../../../../framework/system/devcon/src/sys_devcon_pic32mx.c ../../../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../../../framework/system/tmr/src/sys_tmr.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/332284752/bsp.o ${OBJECTDIR}/_ext/173564073/sys_clk_static.o ${OBJECTDIR}/_ext/783931833/sys_ports_static.o ${OBJECTDIR}/_ext/1373386656/system_init.o ${OBJECTDIR}/_ext/1373386656/system_interrupt.o ${OBJECTDIR}/_ext/1373386656/system_exceptions.o ${OBJECTDIR}/_ext/1373386656/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1085120521/drv_tmr.o ${OBJECTDIR}/_ext/1424708930/sys_devcon.o ${OBJECTDIR}/_ext/1424708930/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o ${OBJECTDIR}/_ext/1137870/sys_tmr.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/332284752/bsp.o.d ${OBJECTDIR}/_ext/173564073/sys_clk_static.o.d ${OBJECTDIR}/_ext/783931833/sys_ports_static.o.d ${OBJECTDIR}/_ext/1373386656/system_init.o.d ${OBJECTDIR}/_ext/1373386656/system_interrupt.o.d ${OBJECTDIR}/_ext/1373386656/system_exceptions.o.d ${OBJECTDIR}/_ext/1373386656/system_tasks.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1085120521/drv_tmr.o.d ${OBJECTDIR}/_ext/1424708930/sys_devcon.o.d ${OBJECTDIR}/_ext/1424708930/sys_devcon_pic32mx.o.d ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o.d ${OBJECTDIR}/_ext/1137870/sys_tmr.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/332284752/bsp.o ${OBJECTDIR}/_ext/173564073/sys_clk_static.o ${OBJECTDIR}/_ext/783931833/sys_ports_static.o ${OBJECTDIR}/_ext/1373386656/system_init.o ${OBJECTDIR}/_ext/1373386656/system_interrupt.o ${OBJECTDIR}/_ext/1373386656/system_exceptions.o ${OBJECTDIR}/_ext/1373386656/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1085120521/drv_tmr.o ${OBJECTDIR}/_ext/1424708930/sys_devcon.o ${OBJECTDIR}/_ext/1424708930/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o ${OBJECTDIR}/_ext/1137870/sys_tmr.o

# Source Files
SOURCEFILES=../src/system_config/pic32mx_eth_sk/bsp/bsp.c ../src/system_config/pic32mx_eth_sk/framework/system/clk/src/sys_clk_static.c ../src/system_config/pic32mx_eth_sk/framework/system/ports/src/sys_ports_static.c ../src/system_config/pic32mx_eth_sk/system_init.c ../src/system_config/pic32mx_eth_sk/system_interrupt.c ../src/system_config/pic32mx_eth_sk/system_exceptions.c ../src/system_config/pic32mx_eth_sk/system_tasks.c ../src/app.c ../src/main.c ../../../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c ../../../../../../../framework/system/devcon/src/sys_devcon.c ../../../../../../../framework/system/devcon/src/sys_devcon_pic32mx.c ../../../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../../../framework/system/tmr/src/sys_tmr.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-pic32mx_eth_sk.mk dist/${CND_CONF}/${IMAGE_TYPE}/blinky_leds.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/332284752/bsp.o: ../src/system_config/pic32mx_eth_sk/bsp/bsp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/332284752" 
	@${RM} ${OBJECTDIR}/_ext/332284752/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/332284752/bsp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/332284752/bsp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/332284752/bsp.o.d" -o ${OBJECTDIR}/_ext/332284752/bsp.o ../src/system_config/pic32mx_eth_sk/bsp/bsp.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/173564073/sys_clk_static.o: ../src/system_config/pic32mx_eth_sk/framework/system/clk/src/sys_clk_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/173564073" 
	@${RM} ${OBJECTDIR}/_ext/173564073/sys_clk_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/173564073/sys_clk_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/173564073/sys_clk_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/173564073/sys_clk_static.o.d" -o ${OBJECTDIR}/_ext/173564073/sys_clk_static.o ../src/system_config/pic32mx_eth_sk/framework/system/clk/src/sys_clk_static.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/783931833/sys_ports_static.o: ../src/system_config/pic32mx_eth_sk/framework/system/ports/src/sys_ports_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/783931833" 
	@${RM} ${OBJECTDIR}/_ext/783931833/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/783931833/sys_ports_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/783931833/sys_ports_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/783931833/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/783931833/sys_ports_static.o ../src/system_config/pic32mx_eth_sk/framework/system/ports/src/sys_ports_static.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1373386656/system_init.o: ../src/system_config/pic32mx_eth_sk/system_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1373386656" 
	@${RM} ${OBJECTDIR}/_ext/1373386656/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1373386656/system_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1373386656/system_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1373386656/system_init.o.d" -o ${OBJECTDIR}/_ext/1373386656/system_init.o ../src/system_config/pic32mx_eth_sk/system_init.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1373386656/system_interrupt.o: ../src/system_config/pic32mx_eth_sk/system_interrupt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1373386656" 
	@${RM} ${OBJECTDIR}/_ext/1373386656/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1373386656/system_interrupt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1373386656/system_interrupt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1373386656/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1373386656/system_interrupt.o ../src/system_config/pic32mx_eth_sk/system_interrupt.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1373386656/system_exceptions.o: ../src/system_config/pic32mx_eth_sk/system_exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1373386656" 
	@${RM} ${OBJECTDIR}/_ext/1373386656/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1373386656/system_exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1373386656/system_exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1373386656/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1373386656/system_exceptions.o ../src/system_config/pic32mx_eth_sk/system_exceptions.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1373386656/system_tasks.o: ../src/system_config/pic32mx_eth_sk/system_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1373386656" 
	@${RM} ${OBJECTDIR}/_ext/1373386656/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1373386656/system_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1373386656/system_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1373386656/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1373386656/system_tasks.o ../src/system_config/pic32mx_eth_sk/system_tasks.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1085120521/drv_tmr.o: ../../../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1085120521" 
	@${RM} ${OBJECTDIR}/_ext/1085120521/drv_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1085120521/drv_tmr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1085120521/drv_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1085120521/drv_tmr.o.d" -o ${OBJECTDIR}/_ext/1085120521/drv_tmr.o ../../../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1424708930/sys_devcon.o: ../../../../../../../framework/system/devcon/src/sys_devcon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1424708930" 
	@${RM} ${OBJECTDIR}/_ext/1424708930/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1424708930/sys_devcon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1424708930/sys_devcon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1424708930/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/1424708930/sys_devcon.o ../../../../../../../framework/system/devcon/src/sys_devcon.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1424708930/sys_devcon_pic32mx.o: ../../../../../../../framework/system/devcon/src/sys_devcon_pic32mx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1424708930" 
	@${RM} ${OBJECTDIR}/_ext/1424708930/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/1424708930/sys_devcon_pic32mx.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1424708930/sys_devcon_pic32mx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1424708930/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/1424708930/sys_devcon_pic32mx.o ../../../../../../../framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o: ../../../../../../../framework/system/int/src/sys_int_pic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1140991836" 
	@${RM} ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o ../../../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1137870/sys_tmr.o: ../../../../../../../framework/system/tmr/src/sys_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1137870" 
	@${RM} ${OBJECTDIR}/_ext/1137870/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1137870/sys_tmr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1137870/sys_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1137870/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/1137870/sys_tmr.o ../../../../../../../framework/system/tmr/src/sys_tmr.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/_ext/332284752/bsp.o: ../src/system_config/pic32mx_eth_sk/bsp/bsp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/332284752" 
	@${RM} ${OBJECTDIR}/_ext/332284752/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/332284752/bsp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/332284752/bsp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/332284752/bsp.o.d" -o ${OBJECTDIR}/_ext/332284752/bsp.o ../src/system_config/pic32mx_eth_sk/bsp/bsp.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/173564073/sys_clk_static.o: ../src/system_config/pic32mx_eth_sk/framework/system/clk/src/sys_clk_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/173564073" 
	@${RM} ${OBJECTDIR}/_ext/173564073/sys_clk_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/173564073/sys_clk_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/173564073/sys_clk_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/173564073/sys_clk_static.o.d" -o ${OBJECTDIR}/_ext/173564073/sys_clk_static.o ../src/system_config/pic32mx_eth_sk/framework/system/clk/src/sys_clk_static.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/783931833/sys_ports_static.o: ../src/system_config/pic32mx_eth_sk/framework/system/ports/src/sys_ports_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/783931833" 
	@${RM} ${OBJECTDIR}/_ext/783931833/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/783931833/sys_ports_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/783931833/sys_ports_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/783931833/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/783931833/sys_ports_static.o ../src/system_config/pic32mx_eth_sk/framework/system/ports/src/sys_ports_static.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1373386656/system_init.o: ../src/system_config/pic32mx_eth_sk/system_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1373386656" 
	@${RM} ${OBJECTDIR}/_ext/1373386656/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1373386656/system_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1373386656/system_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1373386656/system_init.o.d" -o ${OBJECTDIR}/_ext/1373386656/system_init.o ../src/system_config/pic32mx_eth_sk/system_init.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1373386656/system_interrupt.o: ../src/system_config/pic32mx_eth_sk/system_interrupt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1373386656" 
	@${RM} ${OBJECTDIR}/_ext/1373386656/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1373386656/system_interrupt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1373386656/system_interrupt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1373386656/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1373386656/system_interrupt.o ../src/system_config/pic32mx_eth_sk/system_interrupt.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1373386656/system_exceptions.o: ../src/system_config/pic32mx_eth_sk/system_exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1373386656" 
	@${RM} ${OBJECTDIR}/_ext/1373386656/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1373386656/system_exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1373386656/system_exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1373386656/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1373386656/system_exceptions.o ../src/system_config/pic32mx_eth_sk/system_exceptions.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1373386656/system_tasks.o: ../src/system_config/pic32mx_eth_sk/system_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1373386656" 
	@${RM} ${OBJECTDIR}/_ext/1373386656/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1373386656/system_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1373386656/system_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1373386656/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1373386656/system_tasks.o ../src/system_config/pic32mx_eth_sk/system_tasks.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1085120521/drv_tmr.o: ../../../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1085120521" 
	@${RM} ${OBJECTDIR}/_ext/1085120521/drv_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1085120521/drv_tmr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1085120521/drv_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1085120521/drv_tmr.o.d" -o ${OBJECTDIR}/_ext/1085120521/drv_tmr.o ../../../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1424708930/sys_devcon.o: ../../../../../../../framework/system/devcon/src/sys_devcon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1424708930" 
	@${RM} ${OBJECTDIR}/_ext/1424708930/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1424708930/sys_devcon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1424708930/sys_devcon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1424708930/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/1424708930/sys_devcon.o ../../../../../../../framework/system/devcon/src/sys_devcon.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1424708930/sys_devcon_pic32mx.o: ../../../../../../../framework/system/devcon/src/sys_devcon_pic32mx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1424708930" 
	@${RM} ${OBJECTDIR}/_ext/1424708930/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/1424708930/sys_devcon_pic32mx.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1424708930/sys_devcon_pic32mx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1424708930/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/1424708930/sys_devcon_pic32mx.o ../../../../../../../framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o: ../../../../../../../framework/system/int/src/sys_int_pic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1140991836" 
	@${RM} ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o ../../../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1137870/sys_tmr.o: ../../../../../../../framework/system/tmr/src/sys_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1137870" 
	@${RM} ${OBJECTDIR}/_ext/1137870/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1137870/sys_tmr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1137870/sys_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/system_config" -I"../src/system_config/pic32mx_eth_sk" -I"../../../../../../../framework" -I"../../../../../../../framework/system/common" -I"../../../../../../../framework/system/devcon" -I"../../../../../../../framework/system" -I"../../../../../../../bsp/pic32mx_usb_sk2" -I"../src/system_config/pic32mx_eth_sk/framework" -I"../src/pic32mx_eth_sk" -I"../src/system_config/pic32mx_eth_sk/bsp" -Werror -Wall -MMD -MF "${OBJECTDIR}/_ext/1137870/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/1137870/sys_tmr.o ../../../../../../../framework/system/tmr/src/sys_tmr.c    -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/blinky_leds.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../../bin/framework/peripheral/PIC32MX795F512L_peripherals.a  
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_PIC32MXSK=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/blinky_leds.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ../../../../../../../bin/framework/peripheral/PIC32MX795F512L_peripherals.a      -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PIC32MXSK=1,--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/blinky_leds.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../../bin/framework/peripheral/PIC32MX795F512L_peripherals.a 
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/blinky_leds.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ../../../../../../../bin/framework/peripheral/PIC32MX795F512L_peripherals.a      -DXPRJ_pic32mx_eth_sk=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	${MP_CC_DIR}/xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/blinky_leds.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/pic32mx_eth_sk
	${RM} -r dist/pic32mx_eth_sk

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
