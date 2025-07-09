#!/bin/zsh

# php deps
composer g require psy/psysh:@stable
composer g require phpstan/phpstan:@stable --dev
composer g require friendsofphp/php-cs-fixer:@stable --dev

# terraform
tfenv install 1.6.0

# gobrew
curl -sLk https://raw.githubusercontent.com/kevincobain2000/gobrew/master/git.io.sh | sh
gobrew use latest

# install global go deps
go install mvdan.cc/gofumpt@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/segmentio/golines@latest
