cd ~/
git clone https://github.com/warmcat/libwebsockets.git
cd libwebsockets
# If you want the stable version of libwebsockets, uncomment the next line
# git checkout v2.4-stable
mkdir build
cd build
# See https://github.com/meetecho/janus-gateway/issues/732 re: LWS_MAX_SMP
cmake -DLWS_MAX_SMP=1 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_C_FLAGS="-fpic" ..
make && make install

