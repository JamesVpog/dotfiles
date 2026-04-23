# README

if installed on Windows and using WSL, run the following in powershell
```
[System.Environment]::SetEnvironmentVariable(
  "WEZTERM_CONFIG_FILE",
  "\\wsl.localhost\Ubuntu\home\<YOUR-USER>\dotfiles\wezterm\.config\wezterm\wezterm.lua",
  "User"
)
```
