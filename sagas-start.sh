#!/bin/bash
set -e

if [ $# -lt 1 ]; then	
	echo "assign a command, available commands: init, install, run, ..."
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

case "$CMD" in
	"node")		
		curl -fsSL https://raw.githubusercontent.com/samlet/sagas/master/sagas-node.sh | bash
		;;
	"java")
		curl -fsSL https://raw.githubusercontent.com/samlet/sagas/master/sagas-java.sh | bash
		;;	
	"run")
		if [ $# -gt 1 ]; then	
			target=$2
			echo "run $target ..."
		else
			echo "use: ...."
		fi
		;;
	*)
        echo "➽ execute script $CMD ..."
        update_sagas
		## curl -fsSL https://raw.githubusercontent.com/samlet/sagas/master/sagas-${CMD}.sh | bash
        bash $HOME/.sagas/sagas/sagas-${CMD}.sh
		;;
esac

