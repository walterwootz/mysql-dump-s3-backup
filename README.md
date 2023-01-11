# MDSB - MySQL Dump S3 Backup

MySQL Dump S3 Backup (MDSB) provides scripts to perform dump of a MySQL database and upload the result to an S3 bucket.

## Requirements

- Linux Bash
- Docker

## Configuration

Configure the following variables in [env.sh](./env.sh) file:
| Key | Value |
|--|--|
| MYSQL_VERSION | MySQL version (e.g. 5.7, 8.0) |
| MYSQL_HOST | Hostname of MySQL instance |
| MYSQL_PORT | Port of MySQL instance |
| MYSQL_USER | MySQL username |
| MYSQL_PWD | MySQL password |
| MYSQL_DATABASE | Name of the database to dump |
| AWS_ACCESS_KEY_ID | IAM user's access key |
| AWS_SECRET_ACCESS_KEY | IAM user's secret key |
| AWS_DEFAULT_REGION | S3 bucket region |
| BUCKET_NAME | S3 bucket name |
| FOLDER_IN_BUCKET | S3 folder where to store dump file |
| TZ | Timezone (e.g. Europe/Rome) |

## Run

    ./run.sh

## Scheduling
You can programmatically run it using a cron job.

## Next?
- Dockerize application