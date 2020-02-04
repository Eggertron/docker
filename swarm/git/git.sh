#!/bin/bash

# This function can be added to your ~/.bashrc or ~/.profile or ~/.bash_profile
# or you can copy this script into your ~/bin/ folder

function git () {
    (docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git nahragde/git "$@")
}

git $@
