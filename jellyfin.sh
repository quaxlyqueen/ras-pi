# Get a Docker image, a pre-defined and configured application.
docker pull jellyfin:jellyfin

# Create virtual persistent partitions to store information for Jellyfin
docker volume create jellyfin-config
docker volume create jellyfin-cache

# Start a Docker container with the Jellyfin image.
docker run -d \
 --name jellyfin \
 --user 1000:1000 \
 --net=host \
 --volume jellyfin-config:/config \
 --volume jellyfin-cache:/cache \
 --mount type=bind,source=/home/jellypi/media,target=/media \
 --restart=unless-stopped \
 jellyfin/jellyfin
