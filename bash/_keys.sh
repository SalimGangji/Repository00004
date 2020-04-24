#!/bin/bash

declare -a keypairs=$(find Repository00004/vaultEncryptedSSHKeys/KeyPair00* -type f)
for keypair in ${keypairs[@]}; 
do
    cp $keypair ${HOME};
done

ansible-vault decrypt ${HOME}/KeyPair00* --ask-vault-pass
eval $(ssh-agent)
ssh-add ${HOME}/KeyPair00*
rm -rf ${HOME}/KeyPair00*
