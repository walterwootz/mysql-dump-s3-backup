#!/bin/bash

source ./env.sh

current_time=$(date "+%Y.%m.%d-%H.%M.%S")
docker run --rm -e MYSQL_PWD=$MYSQL_PWD mysql:$MYSQL_VERSION mysqldump -u $MYSQL_USER -h $MYSQL_HOST -P $MYSQL_PORT $MYSQL_DATABASE 1> $MYSQL_DATABASE_backup_$current_time.sql
docker run --network host -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION -v "$PWD":/app -w /app amazon/aws-cli s3 cp $MYSQL_DATABASE_backup_$current_time.sql s3://$BUCKET_NAME/$FOLDER_IN_BUCKET/$MYSQL_DATABASE_backup_$current_time.sql
rm $MYSQL_DATABASE_backup_$current_time.sql
