# MonitorSleep.ps1 - Monitor Sleep Script
# Win32 API SendMessage to turn off monitor

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Monitor {
    [DllImport("user32.dll")]
    public static extern IntPtr SendMessage(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);
}
"@

$HWND_BROADCAST = [IntPtr]0xFFFF
$WM_SYSCOMMAND = 0x0112
$SC_MONITORPOWER = 0xF170
$MONITOR_OFF = 2

[Monitor]::SendMessage($HWND_BROADCAST, $WM_SYSCOMMAND, $SC_MONITORPOWER, $MONITOR_OFF)
