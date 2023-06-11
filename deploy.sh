#!/bin/bash

deploy_target="/home/www/"
exclude_from_deploy=(
    "deploy.sh"
    "LICENSE"
    "README.md"
    ".git"
    "*.swp"
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
    chown -R www:www /home/www
}

deploy
