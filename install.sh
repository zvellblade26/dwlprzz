#!/bin/sh

echo "#####   1. CHECKING USER   #####"
sleep 2;
user=$(whoami)
echo "user is ----->$user<-----??   [Y/n]"

read ans
if [[ "$ans" =~ ^[Yy]$ || "$ans" == "" ]]; then
	continue
else
	echo "ERROR"
	echo "ERROR"
	echo "#####   Script has failed!   #####"
fi

# Refresh sudo privileges and keep them alive during the script execution
sudo -v
while true; do sudo -v; sleep 60; done &
	# Store the background process ID
	SUDO_LOOP_PID=$!
	cd "/home/$user" || { echo "Failed to change directory to HOME"; exit 1; }
	set -e  # Exit script on any error

# WORKING DIRECTORY
os="/home/$user/dwlprzz"

# Create directories if they don't exist
mkdir -p "/home/$user/.local/bin"

pac() {
	sudo pacman -S --needed --noconfirm "$@"
}

echo ""
echo ""
echo ""
echo "#####   2. INSTALLING PACKAGES   #####"
sleep 2;
# Installing Packages
pac base-devel brightnessctl dunst fastfetch foot fzf grim slurp || { echo "brightnessctl dunst fastfetch foot fzf grim slurp installation failed!"; exit 1; }
pac libinput libnotify meson neovim ntfs-3g pinta swayimg || { echo "libinput libnotify meson neovim ntfs-3g pinta installation failed!"; exit 1; }
pac pipewire pipewire-alsa pipewire-jack pipewire-pulse wireplumber || { echo "pipewire pipewire-alsa pipewire-jack pipewire-pulse wireplumber installation failed!"; exit 1; }
pac swaylock thunar tumbler tllist unzip wayland-protocols acpi bat mpv yazi || { echo "swaylock thunar tumbler tllist unzip wayland-protocols installation failed!"; exit 1; }
pac wev wl-clipboard wlroots wtype zip zoxide || { echo "wev wl-clipboard wlroots wtype zip zoxide installation failed!"; exit 1; }
pac firefox libreoffice-fresh || { echo "Firefox and LibreOffice installation failed!"; exit 1; }

# Creating Windows mounting Directories
mkdir -p "/home/$user/DATAd" "/home/$user/WINDOWS" "/home/$user/SamsungGalaxyA50"  || { echo "Failed to create directories"; exit 1; }

echo ""
echo ""
echo ""
echo "#####   4. CHECKING PACKAGES   #####"
sleep 2;
# List of packages to check
packages_to_check=(
	"base-devel" "brightnessctl" "dunst" "fastfetch" "foot" "fzf" "grim" "slurp"
	"libinput" "libnotify" "meson" "neovim" "ntfs-3g" "pinta" "swayimg"
	"pipewire" "pipewire-alsa" "pipewire-jack" "pipewire-pulse" "wireplumber"
	"swaylock" "thunar" "tumbler" "tllist" "unzip" "wayland-protocols" "acpi" "bat" "mpv" "yazi"
	"wev" "wl-clipboard" "wlroots" "wtype" "zip" "zoxide"
	"firefox" "libreoffice-fresh"
)
# Function to check if a package is installed
check_installed() {
	uninstalled_packages=()  # Array to hold uninstalled packages

		for pkg in "$@"; do
			if sudo pacman -Q "$pkg" > /dev/null 2>&1; then
				continue
			else
				uninstalled_packages+=("$pkg")  # Add uninstalled package to the array
			fi
		done

	 # Check if there are any uninstalled packages and echo them
	 if [ ${#uninstalled_packages[@]} -gt 0 ]; then
		 echo "The following packages are NOT installed:"
		 for uninstalled in "${uninstalled_packages[@]}"; do
			 echo "- $uninstalled"
		 done
		 echo "	    We need it for the system to work, install it!"
	 else
		 echo "All packages have successfully installed."
	 fi
 }

# Call the function with the list of packages
check_installed "${packages_to_check[@]}"

echo "startw" >> "/home/$user/.bash_profile"

echo ""
echo ""
echo ""
echo "#####   5. Killing sudo   #####"
sleep 2;
# At the end of the script, kill the background process to stop the loop
echo "killing sudo -v"
kill $SUDO_LOOP_PID
echo "Done"

echo ""
echo ""
echo ""
echo "######   #######   #     #   ######"
echo "#     #  #     #   ##    #   #     "
echo "#     #  #     #   #  #  #   ####  "
echo "#     #  #     #   #    ##   #     "
echo "######   #######   #     #   ######"
echo ""
echo ""
echo ""
echo "Do we Reboot? [Y/n]"
read ans
if [[ "$ans" =~ ^[Yy]$ || "$ans" == "" ]]; then
	echo "Rebooting"; sleep 3
	sudo systemctl reboot
else
	echo ""
	echo ""
	echo ""
	echo "#####   Script completed successfully!   #####"
fi
