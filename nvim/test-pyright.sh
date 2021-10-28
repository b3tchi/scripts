#!/bin/bash

mkdir test_python_project
cd test_python_project
git init
touch main.py

nvim main.py -c :LspInfo
