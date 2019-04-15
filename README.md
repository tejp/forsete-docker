# Forsete docker
Mimicks the powerpc assignment machine named Forsete.

For the course edaa25 taught at LTH.

## HowTo
1. Install docker https://docs.docker.com/engine/installation/#desktop.

2. Run `docker build -t forsete .` from this directory.

3. From assignment folder typing ```docker run --rm -it -v `pwd`:/workdir forsete``` will start forsete and enter the working directory.

4. Type
    - `note` to compile, test and generate a note.txt
    - `run a.out` to manually run the file with qemu

5. Remove the image with `docker rmi forsete`

## Cross-compilation toolchain
If you are interested, the cross-compiler installation instructions can be found at https://wiki.debian.org/CrossToolchains.

## Qemu
qemu-ppc-static was acquired from http://debian.lth.se/debian/pool/main/q/qemu/qemu-user-static_2.10.0+dfsg-2_amd64.deb.
- There's a bug when running dynamically linked powerpc binaries with qemu, so must be compiled statically https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1349941.
