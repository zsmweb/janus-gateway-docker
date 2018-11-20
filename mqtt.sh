cd ~/
git clone https://github.com/eclipse/paho.mqtt.c.git
cd paho.mqtt.c
make && sudo make install

cd ~/
git clone https://github.com/alanxz/rabbitmq-c
cd rabbitmq-c
git submodule init
git submodule update
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make && sudo make install


