#!/bin/bash

DIST_DEPS=0
CENTOS_DEPS=0

GCONF_COMPILE=0
GCONF_INSTALL=0

PIXBUF_INSTALL=0
PIXBUF_COMPILE=0

GTK_COMPILE=0
GTK_INSTALL=0

# Dev tools like gcc compiler
DEV_TOOLS=0

LINK_SO_TO_ELECTRON=0

XVFB_INSTALL=0

NOTHING_RUN=1

for arg in "$@"
do
  case $arg in
    "dev-tools" )
      DEV_TOOLS=1;;

    # Dependencies
    "all-deps" )
      DIST_DEPS=1
      CENTOS_DEPS=1;;

    "dist-deps" )
      DIST_DEPS=1;;

    "centos-deps" )
      CENTOS_DEPS=1;;



    # Gconf
    "gconf-all" )
      GCONF_COMPILE=1
      GCONF_INSTALL=1;;

    "gconf-compile" )
      GCONF_COMPILE=1;;

    "gconf-install" )
      GCONF_INSTALL=1;;

   
    # Pixbuf  
    "pixbuf-all")
      PIXBUF_COMPILE=1
      PIXBUF_INSTALL=1;;
     
    "pixbuf-compile") 
      PIXBUF_COMPILE=1;;

    "pixbuf-install")
      PIXBUF_INSTALL=1;;


    # Gtk +
    "gtk-all" )
      GTK_COMPILE=1
      GTK_INSTALL=1;;
     
    "gtk-compile" )
      GTK_COMPILE=1;;

    "gtk-install" )
      GTK_INSTALL=1;;

    "xvfb-install" )
      XVFB_INSTALL=1;;

    # Other
    "link-so-to-electron"|"link" )
      LINK_SO_TO_ELECTRON=1;;
  esac
done

if [ "1" -eq "$DIST_DEPS"  ]; then
  NOTHING_RUN=0
  echo ">>> Installing dependencies available in Amazon Linux ..."

#   sleep 2  
  yum -y install pango pango-devel libXrandr libXrandr-devel libXcursor libXcursor-devel libXcomposite libXcomposite-devel cups
  
  # These packages are needed by ORBit
  yum -y install libIDL libIDL-devel gtk-doc dbus dbus-devel dbus-glib dbus-glib-devel intltool indent

  # These would be needed to compile GConf
  yum -y install libxml2 libxml2-devel

  echo ">>> Done."
fi

if [ "1" -eq  "$CENTOS_DEPS" ]; then
  NOTHING_RUN=0
  echo ">>> Installing deps available in CentOS 6..."

#   sleep 2
  rpm -ivh http://mirror.centos.org/centos/6/os/x86_64/Packages/atk-1.30.0-1.el6.x86_64.rpm
  rpm -ivh http://mirror.centos.org/centos/6/os/x86_64/Packages/atk-devel-1.30.0-1.el6.x86_64.rpm
  rpm -ivh http://mirror.centos.org/centos/6/os/x86_64/Packages/libXScrnSaver-1.2.2-2.el6.x86_64.rpm
  rpm -ivh https://rpmfind.net/linux/centos/6.10/os/x86_64/Packages/elfutils-libelf-0.164-2.el6.i686.rpm
  rpm -ivh https://rpmfind.net/linux/centos/7.8.2003/os/x86_64/Packages/elfutils-libelf-0.176-4.el7.x86_64.rpm
  
  # ORBit is requried to compile GConf
  rpm -ivh http://mirror.centos.org/centos/6/os/x86_64/Packages/ORBit2-2.14.17-7.el6.x86_64.rpm
  rpm -ivh http://mirror.centos.org/centos/6/os/x86_64/Packages/ORBit2-devel-2.14.17-7.el6.x86_64.rpm
  echo ">>> Done."
fi

if [ "1" -eq  "$CENTOS_DEPS" ]; then
  NOTHING_RUN=0
  echo ">>> Installing deps available in CentOS 7..."

