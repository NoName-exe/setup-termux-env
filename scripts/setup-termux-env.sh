#Update Package Info
echo 'UPDATING PACKAGE INFO...'
apt update -qq
echo 'DONE'
sleep 3

#Update Base Packages
echo 'UPDATING BASE PACKAGES...'
apt upgrade -qqy
echo 'DONE'
sleep 3

#Install Our Packages
#Bare Minimum List
echo 'INSTALLING NECESSARY PACKAGES...'
apt install -qqy --no-install-recommends \
bash-completion \
linux-man-pages \
man \
neofetch \
texinfo \
wget
echo 'DONE'
sleep 2

#Some Extra Packages That May Come In Handy Later
# binutils clang emacs fd figlet file fish fortune fsmon fzf gh hexedit
# htop jq leveldb links lld llvm lz4 lzip mc micro ncdu nmap openssh p7zip
# patchelf proot proot-distro pv python rclone rdiff-backup ripgrep rsync
# shellharden silversearcher-ag strace termux-api tmux tree vim zip zsh zstd

# Set Up Dotfiles
echo 'SETTING UP DOTFILES...'

#Remove Termux Motd
echo 'REMOVING TERMUX MOTD...'
sleep 2
rm -rf $PREFIX/etc/motd
echo 'DONE'

# Set Up Bashrc
echo 'SETTING UP BASHRC...'
sleep 2
cp -rf dots/bash.bashrc $PREFIX/etc/bash.bashrc
echo 'DONE'

#Set Up Neofetch
echo 'SETTING UP NEOFETCH...'
sleep 2
mkdir -p $HOME/.config/neofetch
touch $HOME/.config/neofetch/config.conf
cp -rf dots/config.conf $HOME/.config/neofetch/config.conf
echo 'DONE'

#Set Up Termux Extra Keys
echo 'SETTING UP EXTRA KEYS...'
sleep 2
cp -rf dots/termux.properties $HOME/.termux/termux.properties
echo 'DONE'

#Set Up Boot Scripts
echo 'SETTING UP BOOT SCRIPTS...'
sleep 2
mkdir -p $HOME/.termux/boot
touch $HOME/.termux/boot/clear_cache.sh
cp -rf dots/clear_cache.sh $HOME/.termux/boot/clear_cache.sh
echo 'DONE'

sleep 5
echo 'FINISHED SETTING UP DOTFILES'
sleep 5
exit
