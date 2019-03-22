# Crossmeta BSD POSIX for Windows

Crossmeta provides BSD style POSIX file system operations to Windows programs using standard NT kernel interfaces.  In addition, it has support for fork/wait for process management, and more potential to offer other Unix-like environment. It has ash shell (Almquist shell) plus tiny versions of many common UNIX utilities, sed, awk, grep, and diff etc. Crossmeta provides all these within the standard Win32 subsystem in Windows NT, without segregation.

## Crossmeta Advantage
#### Dynamic kernel modules
Crossmeta is fully functional dynamic loadable module, that can be loaded on demand. And when not used, the complete kernel drivers can be unloaded.
Just like any other dynamic loadable module, Crossmeta cannot be unloaded when applications have active references.

#### Not a separate subsystem in Windows
Crossmeta runs within WIN32 subsystem and supports WIN32/WIN64 binaries.

#### fork and wait support
Crossmeta has basic support for fork, which is efficient light-weight fork and
is Copy-On-Write as in other POSIX systems.
The wait() syscall can be used to harvest return status of forked processes.

#### Unlink of open files
Just like any other POSIX system, Crossmeta supports deletion and rename of
 open files.
Only when the reference to unlinked inode becomes zero, the file gets deleted automatically.

#### POSIX file system operations
Since Crossmeta includes BSD VFS it supports all the standard 
chown, chmod, hardlinks, symbolic links, and rename, etc VFS calls in its own VFS namespace.

#### Mounting and Unmoung File systems
With mount/unmount on a directory the file system is best visualized as a tree, rooted as it were, at /. /dev, /usr, /home, and the other directories in the root directory are branches, which may have their own branches, such as /usr/local, and so on.

#### Support for file systems
Crossmeta has impressive support for following file systems

| Filesystem | rw | Journal |
| ---------- | ----- | ----- |
| XFS |	Read/Write |	Journnal (Log ver2, No support for delay-log) |
| EXT2 | Read/Write | None |
| EXT3 | Read/Write  |	No Journal |
| EXT4 | Read/Write | No Journal |
| ReiserFs |	Read | - |
| Apple HFS+ |	Read| No Journal |

#### FUSE User mode file system
Filesystem in Userspace (FUSE) is a software interface for developing file systems in user-mode without kernel interface programming. Crossmeta
provides the same reference Linux FUSE API, so that programs can be ported with no or very little modifications.
It comes with following classic "Hello, World" samples 
hello using high-level FUSE API
hello_ll using low-level FUSE API
sshfs is a popular FUSE file system client that allows secure seamless access to remote files with standard SSH account login, as if they were local files.

#### Pseudo character devices
Crossmeta provides character devices such as

<dl>
<dt> zero  <dd> Can be used as source of endless zero
<dt>  null  <dd>Can be used as output sink to discard data
<dt> loop  <dd> a pseudo device that makes ordinary file accessible as a block device
<dd>
The windows volume devices appear as BSD style disks
da0, da0s1 .. da1, .. etc
</dl>

#### Using file images VHD
Attach or Detach of VHD image in Windows Disk management will appear as PnP disk inside Crossmeta.
Other ordinary flat file images can be used as disk with loop pseud-device support and losetup command.

## Crossmeta Kernel
Standard NT kernel mode file system driver with BSD VFS operations.
It includes 
- namecache for caching name lookups
- buffercache for directory or metadata caching
- regular files uses NT Cache manager (pagecache)

#### rootfs
The grandfather of UNIX file systems, FFS/UFS, serves as default root file system in Crossmeta.

#### winfs
The loop back filesystem in Crossmeta to access other Windows files systems NTFS, etc. Winfs automatically reflects any modification made outside Crossmeta to these native file systems.

#### regfs
Readonly access to NT Registry hive.  With this file system the registry keys appear as directories and the registry values appear as files with binary data.

#### devfs
Pseudo file system to expose Crossmeta devices, /dev/null, zero, loop, da0.. etc

#### dmesg
Crossmeta provides the standard klog device for viewing the kernel informational or debug messages from Crossmeta.

#### sysctl
To retrieve kernel state and allows processes with appropriate privilege to set kernel state.The state to be retrieved or
set is described using a ``Management Information Base'' (``MIB'')	style
name, described as	a dotted set of	components.

#### User mapping
Crossmeta uses one-to-one mapping of NT user name (SID) to BSD passwd db file withe same username, uid, gid, and groups. Unknown names are mapped to _nobody_

#### Network
NFS file system
Crossmeta provides version 2 and 3 NFS server and client services over UDP protocol.

## Summary

Crossmeta provides practical POSIX environment in Windows Environment that is easy to install and use and is available in very small memory footprint.
The common UNIX utilities are hard-linked files that is less than 300KB and the Crossmeta kernel driver is also under 300KB.
