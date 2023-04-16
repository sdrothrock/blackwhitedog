#!/bin/bash

deploy_target="../current/"
exclude_from_deploy=(
	"deploy.sh"
	"LICENSE"
	"README.md"
)
exclusion_args=""

# Build exclusion string for rysnc
for i in "${exclude_from_deploy[@]}"; do
	exclusion_args+="--exclude $i "
done

echo "Deploying to $deploy_target"
echo "Excluding: ${exclude_from_deploy[@]}"

deploy() {
	rsync -av --delete ./ $deploy_target $exclusion_args
}

deploy
