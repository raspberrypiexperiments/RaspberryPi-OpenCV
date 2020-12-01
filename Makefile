NUM_PROCESSORS = `grep -c ^processor /proc/cpuinfo`

dependencies:
	sudo apt update && sudo apt-get upgrade -y
	sudo apt install build-essential cmake pkg-config -y
	sudo apt install libjpeg-dev libtiff5-dev libjasper-dev libpng-dev -y
	sudo apt install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libavresample-dev -y
	sudo apt install libfontconfig1-dev libcairo2-dev libgdk-pixbuf2.0-dev libpango1.0-dev libgtk2.0-dev libgtk-3-dev -y
	sudo apt install libatlas-base-dev gfortran liblapacke-dev -y
	sudo apt install libhdf5-dev libhdf5-serial-dev libhdf5-103 libqtgui4 libqtwebkit4 libqt4-test python3-pyqt5 -y
	sudo apt install libdc1394-22-dev libwebp-dev -y
	sudo apt install python3-dev python3-numpy python3-picamera -y

configure: dependencies
	cd opencv && git checkout 4.5.0
	cd opencv_contrib && git checkout 4.5.0
	mkdir -p opencv/build
	cd opencv/build && cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
    -D ENABLE_NEON=ON \
    -D ENABLE_VFPV3=ON \
    -D BUILD_TESTS=OFF \
    -D INSTALL_PYTHON_EXAMPLES=OFF \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D CMAKE_SHARED_LINKER_FLAGS=-latomic \
    -D BUILD_EXAMPLES=OFF ..

install: configure
	cd opencv/build && make -j$(NUM_PROCESSORS) && sudo make install && sudo ldconfig

uninstall: configure
	cd opencv/build && sudo make uninstall

