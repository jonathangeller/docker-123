# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Maintainer information
LABEL maintainer="Jonathan Geller"

# Set environment variables to avoid prompts during package installations
ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies and 32-bit libraries
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
    git \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev \
    python3-openssl \
    libgdbm-dev \
    libnss3-dev \
    libedit-dev \
    libpcap-dev \
    libx11-dev \
    bison \
    flex \
    unzip \
    cpio \
    gcc-multilib \
    libc6:i386 \
    libc6-dev:i386 \
    libncurses5:i386 \
    libtinfo5:i386 \
    libstdc++6:i386 \
    zlib1g:i386 \
    libncurses5-dev:i386

# Clone the 123elf repository
RUN git clone https://github.com/taviso/123elf.git /opt/123elf

# Set working directory
WORKDIR /opt/123elf

# Build a compatible version of binutils
RUN ./binutils.sh

# Download the original 1-2-3 UNIX IMG files
RUN wget -O 123UNIX1.IMG https://archive.org/download/123-unix/123UNIX1.IMG && \
    wget -O 123UNIX2.IMG https://archive.org/download/123-unix/123UNIX2.IMG && \
    wget -O 123UNIX3.IMG https://archive.org/download/123-unix/123UNIX3.IMG && \
    wget -O 123UNIX4.IMG https://archive.org/download/123-unix/123UNIX4.IMG && \
    wget -O 123UNIX5.IMG https://archive.org/download/123-unix/123UNIX5.IMG

# List the contents of the directory to verify downloads
RUN ls -l

# Run the extract script to get the 1-2-3 files
RUN ./extract.sh

# Set library path and compiler flags for 32-bit libraries
ENV LIBRARY_PATH=/lib/i386-linux-gnu:/usr/lib/i386-linux-gnu
ENV CFLAGS="-I/usr/include/i386-linux-gnu -I/usr/include/ncursesw"
ENV LDFLAGS="-L/lib/i386-linux-gnu -L/usr/lib/i386-linux-gnu"

# List library directories to confirm installation
RUN ls -l /lib/i386-linux-gnu && ls -l /usr/lib/i386-linux-gnu

# Print environment variables to confirm settings
RUN echo "LIBRARY_PATH=$LIBRARY_PATH" && echo "CFLAGS=$CFLAGS" && echo "LDFLAGS=$LDFLAGS"

# Build the project
RUN make && ls -l

# List the contents of the directory to verify build output
RUN ls -l

# Run 123elf
CMD ["./123"]
