
set -x
RELDIR=SimpleMovieCatalog
VER=1.1.0
ZIP=$RELDIR-$VER.zip

rm -rf $RELDIR $ZIP

mkdir $RELDIR
mkdir $RELDIR/lib
mkdir $RELDIR/doc
mkdir $RELDIR/demo

cp moviecat.pl interactive.cmd run_scan.cmd $RELDIR

cp IMDB_Movie.pm  $RELDIR/lib

if [ -e default-cfg.txt ]; then
    cp default-cfg.txt $RELDIR/config.txt
else
    cp config.txt $RELDIR/config.txt
fi
cp readme.txt $RELDIR
cp license.txt gpl.txt todo.txt sample-cfg.txt changelog.txt  $RELDIR/doc

tar cf - demo --exclude CVS --exclude '*.jpg' | tar xvf - -C $RELDIR
cp demo.cmd demo-cfg.txt $RELDIR/demo

unix2dos $RELDIR/*.txt $RELDIR/doc/*.txt $RELDIR/demo/*.txt
unix2dos $RELDIR/*.cmd $RELDIR/demo/*.cmd

zip -r $ZIP $RELDIR
