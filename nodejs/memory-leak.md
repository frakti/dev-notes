Memory leak in NodeJS
=====================

All V8 options: ```node --v8-options | grep gc```


Memory leak out of NodeJS/V8
============================
Leak in native modules, ```node-odbc``` has a lot of them.

Analysis pre-requsites
----------------------
- unixODBC (built with -g option) and unixODBC-devel
- gcc-c++
- sudo yum install automake autoconf libtool-ltdl-devel

HOWTO built unixODBC with debug symbols
---------------------------------------

svn co svn://svn.code.sf.net/p/unixodbc/code/trunk unixodbc
cd unixodbc
make -f Makefile.svn
./configure --help
CFLAGS="-g" ./configure --prefix=/usr --libdir=/usr/lib64
CFLAGS="-g" make
ll /usr/lib64/libodbc.2.0.0      # check date of update
ll /usr/lib64/libodbc.so.2.0.0   # check date of update
sudo make install
echo $?
ll /usr/lib64/libodbc.so.2.0.0   # check if it updated properly
ll /usr/lib64/libodbc.so
ll /usr/lib64/libodbc.so.2

# make install probably cleaned drivers, check what is current dir
odbcinst -j
sudo cp /etc/odbcinst.ini /usr/etc/odbcinst.ini


RUN analysis
------------
valgrind --tool=memcheck --leak-check=yes --show-reachable=yes  node index.js -e production


Changes in npm module node-odbc
-------------------------------
change node_modules/odbc source
npm rebuild odbc


Specific odbc issues
====================
http://msdn.microsoft.com/en-us/library/ms710123(v=vs.85).aspx


Other tools
===========
- npm module - memwatch


