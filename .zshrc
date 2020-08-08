pushd $ZDOTDIR
source ./globals.sh
source ./functions.sh

bh0include bh0.venv
venv_install
bh0include bh0.omzsh
omzsh_install
bh0include bh0.user.omzsh
bh0firstrun && {
	bh0export PATH	$PATH:$(venv_venv)/bin
	bh0export DEPTH 	-1
}

bh0export VIRTUALENVWRAPPER_PYTHON    $(venv_venv)/bin/python
bh0export VIRTUALENVWRAPPER_HOOK_DIR  $BH0_LOCAL/VIRTUALENVWRAPPER_HOOK_DIR
bh0export WORKON_HOME                 $BH0_LOCAL/WORKON_HOME
bh0export PROJECT_HOME                $BH0_LOCAL/PROJECT_HOME
bh0exec mkdir -p $PROJECT_HOME # vwrap does not create it automatically
#source virtualenvwrapper.sh

bh0source ./main.sh
bh0export DEPTH	$(( $DEPTH + 1 ))

bh0firstrun && {
	bh0export BHPID	$$
}

