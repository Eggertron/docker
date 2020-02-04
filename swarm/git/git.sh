#!/bin/bash

# This function can be added to your ~/.bashrc or ~/.profile or ~/.bash_profile

function git () {
    (docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git nahragde/git "$@")
}

git $@
