#!/bin/bash

DATE=`date +%Y-%m-%d@%H-%M-%S`

mysqldump -u root -pgkak2m7! blog > ${DATE}.sql

scp -P 6000 ${DATE}.sql soonoo@175.120.13.161:/home/soonoo/sql-blog-backup
