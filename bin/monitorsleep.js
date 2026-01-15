#!/usr/bin/env node
"use strict";

const { spawnSync } = require("child_process");

function run(command, args) {
  const result = spawnSync(command, args, { stdio: "inherit" });
  if (result.error) {
    console.error(result.error.message);
    process.exit(1);
  }
  process.exit(result.status ?? 0);
}

if (process.platform === "win32") {
  const psCommand =
    "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Monitor{[DllImport(\"user32.dll\")] public static extern IntPtr SendMessage(IntPtr hWnd,uint Msg,IntPtr wParam,IntPtr lParam);}'; [Monitor]::SendMessage([IntPtr]0xFFFF,0x0112,0xF170,2)";
  run("powershell.exe", [
    "-NoProfile",
    "-WindowStyle",
    "Hidden",
    "-ExecutionPolicy",
    "Bypass",
    "-Command",
    psCommand,
  ]);
}

if (process.platform === "darwin") {
  run("pmset", ["displaysleepnow"]);
}

console.error(`Unsupported platform: ${process.platform}`);
process.exit(1);
