#!/bin/bash
set -e

if [ $# -lt 1 ]; then	
	echo "assign a command, available commands: node, java, js, run, upgrade, destroy, ..."
	exit -1
fi

SAGAS_HOME=$HOME/.sagas
SAGAS_REPO=$SAGAS_HOME/sagas
CMD=$1

function update_sagas(){
	if [ ! -d "$SAGAS_REPO" ]; then
	  echo "no .sagas repo folder, exit."
	  exit 0
	fi
    pushd .

    echo "➽ update sagas repo ..."
    cd $SAGAS_REPO    
    git pull
    popd
}

function destroy_sagas(){
    rm -rf ~/.sagas
    sudo rm /usr/local/bin/sagas
}

case "$CMD" in
	"destroy")		
		destroy_sagas
		;;
	"upgrade")
		destroy_sagas
        curl -fsSL https://raw.githubusercontent.com/samlet/sagas/master/sagas.sh | bash
		;;	
	"run")
        ## for instance: $ sagas run images
		if [ $# -gt 1 ]; then	
			target=${@:2}
			echo "with args $target ..."
            docker $target
		else
			echo "unknown: " $*
		fi
		;;
    "dev")
        testing_target=$2
        echo "♬ testing target is ${testing_target} with args  ${@:3}..."
        bash /vagrant/sagas/sagas-${testing_target}.sh ${@:3}
        ;;
	*)
        echo "➽ execute script $CMD ..."
        update_sagas
		## curl -fsSL https://raw.githubusercontent.com/samlet/sagas/master/sagas-${CMD}.sh | bash
        bash $HOME/.sagas/sagas/sagas-${CMD}.sh
		;;
esac

