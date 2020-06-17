@echo off

REM Project:	netsh-tool
REM Author:		Joshua Moore
REM GitHub:		github.com/tycrek
REM License:	GNU GPL v3.0


SETLOCAL EnableDelayedExpansion
CLS


REM Enter predefined values here
REM IP, Subnet, and Gateway can be enclosed in ""
REM DNS for some reason can't be... netsh issue
SET pre_ip="10.235.1.235"
SET pre_subnet="255.255.0.0"
SET pre_gateway="10.235.0.1"
SET pre_dns1=1.1.1.1
SET pre_dns2=1.0.0.1


REM ################ Check if Administrator CMD ################

NET SESSION >nul 2>&1
IF %ERRORLEVEL%==0 (
	GOTO MAIN
) ELSE (
	ECHO/
	ECHO Must be running as admin!
	GOTO QUIT
)


:MAIN

REM ################ Display currently connected interfaces ################

ECHO/
ECHO Available (connected) interfaces:
ECHO/
SET /a count=1
FOR /f "tokens=1,2,3*" %%i in ('netsh int show int') DO (
	IF %%j equ Connected (
		SET /a count+=1
		SET "interface!count!=%%l"
		ECHO   Interface !count!: %%l
	)
)


REM ################ Select an interface ################

ECHO/
ECHO Select an Interface Number from above
SET /p num="> "
SET interface=!interface%num%!
CLS

ECHO/
ECHO Using interface: !interface!


REM ################ Select a task ################
ECHO/
ECHO Select a task
ECHO   1) DHCP (auto DNS)
ECHO   2) DHCP (custom DNS)
ECHO   3) Static (interactive)
ECHO   4) Static (predefined)
SET /p task="> "
CLS
 
ECHO/
IF %task%==1 (
	SET autodns="true"
	GOTO DHCP
)
IF %task%==2 (
	SET autodns="false"
	GOTO DHCP
)
IF %task%==3 (
	SET interactive="true"
	GOTO STATIC
)
IF %task%==4 (
	SET interactive="false"
	GOTO STATIC
)
GOTO QUIT


REM ################ Create a DHCP configuration ################
:DHCP
ECHO/
IF %autodns%=="true" (
	ECHO DHCP - auto DNS
	ECHO/
	netsh int ip set add "!interface!" dhcp >nul 2>&1
	netsh int ip set dns "!interface!" dhcp >nul 2>&1
) ELSE (
	ECHO DHCP - custom DNS
	ECHO/
	SET /p dns1="DNS Server 1: "
	SET /p dns2="DNS Server 2: "
	ECHO/
	netsh int ip set add "!interface!" dhcp >nul 2>&1
	netsh int ip set dns "!interface!" static !dns1! primary validate=no >nul 2>&1
	netsh int ip add dns "!interface!" !dns2! index=2 validate=no >nul 2>&1
)
GOTO QUIT


REM ################ Create a Static configuration ################
:STATIC
ECHO/
if %interactive%=="true" (
	ECHO Static - interactive
	ECHO/
	SET /p ip="IP Address: "
	SET /p subnet="Subnet mask: "
	SET /p gateway="Gateway: "
	SET /p dns1="DNS Server 1: "
	SET /p dns2="DNS Server 2: "
	ECHO/
	netsh int ip set add "!interface!" static !ip! !subnet! !gateway! >nul 2>&1
	netsh int ip set dns "!interface!" static !dns1! primary validate=no >nul 2>&1
	netsh int ip add dns "!interface!" !dns2! index=2 validate=no >nul 2>&1
) ELSE (
	ECHO Static - predefined
	ECHO Note: To edit predefined values, edit this script directly
	ECHO/
	netsh int ip set add "!interface!" static %pre_ip% %pre_subnet% %pre_gateway% >nul 2>&1
	netsh int ip set dns "!interface!" static %pre_dns1% primary validate=no >nul 2>&1
	netsh int ip add dns "!interface!" %pre_dns2% index=2 validate=no >nul 2>&1
)
GOTO QUIT

:QUIT
IPCONFIG /flushdns >nul 2>&1
ECHO Completed.
ECHO/
PAUSE
CLS

REM I hate batch
