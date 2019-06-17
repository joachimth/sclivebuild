# sc-dlbuild

Will be customized more...

Set up a custom debian live image (CD / USB) with the following features:

- Support for [ZFS](https://zfsonlinux.org)
- Enable SSH and root login on boot
	- Root password is `live`, remember to `passwd` ;)
- Auto boot (grub timeout=5)
- Set zsh as shell for root
- Install misc tools
- X (KDE)

Primarily for booting on EFI systems.

## Usage

Run on a Debian system.

```shell
# Install prerequisites.
apt-get update && apt-get install live-build

./build.sh


# Write prerequisites.
apt-get install syslinux mtools

```

When the image is done, write it to a USB drive:


```shell
ls -l /dev/disk/by-id/

sudo fdisk -l /dev/sdb
#List of partitions and block size..
"Disk /dev/sdb: 14,4 GiB, 15479597056 bytes, 30233588 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: DDDE491A-B290-4A5F-BAE8-DB455BD7DCDD

Device      Start      End  Sectors  Size Type
/dev/sdb1  616448 30232575 29616128 14,1G Linux filesystem
/dev/sdb3    2048   616447   614400  300M BIOS boot

Partition table entries are not in disk order."

dd bs=4M if=/media/mylivedeb/testhyb.iso of=/dev/sdX status=progress oflag=sync

```

## TODO

- Makefile
- Run in Docker

## Links

- [Live manual](https://live-team.pages.debian.net/live-manual/html/live-manual/index.en.html)
- (Based on this rep) https://github.com/mafredri/debian-my-live-build
