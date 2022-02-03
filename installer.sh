#!/bin/bash
# Bash Script for install tools
# Must run to install tool
#av4sin -- wobegone

clear
echo "
██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
";


if [ "$PREFIX" = "/data/data/com.termux/files/usr" ]; then
    INSTALL_DIR="$PREFIX/usr/share/doc/automap"
    BIN_DIR="$PREFIX/bin/"
    BASH_PATH="$PREFIX/bin/bash"
    TERMUX=true

elif [ "$(uname)" = "Darwin" ]; then
    INSTALL_DIR="/usr/local/automap"
    BIN_DIR="/usr/local/bin/"
    BASH_PATH="/bin/bash"
    TERMUX=false
else
    INSTALL_DIR="$HOME/.automap"
    BIN_DIR="/usr/local/bin/"
    BASH_PATH="/bin/bash"
    TERMUX=false

fi

echo "[✔] Checking directories...";
if [ -d "$INSTALL_DIR" ]; then
    echo "[◉] A directory was found! Do you want to replace it? [Y/n]:" ;
    read -r mama
    if [ "$mama" = "y" ]; then
        if [ "$TERMUX" = true ]; then
            rm -rf "$INSTALL_DIR"
            rm "$BIN_DIR/automap*"
        else
            sudo rm -rf "$INSTALL_DIR"
            sudo rm "$BIN_DIR/automap*"
        fi
    else
        echo "[✘] If you want to install you must remove previous installations [✘] ";
        echo "[✘] Installation failed! [✘] ";
        exit
    fi
fi
echo "[✔] Cleaning up old directories...";
if [ -d "$ETC_DIR/Wobegone" ]; then
    echo "$DIR_FOUND_TEXT"
    if [ "$TERMUX" = true ]; then
        rm -rf "$ETC_DIR/Wobegone"
    else
        sudo rm -rf "$ETC_DIR/Wobegone"
    fi
fi

echo "[✔] Installing ...";
echo "";
read -p "[*] Location: " urld
#git clone --depth=1 $urld "$INSTALL_DIR";
cp $urld -r "$INSTALL_DIR";
echo "#!$BASH_PATH
bash $INSTALL_DIR/automap.sh" "${1+"$@"}" > "$INSTALL_DIR/automap";
chmod +x "$INSTALL_DIR/automap";
if [ "$TERMUX" = true ]; then
    cp "$INSTALL_DIR/automap" "$BIN_DIR"
else
    sudo cp "$INSTALL_DIR/automap" "$BIN_DIR"
fi
rm "$INSTALL_DIR/automap";


if [ -d "$INSTALL_DIR" ] ;
then
    echo "";
    echo "[✔] Tool installed successfully! [✔]";
    echo "";
    echo "[✔]====================================================================[✔]";
    echo "[✔]      All is done!! You can execute tool by typing automap !        [✔]";
    echo "[✔]====================================================================[✔]";
    echo "";
else
    echo "[✘] Installation failed! [✘] ";
    exit
fi
