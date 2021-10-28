#!/bin/bash
# $PasswordstateUrl ='https://passwordstate/api/passwordlists/<PasswordListID>?format=<json or xml>'
# Invoke-Restmethod -Method Get -Uri $PasswordstateUrl -Header @{ "APIKey" = "<apikey>" }

url="https://pass.corp.lego.com:9119/api/passwordlists/3145?format=json"
data=""
