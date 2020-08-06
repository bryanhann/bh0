[[ "$0" == "./install.sh" ]] || { echo 'try ./install.sh' ; exit; }
git clone -b dev https://github.com/bryanhann/bh ./bh
echo export ZDOTDIR=$PWD/bh >> ~/.zprofile
echo export ZDOTDIR=$PWD/bh >> ~/.bashrc
zsh
