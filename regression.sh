#
# CROSSMETA basic regression test script
# (c) Copyright Sam Sammandam suprasam _at_ crossmeta.org
#

FSTYPES="xfs ext4 ufs ext2"
FSIMAGE='c:\temp\cxvfstest.img'
SIZE_BYTES=$((100*1024*1024))
MNTPOINT=/mnt
CTHON=/tmp/cthon04
LOOPDEV=/dev/loop1
LOSETUP=/bin/losetup

if [ -e $LOOPDEV ] ; then
	echo "Sorry $LOOPDEV already taken!"
	exit 1
fi
set -e

$LOSETUP -s $SIZE_BYTES -n $LOOPDEV $FSIMAGE
for fs in $FSTYPES ; do
	case $fs in
		ufs|ffs) MKFS=/bin/newfs
		;;

		xfs) MKFS=/bin/xfs_mkfs.exe
		;;
		
		ext*) MKFS=/bin/mke2fs.exe
		;;

		\?)
			echo "File system $fs not supported for testing."
			exit 1
	esac

	if [ "$fs" = "ext2" -o "$fs" = "ext4" ] ; then
		echo y | $MKFS $LOOPDEV |tee
	else
		$MKFS $LOOPDEV
	fi

	mount -t $fs $LOOPDEV $MNTPOINT

	echo "`date` Start $fs file system testing ..."
	cd $CTHON/basic
	NFSTESTDIR=$MNTPOINT/testdir ./runtests  -t
	echo "`date` Done $fs file system testing ..."
	
	echo "`date` Begin umount $MNTPOINT type $fs ..."
	set +e
	retry=0
	while [ $retry -lt 10 ] ; do
		umount $MNTPOINT && break
		sleep 2
		retry=$(($retry+1))
	done
	echo "`date` Done umount $MNTPOINT type $fs ..."
	set -e
	
done
	set +e
	$LOSETUP -d $LOOPDEV
	/bin/dmesg.exe > dmesg-`date +%Y-%m-%d.%H:%M:%S`
	
	echo Removing image file $FSIMAGE
	cmd /c del  $FSIMAGE
	

