#!/bin/bash
set -x
if [ "$1" == "beta" ]; then
    smversion scripting/get5/version.sp scripting/get5/manual_version.sp $TRAVIS_BUILD_NUMBER --gitcommit
    smbuilder --compiler=addons/sourcemod/scripting/spcomp
    cd builds/get5/
    zip -r get5.zip addons cfg/get5 LICENSE README.md
    export TRAVIS_TAG=${TRAVIS_TAG:-$(date +'%Y%m%d%H%M%S')-$(git log --format=%h -1)}
else
    smbuilder --compiler=addons/sourcemod/scripting/spcomp
    cd builds/get5/
    zip -r get5.zip addons cfg/get5 LICENSE README.md
fi
