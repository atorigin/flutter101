# VScode 開發 flutter 起手紀錄

## 選擇 devices
F1 -> Flutter: Select Device

## 基於 Windows 的設定 (Windows 有裝 WSL2 )
1. F1 -> Flutter: new Project
2. F1 -> Preference: Open Workspace Settings (JSON)
3. 在 Workspace JSON 新增

```
{
    "terminal.integrated.profiles.windows": {
        "PowerShell": {
            "source": "PowerShell",
            "icon": "terminal-powershell"
        },
        "Command Prompt": {
            "path": [
                "${env:windir}\\Sysnative\\cmd.exe",
                "${env:windir}\\System32\\cmd.exe"
            ],
            "args": [],
            "icon": "terminal-cmd"
        },
        "Git Bash": {
            "source": "Git Bash"
        }
    },
    "terminal.integrated.defaultProfile.windows": "PowerShell",
}
```
