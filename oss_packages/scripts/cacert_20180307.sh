#!/bin/sh

# name of directory after extracting the archive in working directory
PKG_DIR="cacert_20180307.pem"

# name of the archive in dl directory (use "none" if empty)
PKG_ARCHIVE_FILE="${PKG_DIR}"

# download link for the sources to be stored in dl directory (use "none" if empty)
# PKG_DOWNLOAD="https://curl.haxx.se/ca/cacert.pem"
PKG_DOWNLOAD="https://m3-container.net/M3_Container/oss_packages/${PKG_DIR}"

# md5 checksum of archive in dl directory (use "none" if empty)
PKG_CHECKSUM="2c43548519379c083d60dd9e84a1b724"



SCRIPTSDIR=$(dirname $0)
HELPERSDIR="${SCRIPTSDIR}/helpers"
TOPDIR=$(realpath ${SCRIPTSDIR}/../..)
. "${TOPDIR}/scripts/common_settings.sh"
. "${HELPERSDIR}/functions.sh"
PKG_ARCHIVE="${DOWNLOADS_DIR}/${PKG_ARCHIVE_FILE}"
PKG_SRC_DIR="${SOURCES_DIR}/${PKG_DIR}"
PKG_BUILD_DIR="${BUILD_DIR}/${PKG_DIR}"
PKG_INSTALL_DIR="${PKG_BUILD_DIR}/install"

unpack()
{
    ! [ -e "${PKG_BUILD_DIR}" ] && mkdir -p "${PKG_BUILD_DIR}"
    ! [ -e "${TARGET_DIR}" ] && mkdir -p "${TARGET_DIR}"
    cp "${PKG_ARCHIVE}" "${PKG_BUILD_DIR}"
}

configure()
{
    true
}

compile()
{
    true
}

install_staging()
{
    cp "${PKG_BUILD_DIR}/${PKG_DIR}" "${STAGING_DIR}/usr/share/cacert.pem" || exit_failure "failed to install ${PKG_DIR} to ${STAGING_DIR}"
}

uninstall_staging()
{
    rm -vf "${STAGING_DIR}/usr/share/cacert.pem"
}

. ${HELPERSDIR}/call_functions.sh
