#!/bin/bash

## create sagas home dir and pull all scripts to local dir
SAGAS_HOME=$HOME/.sagas
mkdir -p $SAGAS_HOME

pushd .
cd $SAGAS_HOME
git clone https://github.com/samlet/sagas.git
cd sagas
chmod +x sagas-start.sh 
sudo ln -s $(pwd)/sagas-start.sh /usr/local/bin/sagas

popd

echo "all done."
