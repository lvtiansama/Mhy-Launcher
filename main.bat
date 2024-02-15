@echo off

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else (
    goto gotAdmin
)

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B

:gotAdmin
if exist "%temp%\getadmin.vbs" ( 
    del "%temp%\getadmin.vbs"
)
pushd "%CD%"
CD /D "%~dp0"


Color 0A


echo 欢迎回来，你想要我帮你打开什么？
echo 1、原神
echo 2、崩坏：星穹铁道
choice /C 12 /M "你想要打开什么？"
if errorlevel 2 (
    tasklist /nh|find /i "StarRail.exe"

    IF NOT ERRORLEVEL 1 (
        echo 检测到有 StarRail.exe 正在运行。
        choice /C YN /M "是否关闭已打开的 StarRail.exe？"
        if errorlevel 2 (
            exit
        ) else if errorlevel 1 (
            taskkill /f /t /im StarRail.exe
        )
    ) else (
        echo 现在没有需要关闭的 StarRail.exe。
    )


    echo 你好开拓者，请选择你需要登陆的账号：
    echo 1、账号1
    echo 2、账号2

    choice /c 12 /n /m "请输入数字登录的账号："

    if errorlevel 2 (
        REG IMPORT "StarRail\账号1.reg"
    ) else if errorlevel 1 (
        REG IMPORT "StarRail\账号2.reg"
    )

    start "" "C:\Program Files\Star Rail\Game\StarRail.exe"
) else if errorlevel 1 (
    tasklist /nh|find /i "YuanShen.exe"

    IF NOT ERRORLEVEL 1 (
        echo 检测到有 YuanShen.exe 正在运行。
        choice /C YN /M "是否关闭已打开的 YuanShen.exe？"
        if errorlevel 2 (
            exit
        ) else if errorlevel 1 (
            taskkill /f /t /im YuanShen.exe
        )
    ) else (
        echo 现在没有需要关闭的 YuanShen.exe。
    )


    echo 你好旅行者，请选择你需要登陆的账号：
    echo 1、账号1
    echo 2、账号2
    echo 3、账号3

    choice /c 123 /n /m "请输入数字登录的账号："

    if errorlevel 3 (
        REG IMPORT "YuanShen\账号1.reg"
    ) else if errorlevel 2 (
        REG IMPORT "YuanShen\账号2.reg"
    ) else if errorlevel 1 (
        REG IMPORT "YuanShen\账号3.reg"
    )

    start "" "C:\Program Files\Genshin Impact\Genshin Impact Game\YuanShen.exe"
)

echo 正在为您执行
timeout /t 3 /nobreak >nul



exit
