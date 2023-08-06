# Use the official Raspberry Pi OS Lite image as the base image
FROM navikey/raspbian-buster

RUN apt-get update && apt-get upgrade -y && apt-get install jq -y && apt-get clean

RUN wget https://ipfs.io/ipns/dist.ipfs.io/go-ipfs/v0.6.0/go-ipfs_v0.6.0_linux-arm.tar.gz

RUN tar -xvzf go-ipfs_v0.6.0_linux-arm.tar.gz

WORKDIR go-ipfs

RUN bash install.sh

COPY initIfNeeded.sh .

RUN chmod 755 initIfNeeded.sh

CMD ["/go-ipfs/initIfNeeded.sh"]
# CMD ["sleep","1000"]

