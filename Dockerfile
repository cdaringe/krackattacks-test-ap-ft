FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y \
  libnl-3-dev \
  libnl-genl-3-dev \
  pkg-config \
  libssl-dev \
  net-tools \
  git \
  sysfsutils \
  python-scapy \
  python-pip
RUN apt-get install -y tcpdump
RUN pip install pycryptodome
RUN apt-get install -y wpasupplicant
RUN mkdir -p /app
COPY entry.sh /app/entry.sh
CMD ["sh", "/app/entry.sh"]
