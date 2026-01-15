# MonitorSleep

モニターをスリープ状態にするシンプルなユーティリティ。
スリープ操作いらず、ショートカットをダブルクリックで即座にスリープ状態に移行します。

## 対応OS

- Windows
- macOS

## フォルダ構成

```
MonitorSleep/
├── windows/
│   ├── MonitorSleep.ps1   # メインのPowerShellスクリプト
│   └── MonitorSleep.bat   # 実行用バッチファイル
├── macos/
│   └── MonitorSleep.sh    # シェルスクリプト
└── README.md
```

## Windows

### 使い方

1. `windows/MonitorSleep.bat` をデスクトップにコピー
2. ダブルクリックで実行
3. モニターがスリープ状態になる
4. マウスを動かすかキーを押すと復帰

### 仕組み

Windows APIの`SendMessage`関数で`SC_MONITORPOWER`メッセージを送信し、モニターの電源を切る。Windowsの電源管理と同じメカニズムを使用。

## macOS

### 使い方

#### ターミナルから実行

```bash
./macos/MonitorSleep.sh
```

#### ダブルクリックで実行できるようにする

1. ターミナルで実行権限を付与:
   ```bash
   chmod +x macos/MonitorSleep.sh
   ```

2. Finderで右クリック → 「このアプリケーションで開く」→「ターミナル」を選択

または、Automatorでアプリケーション化することも可能。

### 仕組み

`pmset displaysleepnow`コマンドでディスプレイをスリープさせる。macOSの標準電源管理機能を使用。

## 安全性

- モニターの電源状態を変更するだけで、ファイルシステムには一切アクセスしない
- OSの標準的な電源管理APIを使用
- ファイル破損などのリスクはなし

## 補足

- mac環境は動作テストができていませんので、利用は自己責任でお願いします。<br>
（mac端末持ってないのです…すみません。）

---

# MonitorSleep (English)

A simple utility to put your monitor to sleep.
No manual steps needed—just double-click the shortcut to instantly put your monitor to sleep.

## Supported OS

- Windows
- macOS

## Folder Structure

```
MonitorSleep/
├── windows/
│   ├── MonitorSleep.ps1   # Main PowerShell script
│   └── MonitorSleep.bat   # Executable batch file
├── macos/
│   └── MonitorSleep.sh    # Shell script
└── README.md
```

## Windows

### Usage

1. Copy `windows/MonitorSleep.bat` to your desktop
2. Double-click to run
3. The monitor goes to sleep
4. Move the mouse or press any key to wake up

### How It Works

Uses the Windows API `SendMessage` function to send the `SC_MONITORPOWER` message, putting the monitor to sleep. This uses the same mechanism as Windows power management.

## macOS

### Usage

#### Run from Terminal

```bash
./macos/MonitorSleep.sh
```

#### Enable Double-Click Execution

1. Grant execute permission in Terminal:
   ```bash
   chmod +x macos/MonitorSleep.sh
   ```

2. In Finder, right-click → "Open With" → Select "Terminal"

Alternatively, you can create an application using Automator.

### How It Works

Uses the `pmset displaysleepnow` command to put the monitor to sleep. This utilizes macOS's standard power management functionality.

## Safety

- Only changes the monitor's power state; does not access the file system at all
- Uses the OS's standard power management API
- No risk of file corruption

## Notes

- The macOS version has not been tested, so please use it at your own risk.<br>
  (I don't have a Mac... sorry.)
