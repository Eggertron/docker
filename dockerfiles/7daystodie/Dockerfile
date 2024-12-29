###########################################################
# Dockerfile that builds a 7 days to die Gameserver
# HOMEDIR = /home/steam
# Steam User uid = 1000
#
# Build the 7 Days to die docker image
# docker build -t 7d2d:333 .
#
# Get a copy of the serverconfig.xml file
# docker run -itd --rm -v `pwd`:/home/steam/copy 7d2d:333 cp 7daystodie/serverconfig.xml copy/
#
# Update the serverconfig.xml file and run the container
# docker run -itd --rm --name 7d2d -v `pwd`/serverconfig.xml:/home/steam/serverconfig.xml -v `pwd`/data:/home/steam/.local/share/7DaysToDie -p 26900:26900/tcp -p 26900:26900/udp -p 26901:26901/udp -p 26902:26902/udp -p 26903:26903/udp 7d2d:333
###########################################################
FROM cm2network/steamcmd:root

LABEL maintainer="edgar.h.han@gmail.com"

ENV STEAMAPPID 294420
ENV STEAMAPP 7daystodie
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}"
ENV SDTDDATADIR "${HOMEDIR}/.local/7DaysToDie"

# Install required packages
RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
       dos2unix \
    && mkdir -p "${STEAMAPPDIR}" \
    && mkdir -p "${SDTDDATADIR}" \
    && chown -R 1000:1000 "${STEAMAPPDIR}" "${SDTDDATADIR}" \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download the Project Zomboid dedicated server app using the steamcmd app
RUN HOME="${HOMEDIR}" "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "${STEAMAPPDIR}" \
                                    +login anonymous \
                                    +app_update "${STEAMAPPID}" validate \
                                    +quit
USER steam

WORKDIR ${HOMEDIR}
# Expose ports
EXPOSE 26900-26903/udp \
       26900/tcp

CMD ["${STEAMAPPDIR}/startserver.sh", "-configfile=${STEAMAPPDIR}/serverconfig.xml"]
