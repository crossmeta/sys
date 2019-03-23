  ## Regression Testing
  Crossmeta uses Connectathon test suite to verify basic POSIX compliant file system operations. Though the tests were orignially provided to verify NFS operations, it can also be used for testing filesystems other than NFS. 
  It also uses its own busybox ash shell for running the regression.sh shell script!
  
  1. Install latest [Crossmeta Fuse](https://github.com/crossmeta/cxfuse/releases/latest) on *Windows Server 2016 build 14393*
  2. Start Crossmeta drivers 
  ```powershell
  c:\program files\crossmeta> service_crossmeta start
  ```
  3. Create temporary directory where file system image will setup in loop disk.
  ```powershell
c:\ mkdir  c:\temp
```
4. Download cthon04 test suite ported to Crossmeta and save it to Crossmeta drive v:\tmp
5. From Crossmeta shell (busybox) extract files
```shell
# cd /tmp
# gzip -cd cthon04_tests.tgz  | tar xf -
# cd cthon4
6. Before running regression.sh shell script review to make sure the variable settings are okay.
7. Run the regression suite
``shell
# cd /tmp/cth0n04
# ./regression.sh
```
8. After any failure rerun requires cleanup as follows
```console
# umount /mnt
# losetup -d loop1
# cmd /c del c:\\temp\\cxvfstest.img
```
9. Watch the progress of test ouptut
```console
# ./regression.sh
meta-data=/dev/loop1             isize=256    agcount=6, agsize=4096 blks
         =                       sectsz=512   attr=0
data     =                       bsize=4096   blocks=24576, imaxpct=25
         =                       sunit=0      swidth=0 blks, unwritten=1
naming   =version 2              bsize=4096
log      =internal log           bsize=4096   blocks=1200, version=1
         =                       sectsz=512   sunit=0 blks
realtime =none                   extsz=65536  blocks=0, rtextents=0
Fri Mar 22 23:26:33 GST 2019 Start xfs file system testing ...
Starting BASIC tests: test directory /mnt/testdir (arg: -t)

./test1: File and directory creation test
        created 155 files 62 directories 5 levels deep in 0.1  seconds
        ./test1 ok.

./test2: File and directory removal test
        removed 155 files 62 directories 5 levels deep in 0.1  seconds
        ./test2 ok.

./test3: lookups across mount point
        500 getcwd and stat calls in 0.3  seconds
        ./test3 ok.

./test4: setattr, getattr, and lookup
        1000 chmods and stats on 10 files in 0.1  seconds
        ./test4 ok.

./test5: read and write
        wrote 1048576 byte file 10 times in 0.1  seconds (699050666 bytes/sec)
        read 1048576 byte file 10 times in 0.0  seconds (> 10485760 bytes/sec)
        ./test5 ok.
TESTARG=-t
./test6: readdir
        20500 entries read, 200 files in 0.1  seconds
        ./test6 ok.

./test7: link and rename
        200 renames and links on 10 files in 0.0  seconds
        ./test7 ok.

./test8: symlink and readlink
        400 symlinks and readlinks on 10 files in 0.1  seconds
        ./test8 ok.

./test9: statfs
        1500 statfs calls in 0.1  seconds
        ./test9 ok.

Congratulations, you passed the basic tests!
Fri Mar 22 23:26:33 GST 2019 Done xfs file system testing ...
Fri Mar 22 23:26:33 GST 2019 Begin umount /mnt type xfs ...
Fri Mar 22 23:26:34 GST 2019 Done umount /mnt type xfs ...
/dev/loop1 is not a block special device.
Proceed anyway? (y,n) Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
25688 inodes, 102400 blocks
5120 blocks (5.00%) reserved for the super user
First data block=1
13 block groups
8192 blocks per group, 8192 fragments per group
1976 inodes per group
Superblock backups stored on blocks:
        8193, 24577, 40961, 57345, 73729

Writing inode tables: done
Writing superblocks and filesystem accounting information: done

This filesystem will be automatically checked every 39 mounts or
180 days, whichever comes first.  Use tune2fs -c or -i to override.
Fri Mar 22 23:26:34 GST 2019 Start ext4 file system testing ...
Starting BASIC tests: test directory /mnt/testdir (arg: -t)

./test1: File and directory creation test
        created 155 files 62 directories 5 levels deep in 0.1  seconds
        ./test1 ok.

./test2: File and directory removal test
        removed 155 files 62 directories 5 levels deep in 0.1  seconds
        ./test2 ok.

./test3: lookups across mount point
        500 getcwd and stat calls in 0.1  seconds
        ./test3 ok.

./test4: setattr, getattr, and lookup
        1000 chmods and stats on 10 files in 0.0  seconds
        ./test4 ok.

./test5: read and write
        wrote 1048576 byte file 10 times in 0.4  seconds (223101276 bytes/sec)
        read 1048576 byte file 10 times in 0.0  seconds (> 10485760 bytes/sec)
        ./test5 ok.
TESTARG=-t
./test6: readdir
        20500 entries read, 200 files in 0.0  seconds
        ./test6 ok.

./test7: link and rename
        200 renames and links on 10 files in 0.0  seconds
        ./test7 ok.

./test8: symlink and readlink
        400 symlinks and readlinks on 10 files in 0.0  seconds
        ./test8 ok.

./test9: statfs
        1500 statfs calls in 0.0  seconds
        ./test9 ok.

Congratulations, you passed the basic tests!
Fri Mar 22 23:26:35 GST 2019 Done ext4 file system testing ...
Fri Mar 22 23:26:35 GST 2019 Begin umount /mnt type ext4 ...
umount: unmount of /mnt failed: Resource device
Fri Mar 22 23:26:37 GST 2019 Done umount /mnt type ext4 ...
/dev/loop1:     204800 sectors in 50 cylinders of 1 tracks, 4096 sectors
        100.0MB in 4 cyl groups (16 c/g, 32.00MB/g, 6272 i/g)
super-block backups (for fsck -b #) at:
 32, 65568, 131104, 196640
Fri Mar 22 23:26:37 GST 2019 Start ufs file system testing ...
Starting BASIC tests: test directory /mnt/testdir (arg: -t)

./test1: File and directory creation test
        created 155 files 62 directories 5 levels deep in 0.1  seconds
        ./test1 ok.

./test2: File and directory removal test
        removed 155 files 62 directories 5 levels deep in 0.0  seconds
        ./test2 ok.

./test3: lookups across mount point
        500 getcwd and stat calls in 0.1  seconds
        ./test3 ok.

./test4: setattr, getattr, and lookup
        1000 chmods and stats on 10 files in 0.1  seconds
        ./test4 ok.

./test5: read and write
        wrote 1048576 byte file 10 times in 0.0  seconds (> 10485760 bytes/sec)
        read 1048576 byte file 10 times in 0.1  seconds (655360000 bytes/sec)
        ./test5 ok.
TESTARG=-t
./test6: readdir
        20500 entries read, 200 files in 0.0  seconds
        ./test6 ok.

./test7: link and rename
        200 renames and links on 10 files in 0.0  seconds
        ./test7 ok.

./test8: symlink and readlink
        400 symlinks and readlinks on 10 files in 0.0  seconds
        ./test8 ok.

./test9: statfs
        1500 statfs calls in 0.0  seconds
        ./test9 ok.

Congratulations, you passed the basic tests!
Fri Mar 22 23:26:38 GST 2019 Done ufs file system testing ...
Fri Mar 22 23:26:38 GST 2019 Begin umount /mnt type ufs ...
Fri Mar 22 23:26:38 GST 2019 Done umount /mnt type ufs ...
/dev/loop1 is not a block special device.
Proceed anyway? (y,n) Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
25688 inodes, 102400 blocks
5120 blocks (5.00%) reserved for the super user
First data block=1
13 block groups
8192 blocks per group, 8192 fragments per group
1976 inodes per group
Superblock backups stored on blocks:
        8193, 24577, 40961, 57345, 73729

Writing inode tables: done
Writing superblocks and filesystem accounting information: done

This filesystem will be automatically checked every 23 mounts or
180 days, whichever comes first.  Use tune2fs -c or -i to override.
Fri Mar 22 23:26:38 GST 2019 Start ext2 file system testing ...
Starting BASIC tests: test directory /mnt/testdir (arg: -t)

./test1: File and directory creation test
        created 155 files 62 directories 5 levels deep in 0.1  seconds
        ./test1 ok.

./test2: File and directory removal test
        removed 155 files 62 directories 5 levels deep in 0.0  seconds
        ./test2 ok.

./test3: lookups across mount point
        500 getcwd and stat calls in 0.3  seconds
        ./test3 ok.

./test4: setattr, getattr, and lookup
        1000 chmods and stats on 10 files in 0.0  seconds
        ./test4 ok.

./test5: read and write
        wrote 1048576 byte file 10 times in 0.1  seconds (655360000 bytes/sec)
        read 1048576 byte file 10 times in 0.0  seconds (> 10485760 bytes/sec)
        ./test5 ok.
TESTARG=-t
./test6: readdir
        20500 entries read, 200 files in 0.0  seconds
        ./test6 ok.

./test7: link and rename
        200 renames and links on 10 files in 0.0  seconds
        ./test7 ok.

./test8: symlink and readlink
        400 symlinks and readlinks on 10 files in 0.0  seconds
        ./test8 ok.

./test9: statfs
        1500 statfs calls in 0.0  seconds
        ./test9 ok.

Congratulations, you passed the basic tests!
Fri Mar 22 23:26:39 GST 2019 Done ext2 file system testing ...
Fri Mar 22 23:26:39 GST 2019 Begin umount /mnt type ext2 ...
umount: unmount of /mnt failed: Resource device
Fri Mar 22 23:26:41 GST 2019 Done umount /mnt type ext2 ...
Removing image file c:\temp\cxvfstest.img
#
```

    
