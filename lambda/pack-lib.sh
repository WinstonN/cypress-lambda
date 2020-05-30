mkdir lib
mkdir lib64

# copy Xvfb and Cypress binaries' shared library dependencies into lib
# lib
ldd /usr/bin/Xvfb | awk '{ print $3 }' | grep '\/lib\/' | xargs -I{} cp -R -L {} ./lib/
# lib64 
ldd /usr/bin/Xvfb | awk '{ print $3 }' | grep '\/lib64\/' | xargs -I{} cp -R -L {} ./lib/
# lib
ldd /root/.cache/Cypress/4.7.0/Cypress/Cypress | awk '{ print $3 }' | grep '\/lib\/' \
  | xargs -I{} cp -R -L {} ./lib/
#lib64
ldd /root/.cache/Cypress/4.7.0/Cypress/Cypress | awk '{ print $3 }' | grep '\/lib64\/' \
  | xargs -I{} cp -R -L {} ./lib64/

# a few more dependencies we know we need
cp -L -R /usr/share/X11/xkb ./lib/
# cp /usr/lib64/libelf.so ./lib/libelf.so.1
cp /app/default.xkm ./lib/
cp -L -R /root/.cache/Cypress/4.7.0/Cypress/* ./lib/

#echo "finding symbolic links and creating them to files"
#find ./lib/ -type l -ls | xargs cp --remove-destination "$(readlink file1)" file1

# echo 'copy files in ./lib64/ dir to ./lib/'
# find /lib64/ -maxdepth 1 -type f -exec cp {} ./lib/ \;

echo "copy libelf.so.1"
cp -L -R /lib64/libelf-0.176.so ./lib/libelf.so.1
cp -L -R /lib64/libelf-0.176.so ./lib64/libelf.so.1
echo "copy libgobject-2.0.so.0" 
cp -L -R /lib64/libgobject-2.0.so.0.5600.1 ./lib/libgobject-2.0.so.0
echo "copy libglib-2.0.so.0"
cp -L -R /lib64/libglib-2.0.so.0 ./lib/libglib-2.0.so.0
echo "copy libgio-2.0.so.0"
cp -L -R /lib64/libgio-2.0.so.0 ./lib/libgio-2.0.so.0
echo "copy libX11-xcb.so.1"
cp -L -R /lib64/libX11-xcb.so.1 ./lib/libX11-xcb.so.1
echo "copy libXcomposite.so.1"
cp -L -R /lib64/libXcomposite.so.1 ./lib/libXcomposite.so.1
echo "copy libXcursor.so.1"
cp -L -R /lib64/libXcursor.so.1 ./lib/libXcursor.so.1
echo "copy libXdamage.so.1"
cp -L -R /lib64/libXdamage.so.1.1.0 ./lib/libXdamage.so.1
echo "copy libXfixes.so.3"
cp -L -R /lib64/libXfixes.so.3 ./lib/libXfixes.so.3
echo "copy libXi.so.6"
cp -L -R /lib64/libXi.so.6 ./lib/libXi.so.6
echo "copy libXrender.so.1"
cp -L -R /lib64/libXrender.so.1 ./lib/libXrender.so.1
echo "copy libXtst.so.6"
cp -L -R /lib64/libXtst.so.6 ./lib/libXtst.so.6
echo "copy libnss3.so"
cp -L -R /lib64/libnss3.so ./lib/libnss3.so
echo "copy libsmime3.so"
cp -L -R /lib64/libsmime3.so ./lib/libsmime3.so
echo "copy libdbus-1.so.3"
cp -L -R /lib64/libdbus-1.so.3 ./lib/libdbus-1.so.3
echo "copy libgtk-3.so.0"
cp -L -R /lib64/libgtk-3.so.0 ./lib/libgtk-3.so.0
echo "copy libgdk-3.so.0"
cp -L -R /lib64/libgdk-3.so.0 ./lib/libgdk-3.so.0
echo "copy libpangocairo-1.0.so.0"
cp -L -R /lib64/libpangocairo-1.0.so.0.4200.3 ./lib64/libpangocairo-1.0.so.0
echo "copy libgdk_pixbuf-2.0.so.0"
cp -L -R /lib64/libgdk_pixbuf-2.0.so.0.3612.0 ./lib/libgdk_pixbuf-2.0.so.0
echo "copy libpangocairo-1.0.so.0"
cp -L -R /lib64/libpangocairo-1.0.so.0.4200.3 ./lib/libpangocairo-1.0.so.0
echo "copy libpango-1.0.so.0"
cp -L -R /lib64/libpango-1.0.so.0.4200.3 ./lib/libpango-1.0.so.0
echo "copy libatk-1.0.so.0"
cp -L -R /lib64/libatk-1.0.so.0.22209.1 ./lib/libatk-1.0.so.0
echo "copy libcairo.so.2"
cp -L -R /lib64/libcairo.so.2.11512.0 ./lib/libcairo.so.2
echo "copy libexpat.so.1"
cp -L -R /lib64/libexpat.so.1.6.0 ./lib/libexpat.so.1
echo "copy libXrandr.so.2"
cp -L -R /lib64/libXrandr.so.2.2.0 ./lib/libXrandr.so.2
echo "copy libXss.so.1"
cp -L -R /lib64/libXss.so.1.0.0 ./lib/libXss.so.1
echo "copy libasound.so.2"
cp -L -R /lib64/libasound.so.2.0.0 ./lib/libasound.so.2
echo "copy libatk-bridge-2.0.so.0"
cp -L -R /lib64/libatk-bridge-2.0.so.0.0.0 ./lib/libatk-bridge-2.0.so.0
echo "copy libatspi.so.0"
cp -L -R /lib64/libatspi.so.0.0.1 ./lib/libatspi.so.0
echo "copy libcups.so.2"
cp -L -R /lib64/libcups.so.2 ./lib/libcups.so.2
echo "copy libgmodule-2.0.so.0"
cp -L -R /lib64/libgmodule-2.0.so.0.5600.1 ./lib/libgmodule-2.0.so.0
echo "copy libmount.so.1"
cp -L -R /lib64/libmount.so.1.1.0 ./lib/libmount.so.1
echo "copy libcairo-gobject.so.2"
cp -L -R /lib64/libcairo-gobject.so.2.11512.0 ./lib/libcairo-gobject.so.2
echo "copy libwayland-client.so.0"
cp -L -R /lib64/libwayland-client.so.0.3.0 ./lib/libwayland-client.so.0
echo "copy libepoxy.so.0"
cp -L -R /lib64/libepoxy.so.0.0.0 ./lib/libepoxy.so.0
echo "copy libpangoft2-1.0.so.0"
cp -L -R /lib64/libpangoft2-1.0.so.0.4200.3 ./lib/libpangoft2-1.0.so.0
echo "copy libfontconfig.so.1"
cp -L -R /lib64/libfontconfig.so.1.11.1 ./lib/libfontconfig.so.1
echo "copy libXinerama.so.1"
cp -L -R /lib64/libXinerama.so.1.0.0 ./lib/libXinerama.so.1
echo "copy libxkbcommon.so.0"
cp -L -R /lib64/libxkbcommon.so.0.0.0 ./lib/libxkbcommon.so.0
echo "copy libwayland-cursor.so.0"
cp -L -R /lib64/libwayland-cursor.so.0.0.0 ./lib/libwayland-cursor.so.0
echo "copy libwayland-egl.so.1"
cp -L -R /lib64/libwayland-egl.so.1.0.0 ./lib/libwayland-egl.so.1
echo "copy libthai.so.0"
cp -L -R /lib64/libthai.so.0.1.6 ./lib/libthai.so.0
echo "copy libfribidi.so.0"
cp -L -R /lib64/libfribidi.so.0.4.0 ./lib/libfribidi.so.0
echo "copy libEGL.so.1"
cp -L -R /lib64/libEGL.so.1.1.0 ./lib/libEGL.so.1
echo "copy libxcb-shm.so.0"
cp -L -R /lib64/libxcb-shm.so.0.0.0 ./lib/libxcb-shm.so.0
echo "copy libxcb-render.so.0"
cp -L -R /lib64/libxcb-render.so.0.0.0 ./lib/libxcb-render.so.0
echo "copy libavahi-common.so.3"
cp -L -R /lib64/libavahi-common.so.3.5.3 ./lib/libavahi-common.so.3
echo "copy libavahi-client.so.3"
cp -L -R /lib64/libavahi-client.so.3.2.9 ./lib/libavahi-client.so.3
echo "copy libcrypt.so.1"
cp -L -R /lib64/libcrypt-2.26.so ./lib/libcrypt.so.1
echo "copy libblkid.so.1"
cp -L -R /lib64/libblkid.so.1.1.0 ./lib/libblkid.so.1
echo "copy libuuid.so.1"
cp -L -R /lib64/libuuid.so.1.3.0 ./lib/libuuid.so.1
echo "copy libharfbuzz.so.0"
cp -L -R /lib64/libharfbuzz.so.0.10705.0 ./lib/libharfbuzz.so.0
echo "copy libelf.so.1"
cp -L -R /lib64/libelf-0.176.so ./lib/libelf.so.1




# echo "looking at lib folder"
# ls -la ./lib/
# echo "looking at lib64 folder"
# ls -la ./lib64/

# we need some node prune up in here
# gotta get lib under 512mb!
curl -sfL https://install.goreleaser.com/github.com/tj/node-prune.sh \
  | bash -s -- -b /usr/local/bin
node-prune lib/resources/app/packages/server
node-prune lib/resources/app/packages/https-proxy
node-prune lib/resources/app/packages/electron

