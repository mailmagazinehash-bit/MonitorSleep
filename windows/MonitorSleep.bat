@echo off
powershell -NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass ^
  -Command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Monitor{[DllImport(\"user32.dll\")] public static extern IntPtr SendMessage(IntPtr hWnd,uint Msg,IntPtr wParam,IntPtr lParam);}'; [Monitor]::SendMessage([IntPtr]0xFFFF,0x0112,0xF170,2)"
