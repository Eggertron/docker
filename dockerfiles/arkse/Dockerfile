###########################################################
# Dockerfile that builds an Ark Servival Evolved Server
# docker build -t arkse:1
# docker run -itd --rm --name ark -v `pwd`/data:/home/steam/ark-dedicated/ShooterGame/Saved -p 27015:27015/udp -p 7777:7777/udp -p 7778:7778/udp ark:latest
###########################################################
FROM cm2network/steamcmd:root

LABEL maintainer="edgar.h.han@gmail.com"

ENV STEAMAPPID 376030
ENV STEAMAPP ark
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"
ENV RCONVER 0.10.3
ENV RCONPATH "rcon-${RCONVER}-amd64_linux"

# Install required packages
RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
       lib32gcc-s1 \
    && mkdir -p "${STEAMAPPDIR}" \
    && chown -R "${USER}:${USER}" "${HOMEDIR}" "${STEAMAPPDIR}" \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download RCON for server remote connection
RUN curl -OLJ "https://github.com/gorcon/rcon-cli/releases/download/v${RCONVER}/${RCONPATH}.tar.gz" \
    && tar xvf ${RCONPATH}.tar.gz \
    && mv ${RCONPATH} ${HOMEDIR}/

# Download the dedicated server app using the steamcmd app
RUN HOME="${HOMEDIR}" "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "${STEAMAPPDIR}" \
                                    +login anonymous \
                                    +app_update "${STEAMAPPID}" validate \
                                    +quit

COPY server_start.sh $STEAMAPPDIR/ShooterGame/Binaries/Linux/

# Create required folders to keep their permissions on mount
RUN mkdir -p "${HOMEDIR}/Zomboid" \
    && chown -R steam:steam "${HOMEDIR}/Zomboid" "${HOMEDIR}/${RCONPATH}"

USER steam

WORKDIR ${HOMEDIR}
# Expose ports
# RCON - 27015
EXPOSE 7777-7778/udp \
       27020/tcp \
       27015/udp

CMD ["$STEAMAPPDIR/ShooterGame/Binaries/Linux/server-start.sh"]
