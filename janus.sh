cd ~/
npm i -g n
n stable
git clone https://github.com/meetecho/janus-gateway.git
cd janus-gateway
sh autogen.sh
./configure --prefix=/opt/janus/ --disable-rabbitmq --enable-docs --enable-all-js-modules
make
make install
