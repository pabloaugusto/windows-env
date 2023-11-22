# Instalaçao de ambiente Windows

Utilização do chocolatey e do boxtarter para instalar tudo necessário após a instalação do windows

## Arquivos de configuração e profiles

### PowerShell

#### [PowerShell Config]((https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_powershell_config))

Create / Edit the ``powershell.config.json`` at one of this directories:

- User level: ``Split-Path $PROFILE.CurrentUserCurrentHost``
- All users level: ``$PSHOME``

#### [PowerShell Profiles](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles#profile-types-and-locations)

Create / Edit the profile file at one of this directories:

- **Current user, Current Host** ``$PROFILE.CurrentUserCurrentHost``
- Current User, All Hosts ``$PROFILE.CurrentUserAllHosts``
- All Users, Current Host ``$PROFILE.AllUsersCurrentHost``
- All Users, All Hosts ``$PROFILE.AllUsersAllHosts``

## Windows Package Managers

- [Scoop](https://scoop.sh/)
- [Chocolatey](https://chocolatey.org/)
- [Winget](https://github.com/microsoft/winget-cli)
  - Install from Scoop ``scoop install winget``

## Apps

- [Scoop Tray](https://github.com/foosel/scoop-tray)
- [Windows terminal](https://github.com/microsoft/terminal)
- [gSudo](https://gerardog.github.io/gsudo/)
- [PowerShell 7](https://community.chocolatey.org/packages/powershell-core)
