# Get lastest release name
RELEASE=$(curl --silent "https://github.com/minio/minio/releases/latest" | sed 's#.*tag/\(.*\)\".*#\1#')

# Extract date from release name
RELEASE_DATE=$(date -d $(echo $RELEASE | cut -f2 -d '.' | cut -f1 -d 'T') +%d/%m/%Y)

# Replace "from" line in dockerfile with the new release
sed -i "s#FROM.*#FROM minio/minio:${RELEASE}#" Dockerfile

# Replace README link to minio release
MINIO_BADGE="[![Minio](https://img.shields.io/badge/Minio-${RELEASE_DATE}-blue.svg)](https://github.com/minio/minio/releases/tag/${RELEASE})"
sed -i "s#\[\!\[Minio\].*#${MINIO_BADGE}#" README.md

# Push changes
git add Dockerfile README.md
git commit -m "Update to minio version ${RELEASE}"
git push origin master

# Create tag
git tag "${RELEASE}"
git push --tags
