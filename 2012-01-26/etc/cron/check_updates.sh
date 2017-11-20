#!/bin/bash

cd /tmp
for i in *.ready.tar.gz; do
    if [ -f $i ]; then
	PACKAGE_NAME=`basename $i .ready.tar.gz`
	mkdir $PACKAGE_NAME
	cd $PACKAGE_NAME
	gunzip -f -c /tmp/$i > $PACKAGE_NAME.tar
	tar xf $PACKAGE_NAME.tar
	cd /
	# apply main contents and run update script -- all at once

	PATCH=/tmp/$PACKAGE_NAME/package.gitpatch
	LOGFILE=/tmp/$PACKAGE_NAME/apply_log

	git apply -v $PATCH &>> $LOGFILE && \
	cp /tmp/$PACKAGE_NAME/revision /etc/revision && \
	/tmp/$PACKAGE_NAME/update.sh 2>&1 &>> $LOGFILE

	if [ $? -eq 0 ]; then    
	    touch /tmp/$PACKAGE_NAME.installed
	    logger update package $PACKAGE_NAME installed
	    rm -rf /tmp/$PACKAGE_NAME
	    rm -rf /tmp/$i
	else
	    mv /tmp/$i /tmp/$PACKAGE_NAME.failed.tar.gz
	    logger update package $PACKAGE_NAME failed
	fi
    fi
done
