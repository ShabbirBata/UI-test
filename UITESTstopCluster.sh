#!/bin/bash
aws cloudformation describe-stacks --stack-name $1 --profile <profile name> > $2/$1_StackTemplate.json
cat $2/$1_StackTemplate.json | jq '.Stacks[].Parameters | map(if .ParameterKey == "AsgMaxSize" then . + {"ParameterValue" : "0"} else . end)' > $2/$1_StackParameters.json
aws cloudformation update-stack --stack-name $1 --use-previous-template --parameters file://$2/$1_StackParameters.json --profile <profile name>

json="{\"channel\": \"Slack-channel-name-here\", \"username\":\"Cluster-status-notification\", \"icon_emoji\":\"slack\", \"attachments\":[{\"color\":\"#0000FF\" , \"text\": \"$1 cluster is Stopped. \"}]}"
curl -s -d "payload=$json" "<Slack token here>"
