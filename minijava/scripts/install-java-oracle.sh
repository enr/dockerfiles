#!/usr/bin/env bash

# Installs Oracle Java in /opt/java
# Creates a link in /opt/java/current
# Updates alternatives in system which support it.
# By default download and installs Java 8.45.14
# To change version set environment variables:
# - JAVA_VERSION_MAJOR
# - JAVA_VERSION_MINOR
# - JAVA_VERSION_BUILD
# To install an already downloaded archive:
# $0 [archive file]

set -o nounset -o errexit -o pipefail -o errtrace

# Java Version
: ${JAVA_VERSION_MAJOR:='8'}
: ${JAVA_VERSION_MINOR:='72'}
: ${JAVA_VERSION_BUILD:='15'}

SYSTEM_JAVA_INSTALL_DIR='/usr/bin'
JAVA_EXECS=('jar' 'jarsigner' 'java' 'javac' 'javadoc' 'javah' 'javap' 'keytool')
INSTALLATION_BASE_DIR="/opt/java"
DOWNLOAD_URL="http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/jdk-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz"
ARCHIVE_BASENAME=$(echo $DOWNLOAD_URL | awk -F'?' '{print $1}'| awk -F'/' '{print $NF}')
DOWNLOAD_TMP_DIR=$(mktemp -d)
DOWNLOAD_PATH="${DOWNLOAD_TMP_DIR}/${ARCHIVE_BASENAME}"
CURRENT_JAVA="${INSTALLATION_BASE_DIR}/current"

# --- checks
[[ -f "$CURRENT_JAVA" ]] && {
    echo "$CURRENT_JAVA is not a link. This script could damage your system."
    exit 1
}

user_java_file=${1:-}
if [ -n "$user_java_file" ]; then
    [[ -f "$user_java_file" ]] || {
        echo "Archive file not found ${user_java_file}"
        exit 1
    }
    echo "Installing Java from ${user_java_file}"
    DOWNLOAD_PATH="$user_java_file"
else
    echo "Installing Java from ${DOWNLOAD_URL}"
    # -s silent
    # -S show error
    # -L If the server reports that the requested page has a different location (indicated with the header line Location:)
    # -C Continue/Resume a previous file transfer at the given offset
    # -b cookie
    curl --insecure -s -S -L -C - -o "$DOWNLOAD_PATH" -b "oraclelicense=accept-securebackup-cookie" "$DOWNLOAD_URL"
fi

tar_tmp_file=$(mktemp)
gzip -dc "$DOWNLOAD_PATH" > "$tar_tmp_file"

INSTALLATION_BASE_NAME=$(tar tf "$tar_tmp_file" | head -1 | awk -F/ '{print $1}')
JAVA_INSTALL_DIR="${INSTALLATION_BASE_DIR}/${INSTALLATION_BASE_NAME}"

[[ -e "$JAVA_INSTALL_DIR" ]] && {
    echo "${JAVA_INSTALL_DIR} exists. This script could damage your system."
    exit 1
}

[[ -d "$INSTALLATION_BASE_DIR" ]] || {
    mkdir -p "$INSTALLATION_BASE_DIR"
}

tar xf "$tar_tmp_file" -C "$INSTALLATION_BASE_DIR"

# Cleanup
rm "$DOWNLOAD_PATH"
rm "$tar_tmp_file"
rm -rf  $JAVA_INSTALL_DIR/*src.zip \
        $JAVA_INSTALL_DIR/lib/missioncontrol \
        $JAVA_INSTALL_DIR/lib/visualvm \
        $JAVA_INSTALL_DIR/lib/*javafx* \
        $JAVA_INSTALL_DIR/jre/lib/plugin.jar \
        $JAVA_INSTALL_DIR/jre/lib/ext/jfxrt.jar \
        $JAVA_INSTALL_DIR/jre/bin/javaws \
        $JAVA_INSTALL_DIR/jre/lib/javaws.jar \
        $JAVA_INSTALL_DIR/jre/lib/desktop \
        $JAVA_INSTALL_DIR/jre/plugin \
        $JAVA_INSTALL_DIR/jre/lib/deploy* \
        $JAVA_INSTALL_DIR/jre/lib/*javafx* \
        $JAVA_INSTALL_DIR/jre/lib/*jfx* \
        $JAVA_INSTALL_DIR/jre/lib/amd64/libdecora_sse.so \
        $JAVA_INSTALL_DIR/jre/lib/amd64/libprism_*.so \
        $JAVA_INSTALL_DIR/jre/lib/amd64/libfxplugins.so \
        $JAVA_INSTALL_DIR/jre/lib/amd64/libglass.so \
        $JAVA_INSTALL_DIR/jre/lib/amd64/libgstreamer-lite.so \
        $JAVA_INSTALL_DIR/jre/lib/amd64/libjavafx*.so \
        $JAVA_INSTALL_DIR/jre/lib/amd64/libjfx*.so

[[ -h "$CURRENT_JAVA" ]] && {
    rm "$CURRENT_JAVA"
}
ln -s "${INSTALLATION_BASE_DIR}/${INSTALLATION_BASE_NAME}" "$CURRENT_JAVA"

# Global environment
TMP_ENV_FILE=$(mktemp)
ENV_FILE='/etc/profile.d/java_oracle.sh'
echo "# Created from ${0}" >> "$TMP_ENV_FILE"
echo "export JAVA_HOME='$CURRENT_JAVA'" >> "$TMP_ENV_FILE"
echo 'export PATH="$PATH:$JAVA_HOME/bin"' >> "$TMP_ENV_FILE"
[[ -d '/etc/profile.d' ]] || mkdir -p '/etc/profile.d'
cp "$TMP_ENV_FILE" "$ENV_FILE"
chmod 644 "$ENV_FILE"
. "$ENV_FILE"

java -version
