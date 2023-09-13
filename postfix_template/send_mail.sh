#!/bin/bash

# メールの宛先アドレス。引数で受け取る。
recipient="$1"

# Postfixコンテナを起動
docker-compose up -d

# Postfixコンテナ内でメールを送信
# docker-compose exec postfix bash -c "echo 'This is a test email from Docker Postfix' | mail -s 'Test Email' $recipient"
# TODO 動かない。。
docker-compose exec postfix bash -c "echo 'This is a test email from Docker Postfix' | sendmail $recipient"

# Postfixコンテナを停止および削除
docker-compose down
