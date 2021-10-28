#!/bin/bash

mkdir test_bashlsp
cd test_bashlsp
git init
touch script.sh

nvim script.sh -c :LspInfo
