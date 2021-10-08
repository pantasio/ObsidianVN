# Created by Pantasio
<# 
	Last Update:
        2021-08-04 19:17
#>

<#
	How To Use
	
#>

#make script run global
#Copy to userprofile bin
#$UserProfileBin = "%UserProfile%\bin"
#List file to copy
$file1 = "K:\Obsidian\Pkit\002-Obsidian\bin\Create-new-Obsidian-vaul.ps1"




# Important 
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