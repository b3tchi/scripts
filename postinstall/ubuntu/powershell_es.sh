#!/bin/bash
#not used yet missing proper setup still dependent od coc-powershell

#create execution folder
mkdir -p ~/.local/bin/powershell_es

#go to bin folder
cd ~/.local/bin/powershell_es

#dowload latest version
wget https://github.com/PowerShell/PowerShellEditorServices/releases/download/v3.0.1/PowerShellEditorServices.zip

#unzip
unzip PowerShellEditorServices.zip

#cleanup dowload
rm PowerShellEditorServices.zip

#return previous directory
cd -