#   sleep 2
  # rpm -ivh http://mirror.centos.org/centos/6/os/x86_64/Packages/atk-1.30.0-1.el6.x86_64.rpm
  # rpm -ivh http://mirror.centos.org/centos/6/os/x86_64/Packages/atk-devel-1.30.0-1.el6.x86_64.rpm
  # rpm -ivh http://mirror.centos.org/centos/6/os/x86_64/Packages/libXScrnSaver-1.2.2-2.el6.x86_64.rpm
  # rpm -ivh https://rpmfind.net/linux/centos/6.10/os/x86_64/Packages/elfutils-libelf-0.164-2.el6.i686.rpm
  # rpm -ivh https://rpmfind.net/linux/centos/7.8.2003/os/x86_64/Packages/elfutils-libelf-0.176-4.el7.x86_64.rpm
  
  # ORBit is requried to compile GConf
  # rpm -ivh http://mirror.centos.org/centos/6/os/x86_64/Packages/ORBit2-2.14.17-7.el6.x86_64.rpm
  # rpm -ivh http://mirror.centos.org/centos/6/os/x86_64/Packages/ORBit2-devel-2.14.17-7.el6.x86_64.rpm
  rpm -ivh http://mirror.centos.org/centos/7/os/x86_64/Packages/ORBit2-2.14.19-13.el7.x86_64.rpm
  rpm -ivh http://mirror.centos.org/centos/7/os/x86_64/Packages/ORBit2-devel-2.14.19-13.el7.x86_64.rpm

  # Centos 7 Deps
  # Install ATK from CentOS 7
  rpm -ivh http://mirror.centos.org/centos/7/os/x86_64/Packages/atk-2.28.1-2.el7.x86_64.rpm
  rpm -ivh http://mirror.centos.org/centos/7/os/x86_64/Packages/atk-devel-2.28.1-2.el7.x86_64.rpm
  rpm -ivh http://mirror.centos.org/centos/7/os/x86_64/Packages/elfutils-libelf-0.176-4.el7.x86_64.rpm
  rpm -ivh http://mirror.centos.org/centos/7/os/x86_64/Packages/elfutils-libelf-0.176-4.el7.x86_64.rpm
  rpm -ivh http://mirror.centos.org/centos/7/os/x86_64/Packages/elfutils-libelf-devel-0.176-4.el7.x86_64.rpm
  # rpm -ivh --nodeps http://mirror.centos.org/centos/7/os/x86_64/Packages/at-spi2-atk-2.26.2-1.el7.x86_64.rpm
  # rpm -ivh --nodeps http://mirror.centos.org/centos/7/os/x86_64/Packages/at-spi2-core-2.28.0-1.el7.x86_64.rpm

# Install GTK from fedora 20
  rpm -ivh http://dl.fedoraproject.org/pub/archive/fedora/linux/releases/20/Fedora/x86_64/os/Packages/g/GConf2-3.2.6-7.fc20.x86_64.rpm
  rpm -ivh http://dl.fedoraproject.org/pub/archive/fedora/linux/releases/20/Fedora/x86_64/os/Packages/l/libXScrnSaver-1.2.2-6.fc20.x86_64.rpm
  rpm -ivh http://dl.fedoraproject.org/pub/archive/fedora/linux/releases/20/Fedora/x86_64/os/Packages/l/libxkbcommon-0.3.1-1.fc20.x86_64.rpm
  rpm -ivh http://dl.fedoraproject.org/pub/archive/fedora/linux/releases/20/Fedora/x86_64/os/Packages/l/libwayland-client-1.2.0-3.fc20.x86_64.rpm
  rpm -ivh http://dl.fedoraproject.org/pub/archive/fedora/linux/releases/20/Fedora/x86_64/os/Packages/l/libwayland-cursor-1.2.0-3.fc20.x86_64.rpm
  rpm -ivh http://dl.fedoraproject.org/pub/archive/fedora/linux/releases/20/Fedora/x86_64/os/Packages/g/gtk3-3.10.4-1.fc20.x86_64.rpm
  rpm -ivh http://mirror.centos.org/centos/7/os/x86_64/Packages/pango-1.42.4-4.el7_7.x86_64.rpm
  rpm -ivh http://mirror.centos.org/centos/7/os/x86_64/Packages/cairo-devel-1.15.12-4.el7.x86_64.rpm
  rpm -ivh http://mirror.centos.org/centos/7/os/x86_64/Packages/cairo-gobject-devel-1.15.12-4.el7.x86_64.rpm

  echo ">>> Done."
fi

if [ "1" -eq "$DEV_TOOLS" ]; then
  NOTHING_RUN=0
  echo ">>> Installing dev tools (gcc)"
  yum -y install gcc
  echo "Done."
fi

if [ "1" -eq "$GCONF_COMPILE" ]; then

  NOTHING_RUN=0
  echo ">>> Compiling GConf..."
#   sleep 3

    cd /tmp
    # wget ftp://ftp.gnome.org/pub/GNOME/sources/GConf/2.32/GConf-2.32.4.tar.bz2
    wget https://download.gnome.org/sources/GConf/2.32/GConf-2.32.4.tar.bz2
    tar -jxvf GConf-2.32.4.tar.bz2
    cd GConf-2.32.4
    ./configure && make


  echo ">>> Done."
 
