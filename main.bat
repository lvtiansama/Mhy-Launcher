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


echo ��ӭ����������Ҫ�Ұ����ʲô��
echo 1��ԭ��
echo 2���������������
choice /C 12 /M "����Ҫ��ʲô��"
if errorlevel 2 (
    tasklist /nh|find /i "StarRail.exe"

    IF NOT ERRORLEVEL 1 (
        echo ��⵽�� StarRail.exe �������С�
        choice /C YN /M "�Ƿ�ر��Ѵ򿪵� StarRail.exe��"
        if errorlevel 2 (
            exit
        ) else if errorlevel 1 (
            taskkill /f /t /im StarRail.exe
        )
    ) else (
        echo ����û����Ҫ�رյ� StarRail.exe��
    )


    echo ��ÿ����ߣ���ѡ������Ҫ��½���˺ţ�
    echo 1���˺�1
    echo 2���˺�2

    choice /c 12 /n /m "���������ֵ�¼���˺ţ�"

    if errorlevel 2 (
        REG IMPORT "StarRail\�˺�1.reg"
    ) else if errorlevel 1 (
        REG IMPORT "StarRail\�˺�2.reg"
    )

    start "" "C:\Program Files\Star Rail\Game\StarRail.exe"
) else if errorlevel 1 (
    tasklist /nh|find /i "YuanShen.exe"

    IF NOT ERRORLEVEL 1 (
        echo ��⵽�� YuanShen.exe �������С�
        choice /C YN /M "�Ƿ�ر��Ѵ򿪵� YuanShen.exe��"
        if errorlevel 2 (
            exit
        ) else if errorlevel 1 (
            taskkill /f /t /im YuanShen.exe
        )
    ) else (
        echo ����û����Ҫ�رյ� YuanShen.exe��
    )


    echo ��������ߣ���ѡ������Ҫ��½���˺ţ�
    echo 1���˺�1
    echo 2���˺�2
    echo 3���˺�3

    choice /c 123 /n /m "���������ֵ�¼���˺ţ�"

    if errorlevel 3 (
        REG IMPORT "YuanShen\�˺�1.reg"
    ) else if errorlevel 2 (
        REG IMPORT "YuanShen\�˺�2.reg"
    ) else if errorlevel 1 (
        REG IMPORT "YuanShen\�˺�3.reg"
    )

    start "" "C:\Program Files\Genshin Impact\Genshin Impact Game\YuanShen.exe"
)

echo ����Ϊ��ִ��
timeout /t 3 /nobreak >nul



exit
