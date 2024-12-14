###########################################################
# Dockerfile that builds a Project Zomboid Gameserver
# docker build -t zomboid:41 .
# docker run -d --restart always --name zoboid -v `pwd`/Zomboid:/root/Zomboid -p 27015:27015/tcp -p 16261:16261/udp -p 16262:16262/udp zomboid:41
###########################################################
FROM cm2network/steamcmd:root

LABEL maintainer="edgar.h.han@gmail.com"

ENV STEAMAPPID 380870
ENV STEAMAPP pz
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"

# Install required packages
RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
      dos2unix \
    && mkdir -p "${STEAMAPPDIR}" \
    && chown -R "${USER}:${USER}" "${HOMEDIR}" "${STEAMAPPDIR}" \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download the Project Zomboid dedicated server app using the steamcmd app
# Set the entry point file permissions
RUN HOME="${HOMEDIR}" "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "${STEAMAPPDIR}" \
                                    +login anonymous \
                                    +app_update "${STEAMAPPID}" validate \
                                    +quit

# Create required folders to keep their permissions on mount
RUN mkdir -p "${HOMEDIR}/Zomboid"

WORKDIR ${HOMEDIR}
# Expose ports
EXPOSE 16261-16262/udp \
       27015/tcp

CMD ["/home/steam/pz-dedicated/start-server.sh"]