fi


if [ "1" -eq "$GCONF_INSTALL" ]; then

  NOTHING_RUN=0
  echo ">>> Installing GConf..."
#   sleep 3
  cd /tmp
  cd GConf-2.32.4
  make install
  
  echo ">>> Done."
fi

if [ "1" -eq "$PIXBUF_COMPILE" ]; then
  NOTHING_RUN=0
  # Compile gdk-pixbuf
  echo ">>> Compiling Pixbuf libray..."
  echo ">>> --------"
  echo ">>> WARNING: Pixbuf will be compiled with --without-libtiff --without-libjpeg flags"
  echo ">>> --------"
  sleep 2
  cd /tmp
  wget http://ftp.acc.umu.se/pub/gnome/sources/gdk-pixbuf/2.24/gdk-pixbuf-2.24.0.tar.bz2
  tar -jxvf gdk-pixbuf-2.24.0.tar.bz2
  cd gdk-pixbuf-2.24.0
  # TODO: Keep in mind that we don't use those. Obviously some libjpeg calls may fail. Question is - are they critical?
  ./configure --without-libtiff --without-libjpeg
  make
  echo ">>> --------"
  echo ">>> WARNING: Pixbuf was compiled with --without-libtiff --without-libjpeg flags"
  echo ">>> --------"  
  echo ">>> Done."
fi



if [ "1" -eq "$PIXBUF_INSTALL" ]; then
  NOTHING_RUN=0
  echo ">>> Installing Pixbuf library..."
  cd /tmp
  cd gdk-pixbuf-2.24.0
  make install  
  echo ">>> Done."
fi


if [ "1" -eq "$GTK_COMPILE" ]; then
  NOTHING_RUN=0
  echo ">>> Making Gtk+ library ..."
  cd /tmp
  wget http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-2.24.0.tar.bz2
  tar -jxvf gtk+-2.24.0.tar.bz2
  cd gtk+-2.24.0
  PKG_CONFIG_PATH=/usr/local/lib/pkgconfig ./configure
  make    
  echo ">>> Done."
fi


if [ "1" -eq "$GTK_INSTALL" ]; then
  NOTHING_RUN=0
  echo ">>> Installing Gtk+ library..."
  cd /tmp
  cd gtk+-2.24.0
  make install  
  echo ">>> Done."
fi


if [ "1" -eq "$XVFB_INSTALL" ]; then
  NOTHING_RUN=0

  echo ">>> Installing X-server and Xvfb..."
  # Install X
  yum -y install xorg-x11-server-Xorg xterm
  # Install X drivers
  yum -y install xorg-x11-drv-vesa xorg-x11-drv-evdev xorg-x11-drv-evdev-devel
  # Install xvfb
  yum -y install Xvfb  
  echo ">>> Done."
fi


if [ "1" -eq "$LINK_SO_TO_ELECTRON" ]; then
  NOTHING_RUN=0
  echo ">>> Linking SO Static libraries to electron (creating symlinks in electron directory)..."
  
  # check that electron is in the current directory
  if [ ! -f electron ]; then
    echo "************ ERROR ****************"
    echo "To run link-so-to-electron you must be in directory where electron executable is located!"
    echo "***********************************"
    exit 1
  fi
  ln -PL --verbose /usr/local/lib/libgconf-2.so.4
  ln -PL --verbose /usr/local/lib/libgtk-x11-2.0.so.0
  ln -PL --verbose /usr/local/lib/libgdk-x11-2.0.so.0
  ln -PL --verbose /usr/local/lib/libgdk_pixbuf-2.0.so.0  
fi


# =============================
# Help (when no args supplied)
# =============================
if [ "1" -eq $NOTHING_RUN ]; then
 echo ">>> Run command with task as parameter: " 
 CMD=$(basename $0)
 echo "     $CMD dist-deps centos-deps gconf-compile gconf-install"
 echo
 echo "     $CMD all-deps"
 echo
 echo ">>> Reccomended usage: "
 echo "     $CMD dev-tools all-deps gconf-all pixbuf-all gtk-all"
 echo ">>> Now change to the electron directory"
 echo "     $CMD link"
 echo
 echo ">>> Now you can verify that all dependencies are ok"
 echo "ldd electron | grep 'not found'"
 echo "./electron --enable-logging"
 echo 
 echo ">>> Now let's install X-server and Xvfb"
 echo "     $CMD xvfb-install"
 echo "Now you can run xvfb."
fi
