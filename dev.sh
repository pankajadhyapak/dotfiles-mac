#!/bin/zsh
#install global go deps
go install mvdan.cc/gofumpt@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/segmentio/golines@latest


#php deps
composer g require psy/psysh:@stable
composer g require phpstan/phpstan:@stable
composer g require friendsofphp/php-cs-fixer:@stable

#terraform
tfenv install 1.3.7

# node
nvm install --lts
nvm use --lts


#gobrew
curl -sLk https://raw.githubusercontent.com/kevincobain2000/gobrew/master/git.io.sh | sh
gobrew use 1.21
