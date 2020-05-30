#!/bin/bash
echo 'linking files'
cd /root/.cache/Cypress/4.7.0/Cypress
ln -PL /app/lib/libelf.so.1
# ln -PL /usr/local/lib/libgconf-2.so.4
# ln -PL /usr/local/lib/libgtk-x11-2.0.so.0
# ln -PL /usr/local/lib/libgdk-x11-2.0.so.0
# ln -PL /usr/local/lib/libgdk_pixbuf-2.0.so.0
