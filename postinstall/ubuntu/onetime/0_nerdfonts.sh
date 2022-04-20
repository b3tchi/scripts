    #!/bin/bash
# install DroidSansMono Nerd Font --> u can choose another at: https://www.nerdfonts.com/font-downloads
echo "[-] Download fonts [-]"

getfont(){
    repoUrl="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0"
    fontName=$1

    echo " - $fontName"

    wget "$repoUrl/$fontName"
    unzip "$fontName" -d ~/.fonts
    rm "$fontName"
}

getfont "DroidSansMono.zip"
getfont "Iosevka.zip"

fc-cache -fv
