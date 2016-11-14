#!/bin/sh

cd /target || exit 1

apt-get update

USER_ID=${LOCAL_USER_ID:0}

for i; do (
	set -e
	cd $i
	mk-build-deps --install --remove --tool "apt-get --no-install-recommends --yes"
	eval "debuild $DOCKER_DEBUILD_OPTS -us -uc --lintian-opts --allow-root"
        # Fix permission
        chown -R $USER_ID .
)
done
