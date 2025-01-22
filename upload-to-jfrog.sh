#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Build the Maven project
echo "Building the Maven project..."
mvn clean package

# Get the name of the generated JAR file
ARTIFACT_NAME=$(ls target/*.jar)

# Print the artifact name for verification
echo "Generated artifact: $ARTIFACT_NAME"

# Upload the artifact to JFrog Artifactory
echo "Uploading the artifact to JFrog..."
jfrog rt u "$ARTIFACT_NAME" "libs-release-local/java-mysql-pgsql/${ARTIFACT_NAME##*/}" \
    --url=https://trialxhhv3p.jfrog.io/artifactory \
    --user=$JFROG_USERNAME \
    --password=$JFROG_PASSWORD

echo "Upload successful!"
