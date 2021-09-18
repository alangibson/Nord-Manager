#!/bin/bash

# ==========Dependencies (needed in Ubuntu)

sudo apt install gir1.2-appindicator3-0.1

# =============== PIXMAPS
sudo cp app/icon_nordvpn.png /usr/share/pixmaps/
sudo cp app/icon_nordvpn_red.png /usr/share/pixmaps/
sudo cp app/icon_nordvpn_green.png /usr/share/pixmaps/



# =============== APPLICATIONS
sudo cp app/NordManager.desktop /usr/share/applications/


# =============== /usr/bin/
sudo cp app/nordmanager.sh /usr/bin/


# =============== /OPT/NORDMANAGER
sudo mkdir -p /opt/NordManager/
sudo cp app/nordmanager.py /opt/NordManager/
sudo cp app/toolbox.py /opt/NordManager/
sudo cp app/Peigne-plume-256-320.png /opt/NordManager/


# =============== settings file
sudo mkdir -p ~/.local/share/NordManager/
sudo cp app/data.json ~/.local/share/NordManager/
sudo cp app/default_data.json ~/.local/share/NordManager/

# =============== RIGHTS
sudo chmod -R 755 ~/.local/share/NordManager
sudo chown -R $USER ~/.local/share/NordManager

# =============== SERVICE

mkdir -p $HOME/.config/systemd/user
# cp app/nordmanager.service $HOME/.config/systemd/user
cat app/nordmanager.service | envsubst > $HOME/.config/systemd/user/nordmanager.service
sudo systemctl enable $HOME/.config/systemd/user/nordmanager.service
sudo systemctl start nordmanager.service

echo
echo
echo "Installation completed."
echo
echo "Nord Manager will be started on boot."
echo "If you don't want to run it on startup, run the command:"
echo "  sudo systemctl disable nordmanager.service"
echo 
echo "You can then start it manually by"
echo "  1. Opening the program menu by pressing the Super (aka Windows) key"
echo "  2. Typing Nord Manager to search for the program"
echo "  3. Clicking on the Nord Manager icon"
echo
echo "You can start it on the command line by running:"
echo "  nordmanager.sh"
echo
echo "Please read the readme file to know more."


