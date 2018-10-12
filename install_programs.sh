if hash apt-get 2>/dev/null; then
  MANAGER="apt-get"
  REPO_MANAGER="add-apt-repository"
  sudo $MANAGER -y install software-properties-common
# elif hash yum 2>/dev/null; then
#   MANAGER="yum"
#   REPO_MANAGER="yum-config-manager --add-repo"
#   sudo $MANAGER -y install yum-utils
else
  echo "No package manager found."
  exit 1
fi

##### Adding repositories #####
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# TODO: check if its elementary
sudo $REPO_MANAGER -y ppa:philip.scott/elementary-tweaks

# https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa
sudo $REPO_MANAGER -y ppa:graphics-drivers

sudo $REPO_MANAGER -y ppa:teejee2008/ppa

# TODO: check if its a laptop
sudo $REPO_MANAGER -y ppa:linrunner/tlp

sudo $MANAGER -y install apt-transport-https
sudo $MANAGER update

##### INSTALLATION ######
# TODO: check if its elementary
sudo $MANAGER -y install elementary-tweaks
# TODO: check if its a laptop
sudo $MANAGER -y install tlp tlp-rdw

sudo $MANAGER -y install git python3 python3-pip g++ gcc vim gnome-disk-utilities winbind wine playonlinux steam xclip code ukuu

# Installing python pakages
python3 -m pip install --upgrade pip
pip install --user scipy numpy requests django tensorflow keyboard mouse

# Installing vscode settings sync
code --install-extension shan.code-settings-sync --force
echo "Use this gist: https://gist.github.com/eHonnef/aaea5b529451bf067ce3b854e17d0428"
