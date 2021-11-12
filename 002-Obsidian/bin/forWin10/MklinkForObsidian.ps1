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
$UserProfileBin = "%UserProfile%\bin"
#List file to copy
# $file1 = "K:\ObsidianWin\1-ObsidianVN\GithubCode\090-bin\MklinkForObsidian.ps1"




# Important 
$Source = "K:\ObsidianWin\Teaching\source-edit"

$Target1 = "K:\ObsidianWin\Teaching\target1"
$Target2 = "K:\ObsidianWin\Teaching\target2"
$Target3 = "K:\ObsidianWin\Teaching\target3"


# Add value into Array
# Example1
$ObsidianTarget = Write-Output $Target1 $Target2 $Target3

# Clone pkit into New empty folder
# show value of Array
$ObsidianTarget.foreach({
    
    # Create Dir "099-Attachment\2021\10"
    New-Item -ItemType "directory" -Path "$PSItem\" -Name "099-Attachment\2021\10" -Force | out-null    
    # cp $Source\.obsidian\* $PSItem\.obsidian

    # Copy folder `.obsidian` cho các Vaul
    $Folder = "$PSItem\.obsidian"
    # "Test to see if folder [$Folder] exists"
    if (Test-Path -Path $Folder) {
        "Path exists!"
        Remove-Item -Path "$PSItem\.obsidian" -Force -Recurse -Confirm:$false | out-null
        sleep -seconds 0.05
        Copy-Item -Path "$Source\.obsidian\" -Destination "$PSItem\.obsidian" -Recurse
    } else {
        "Path doesn't exist."
        Copy-Item -Path "$Source\.obsidian\" -Destination "$PSItem\.obsidian" -Recurse
    }
    
    
    # Sau khi copy thì xóa 8 file và tạo symlink 8 file. Tạo mới 2 empty file workspace and workspaces.json
    Remove-Item -Path "$PSItem\.obsidian\app.json" -Force -Recurse -Confirm:$false | out-null
    Remove-Item -Path "$PSItem\.obsidian\appearance.json" -Force -Recurse -Confirm:$false | out-null
    Remove-Item -Path "$PSItem\.obsidian\community-plugins.json" -Force -Recurse -Confirm:$false | out-null
    Remove-Item -Path "$PSItem\.obsidian\core-plugins.json" -Force -Recurse -Confirm:$false | out-null
    Remove-Item -Path "$PSItem\.obsidian\daily-notes.json" -Force -Recurse -Confirm:$false | out-null
    Remove-Item -Path "$PSItem\.obsidian\graph.json" -Force -Recurse -Confirm:$false | out-null
    Remove-Item -Path "$PSItem\.obsidian\hotkeys.json" -Force -Recurse -Confirm:$false | out-null
    Remove-Item -Path "$PSItem\.obsidian\templates.json" -Force -Recurse -Confirm:$false | out-null

    New-Item -ItemType SymbolicLink -Target "$Source\.obsidian\app.json" -Path "$PSItem\.obsidian\app.json" -Force | out-null
    New-Item -ItemType SymbolicLink -Target "$Source\.obsidian\appearance.json" -Path "$PSItem\.obsidian\appearance.json" -Force | out-null
    New-Item -ItemType SymbolicLink -Target "$Source\.obsidian\community-plugins.json" -Path "$PSItem\.obsidian\community-plugins.json" -Force | out-null
    New-Item -ItemType SymbolicLink -Target "$Source\.obsidian\core-plugins.json" -Path "$PSItem\.obsidian\core-plugins.json" -Force | out-null
    New-Item -ItemType SymbolicLink -Target "$Source\.obsidian\daily-notes.json" -Path "$PSItem\.obsidian\daily-notes.json" -Force | out-null
    New-Item -ItemType SymbolicLink -Target "$Source\.obsidian\graph.json" -Path "$PSItem\.obsidian\graph.json" -Force | out-null
    New-Item -ItemType SymbolicLink -Target "$Source\.obsidian\hotkeys.json" -Path "$PSItem\.obsidian\hotkeys.json" -Force | out-null
    New-Item -ItemType SymbolicLink -Target "$Source\.obsidian\templates.json" -Path "$PSItem\.obsidian\templates.json" -Force | out-null

    # # .obsidian
	# $folder = ".obsidian"
    # $files = Get-ChildItem "$Source\$folder" 
    # # $files = Get-ChildItem "K:\ObsidianWin\Teaching\source-edit\.obsidian\" -Recurse 
    # foreach ($f in $files){
    # $filename = Split-Path -Path "$f" -Leaf -Resolve
    # New-Item -ItemType SymbolicLink -Target "$Source\$folder\$filename" -Path "$PSItem\$folder\$filename" -Force | out-null
    # }

    # # $folder = ".obsidian"
    # # Get-ChildItem –Path "$Source\$folder" | Foreach-Object {
    # #     $filename = Split-Path -Path $_.FullName -Leaf -Resolve
    # #     # echo "$Source\$folder\$filename"
    # #     # echo "$PSItem\$folder\$filename"
    # #     New-Item -ItemType SymbolicLink -Target "$Source\$folder\$filename" -Path "$PSItem\$folder\$filename" -Force | out-null
    # # }
    
    
    
    
    
    # # .obsidian\snippets
    
    # # .obsidian\themes
    
	# # .obsidian\plugin
	
	# # .obsidian\plugins\asciinema-obsidian
    
    # # .obsidian\plugins\calendar
    
    # # .obsidian\plugins\cm-editor-syntax-highlight-obsidian
    
    # # .obsidian\plugins\code-block-copy
    
    # # .obsidian\plugins\dataview
    
    # # .obsidian\plugins\obsidian-admonition
    
    # # .obsidian\plugins\obsidian-budget-wysiwyg
    
    # # .obsidian\plugins\obsidian-day-planner
    
    # # .obsidian\plugins\obsidian-emoji-toolbar
    
    # # .obsidian\plugins\obsidian-excalidraw-plugin
    
    # # .obsidian\plugins\obsidian-kanban
    
    # # .obsidian\plugins\obsidian-outliner
    
    # # .obsidian\plugins\obsidian-relative-line-numbers
    
    # # .obsidian\plugins\sliding-panes-obsidian
    
    # # .obsidian\plugins\table-editor-obsidian
    
    # # .obsidian\plugins\templater-obsidian
    

    # Xóa folder 002-Obsidian ở các Vaul trước khi symlink.
    $Folder = '$PSItem\002-Obsidian'
    "Test to see if folder [$Folder] exists"
    if (Test-Path -Path $Folder) {
        "Path exists!"
        Remove-Item -Path "$PSItem\002-Obsidian" -Force -Recurse -Confirm:$false | out-null
    } else {
        "Path doesn't exist."
    }
      
    # Remove-Item -Path "K:\ObsidianWin\Teaching\target1\002-Obsidian" -Force -Recurse -Confirm:$false | out-null
    
    # 002-Obsidian\001-Home\009-Help Newbie\demo
    $folder = "002-Obsidian\001-Home\009-Help Newbie\demo"
    $files = Get-ChildItem "$Source\$folder" 
    # $files = Get-ChildItem "K:\ObsidianWin\Teaching\source-edit\.obsidian\" -Recurse 
    foreach ($f in $files){
    $filename = Split-Path -Path "$f" -Leaf -Resolve
    New-Item -ItemType SymbolicLink -Target "$Source\$folder\$filename" -Path "$PSItem\$folder\$filename" -Force | out-null
    }
	sleep -seconds 0.05
    # 002-Obsidian\001-Home\009-Help Newbie\Sample doc
    $folder = "002-Obsidian\001-Home\009-Help Newbie\Sample doc"
    $files = Get-ChildItem "$Source\$folder" 
    # $files = Get-ChildItem "K:\ObsidianWin\Teaching\source-edit\.obsidian\" -Recurse 
    foreach ($f in $files){
    $filename = Split-Path -Path "$f" -Leaf -Resolve
    New-Item -ItemType SymbolicLink -Target "$Source\$folder\$filename" -Path "$PSItem\$folder\$filename" -Force | out-null
    }
	sleep -seconds 0.05
    # 002-Obsidian\001-Home\009-Help Newbie\Cac plugins
    $folder = "002-Obsidian\001-Home\009-Help Newbie\Cac plugins"
    $files = Get-ChildItem "$Source\$folder" 
    # $files = Get-ChildItem "K:\ObsidianWin\Teaching\source-edit\.obsidian\" -Recurse 
    foreach ($f in $files){
    $filename = Split-Path -Path "$f" -Leaf -Resolve
    New-Item -ItemType SymbolicLink -Target "$Source\$folder\$filename" -Path "$PSItem\$folder\$filename" -Force | out-null
    }
	sleep -seconds 0.05
    # 002-Obsidian\001-Home\009-Help Newbie
    
    # 002-Obsidian\003-Templates
    $folder = "002-Obsidian\003-Templates"
    $files = Get-ChildItem "$Source\$folder" 
    # $files = Get-ChildItem "K:\ObsidianWin\Teaching\source-edit\.obsidian\" -Recurse 
    foreach ($f in $files){
    $filename = Split-Path -Path "$f" -Leaf -Resolve
    New-Item -ItemType SymbolicLink -Target "$Source\$folder\$filename" -Path "$PSItem\$folder\$filename" -Force | out-null
    }
	sleep -seconds 0.05
    # 002-Obsidian\008-Templater
    $folder = "002-Obsidian\008-Templater"
    $files = Get-ChildItem "$Source\$folder" 
    # $files = Get-ChildItem "K:\ObsidianWin\Teaching\source-edit\.obsidian\" -Recurse 
    foreach ($f in $files){
    $filename = Split-Path -Path "$f" -Leaf -Resolve
    New-Item -ItemType SymbolicLink -Target "$Source\$folder\$filename" -Path "$PSItem\$folder\$filename" -Force | out-null
    }
	sleep -seconds 0.05
    # 002-Obsidian\Attachment\pkit
    $folder = "002-Obsidian\Attachment\pkit"
    $files = Get-ChildItem "$Source\$folder" 
    # $files = Get-ChildItem "K:\ObsidianWin\Teaching\source-edit\.obsidian\" -Recurse 
    foreach ($f in $files){
    $filename = Split-Path -Path "$f" -Leaf -Resolve
    New-Item -ItemType SymbolicLink -Target "$Source\$folder\$filename" -Path "$PSItem\$folder\$filename" -Force | out-null
    }
	sleep -seconds 0.05
    # 002-Obsidian\bin
    
    # 002-Obsidian\Changelog
    
    # 002-Obsidian
    
    # 090-bin
    $folder = "090-bin"
    $files = Get-ChildItem "$Source\$folder" 
    # $files = Get-ChildItem "K:\ObsidianWin\Teaching\source-edit\.obsidian\" -Recurse 
    foreach ($f in $files){
    $filename = Split-Path -Path "$f" -Leaf -Resolve
    New-Item -ItemType SymbolicLink -Target "$Source\$folder\$filename" -Path "$PSItem\$folder\$filename" -Force | out-null
    }





    

	
	New-Item -ItemType SymbolicLink -Target "$Source\01-Obsidian-Newbie-Need-Help.md" -Path "$PSItem\01-Obsidian-Newbie-Need-Help.md" -Force | out-null
    # workspace and workspaces.json
    New-Item -ItemType "file" -Path "$PSItem\.obsidian\" -Name "workspaces.json" -Force | out-null
    New-Item -ItemType "file" -Path "$PSItem\.obsidian\" -Name "workspace" -Force | out-null

	
	# Show Message when done 1 repo
	sleep -seconds 0.5
	Write-Host "Create Symbolic-Link at $PSItem is DONE" -ForegroundColor Green -BackgroundColor Black
}) | out-null


    ####################################################
    #Check if symlink exist do mothing, if not: Create Symlink to %userprofile%\bin
    $filename = "$env:userprofile\bin\MklinkForObsidian.ps1"
    # "Test to see if folder [$Folder] exists"
    if (Test-Path -Path $filename -PathType Leaf) {
        "Symlink exists!"
        Remove-Item -Path "$env:userprofile\bin\MklinkForObsidian.ps1" -Force -Recurse -Confirm:$false | out-null
        sleep -seconds 0.05
        New-Item -ItemType SymbolicLink -Target "$Source\090-bin\MklinkForObsidian.ps1" -Path "$env:userprofile\bin\MklinkForObsidian.ps1" -Force | out-null
    } else {
        "Symlink doesn't exist."
        New-Item -ItemType SymbolicLink -Target "$Source\090-bin\MklinkForObsidian.ps1" -Path "$env:userprofile\bin\MklinkForObsidian.ps1" -Force | out-null
    }
