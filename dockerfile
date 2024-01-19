FROM cm2network/steamcmd

# Download and install the server
RUN ./steamcmd.sh +force_install_dir /home/steam/ds \
    +login anonymous +app_update 2394010 validate +quit

# install xdg-utils to remove error
USER root
RUN apt update && apt install xdg-utils -y
USER steam


WORKDIR /home/steam/ds
# expose the UDP !!! port
EXPOSE 8211/udp

# run the server
CMD /home/steam/ds/PalServer.sh EpicApp=PalServer
