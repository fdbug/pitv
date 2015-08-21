# Fix out-of-memory issue on OpenELEC.
swapon ~/bin/swapfile
# Start aria2 daemon.
sleep 5; ~/bin/aria2c 1>~/bin/aria2.log 2>~/bin/aria2.err &
