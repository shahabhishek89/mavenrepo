#!/bin/bash

### Remove old war files
rm -rf /tomcat/test/webapps/student*

### Copy the war file
cp /var/lib/jenkins/workspace/sample-test1/target/student*.war /tomcat/test/webapps/student.war

sleep 20

RESPONSE=$(curl -s -I http://localhost:8082/student | head -1  | awk '{print $2}')
echo RESPONSE = $RESPONSE
if [ "$RESPONSE" != 200 ]; then 
  echo "Respinse from student APP is not OK"
  exit 1
fi
  
