# Created by Pantasio
<# 
Changelog:
	20210816
	khong dung symbolic link nữa mà copy từng repo.

#>

<#
How To Use
	Trường hợp 1: Bạn là người 
#>
# If you just modify Obsidian 
# Copy modify repo into $Source
# and then sync to all repo 
# New ideal is find some app sync with win10 or some tool auto doing this task
# 20210816 testing use freefilesync
$justconfig = ""

#make script run global
#Copy to userprofile bin
#$UserProfileBin = "%UserProfile%\bin"
#List file to copy
$file1 = "K:\Obsidian\Pkit\002-Obsidian\bin\Create-new-Obsidian-vaul.ps1"




# Important
# List below is all your repo: Target1, Target2 ...
$Source = "K:\Obsidian\Pkit"

$Target1 = "K:\Obsidian\cli-help"
$Target2 = "K:\thejoli.us\Doc"
$Target3 = "K:\mydotfiles\windotfiles"
$Target4 = "K:\Obsidian\Teaching\test-git-hardlink\new-vaul-target3"



# Add value into Array
# Example1
$ObsidianTarget = Write-Output $Target1 $Target2 $Target3 $Target4

# Clone pkit into New empty folder
# show value of Array
$ObsidianTarget.foreach({
	New-Item -ItemType SymbolicLink -Target "$Source\.obsidian" -Path "$PSItem\.obsidian" -Force | out-null
	New-Item -ItemType SymbolicLink -Target "$Source\002-Obsidian" -Path "$PSItem\002-Obsidian" -Force | out-null
	New-Item -ItemType "directory" -Path "$PSItem\" -Name "099-Attachment" -Force | out-null
	#New-Item -ItemType SymbolicLink -Target "$Source\LICENSE" -Path "$PSItem\LICENSE" -Force | out-null
	New-Item -ItemType SymbolicLink -Target "$Source\README-Obsidian.md" -Path "$PSItem\README-Obsidian.md" -Force | out-null
	New-Item -ItemType SymbolicLink -Target "$Source\Home-Obsidian.md" -Path "$PSItem\Home-Obsidian.md" -Force | out-null
	
	# Show Message when done 1 repo
	sleep -seconds 0.5
	Write-Host "Create Symbolic-Link at $PSItem is DONE" -ForegroundColor Green -BackgroundColor Black
	})


#Copy script into %userprofile%\bin
	Copy-Item $file1 -Destination $env:userprofile\bin

