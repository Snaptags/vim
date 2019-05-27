#!/bin/bash
if [[ $EUID -ne 0 ]]
  then echo "Please run as root"
  exit 1
fi
./configure --with-features=huge \
            --enable-fail-if-missing \
            --enable-multibyte \
	    --enable-rubyinterp=yes \
	    --enable-pythoninterp=yes \
	    --with-python-config-dir=/usr/lib/python2.7/config \ # pay attention here check directory correct
	    --enable-python3interp=yes \
	    --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu \
	    --enable-perlinterp=yes \
	    --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
	   --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
make install
