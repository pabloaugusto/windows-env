#Allow powershell execute scripts
#Set-ExecutionPolicy -ExecutionPolicy Bypass		# no one scripts must be signed
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned 	# only remote scripts must be signed


#install power shell modules
Install-Module posh-git -Force
Install-Module oh-my-posh -Force
Install-Module posh-docker -Force
Install-Module devtoolbox #aliases for terminal (git, docker, composer, etc) https://github.com/MichaelJolley/devtoolbox
Install-Module Get-ChildItemColor
Install-Module CredentialManager -Force
Install-Module Terminal-Icons
	Install-Module -Name PowerShellGet -Force
	Install-Module PSReadLine -AllowPrerelease -Force
	Install-Module PSReadLine
Install-Script Get-Parameter




# select choco packages to install
$Packages = @(

###########################################
# choco extensions
###########################################
	"chocolatey-core.extension",
	"chocolatey-windowsupdate.extension",
	"choco-cleaner",

###########################################
# Web browsers
###########################################
	"googlechrome",
	"firefox", #-params "/NoTaskbarShortcut /NoDesktopShortcut"

###########################################
# start apps
###########################################
	"lightshot.install",
	"qbittorrent",
	"screentogif",
	"vlc",
	"jre8",
	"7zip",
	"clipdiary",
	"steam",
	"autohotkey",
	"spotube",
	"audacity",
	"puretext",
#	"winrar",
#	"greenshot",
#	"irfanview",

###########################################
# Communication Apps
###########################################
	"whatsapp",
	"telegram",
	"slack",
	"zoom",
	"skype",

###########################################
# film maker and streamm
###########################################
	"obs-studio",
	"voicemeeter.install",
	"voicemeeter",
	"voicemeeter-banana",
	"voicemeeter-potato",
	"vb-cable",
	"scrcpy",	#mobile screen share
	"adb", 		#driver iser by scrcpy
	"ffmpeg",
	"youtube-dl",
	"touchportal",
	"steam-rom-manager",
	"sony-imaging-edge-webcam",
	#"streamdeck",
	#"obs-virtualcam",
	#"droidcam-obs-plugin",

###########################################
# tech apps
###########################################
	"coretemp",
	"cpu-z",
	"crystaldiskmark",
	"crystaldiskinfo",
	"everything",
	"winscp",
	"putty.install",
	"sysinternals",
#	"teamviewer",
#	"typora",
#	"microsoft-windows-terminal",
#	"wireguard",
#	"wireshark",

###########################################
# Project Managment Tools
###########################################
"figma",

###########################################
# dev tools
###########################################
	"git",
	"gh", #github CLI
	"vscode",
	"visualstudio2022community"
	"notepadplusplus.install",
	"ngrok"
	"fiddler",
	"rapidee", #windows env vars editor
	"python",
	"php",
	"snoop", #windows wpf spy as tree (inspect/debug web browser render and actions as tree)
	"postman",
	#"yarn",
	#"docker-desktop",
	#"terraform",
	#"kubernetes-helm",
	#"kubernetes-cli",
	#"azure-cli",
	#"tortoisegit",
	#"filezilla",
	#"nodejs",
	#"winmerge",
	#"graphviz", #needed for Terraform visualizer and VS Code Graphviz preview

###########################################
# windows terminal & powershell
###########################################
	"terminal-icons.powershell",
	"oh-my-posh", #formart windows shell with git colored infos
	"poshgit",
	"nerd-fonts-hack",
	"conemu" #alternative win terminal
)





#dont change nothing
function Install-ChocoPackage {

    [cmdletbinding()]
    param(
        [String]$PackageName
    )

    $ChocoLibPath = "C:\ProgramData\chocolatey\lib"

    if(-not(test-path $ChocoLibPath)){
        Set-ExecutionPolicy Bypass -Scope Process -Force;
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    }

    #Test if the package folder exists on Choco Lib folder
    if (!((test-path "$ChocoLibPath\$PackageName"))) {

        Write-Host "[INFO]Installing $PackageName..." -ForegroundColor Yellow
        $start_time = Get-Date
        #Install the package without confirmation prompt
        choco install -y -v $PackageName
        Write-Host "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

    }
    else {

        Write-host  "[INFO]$PackageName is already installed." -ForegroundColor Green
    }
}

#Loop through each package to install them
foreach($Package in $Packages){
    Install-ChocoPackage -PackageName $Package
}