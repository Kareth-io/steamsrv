#!/bin/bash

#Install/Update steamcmd apps
#Expects APP_ID, INSTALL_DIR to work.

STEAMCMD_BIN="/root/bin/steamcmd"

if [ -z "${APP_ID}" ]; then
	echo "APP_ID not specified, please verify environment variables are set"
	exit 1
fi

if [ -z "${INSTALL_DIR}" ]; then
        echo "No install dir specified, installing to /root/default/"
        mkdir -p "/root/default/"
	INSTALL_DIR="/root/default/"
fi

#Maybe auth for some ungodly reason
if [ "${AUTH}" == "1" ]; then
	if [ -z "${USERNAME}" || -z "${PASSWORD}" ]; then
		echo "AUTH is set to 1 but no username or password present. Please unset AUTH to use anonymous login, or provide a username and password"
		exit 1
	fi
	LOGIN="${STEAM_USERNAME} ${STEAM_PASSWORD}"
else
	LOGIN="anonymous"
fi


#Do the thing
${STEAMCMD_BIN} +force_install_dir ${INSTALL_DIR} \
		+login ${LOGIN} \
		+app_update ${APP_ID} validate \
		+quit

