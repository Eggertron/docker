###########################################################
# Dockerfile that builds a Project Zomboid Gameserver
# docker build -t zomboid:41 .
# docker run -itd --rm --name zomboid -v `pwd`/Zomboid:/home/steam/Zomboid -p 27015:27015/tcp -p 16261:16261/udp -p 16262:16262/udp zomboid:41
###########################################################
FROM cm2network/steamcmd:root

LABEL maintainer="edgar.h.han@gmail.com"

ENV STEAMAPPID 380870
ENV STEAMAPP pz
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"
ENV RCONVER 0.10.3

# Install required packages
RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
       curl \
       dos2unix \
    && mkdir -p "${STEAMAPPDIR}" \
    && chown -R "${USER}:${USER}" "${HOMEDIR}" "${STEAMAPPDIR}" \
    && apt-get clean \
    && whoami \
    && rm -rf /var/lib/apt/lists/*

# Download RCON for server remote connection
RUN curl -OLJ "https://github.com/gorcon/rcon-cli/releases/download/v${RCONVER}/rcon-${RCONVER}-amd64_linux.tar.gz" \
    && tar xvf rcon-${RCONVER}-amd64_linux.tar.gz

# Download the Project Zomboid dedicated server app using the steamcmd app
RUN HOME="${HOMEDIR}" "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "${STEAMAPPDIR}" \
                                    +login anonymous \
                                    +app_update "${STEAMAPPID}" validate \
                                    +quit


# Create required folders to keep their permissions on mount
RUN mkdir -p "${HOMEDIR}/Zomboid" \
    && whoami \
    && chown -R steam:steam "${HOMEDIR}/Zomboid"

USER steam

WORKDIR ${HOMEDIR}
# Expose ports
# RCON - 27015
EXPOSE 16261-16262/udp \
       27015/tcp

CMD ["/home/steam/pz-dedicated/start-server.sh"]
