dir=session-`date +"%Y-%m-%d.%H-%M-%S"`

mkdir $dir
cd $dir
rm -rf outfile
#export LANG=C
minicom -8 -C outfile -D /dev/tty.usbserial-* 
#minicom -8 -C outfile -D /dev/tty.PL* 
less outfile
