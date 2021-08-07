# RaspberryPi-OpenCV

This repository includes installation procedure for OpenCV 4.5.0.

## Known supported Raspberry Pi

* Raspberry Pi 3B,
* Raspberry Pi 4B.

## Installation Procedure

```bash
~ $ git clone --recurse-submodules -j4 https://github.com/raspberrypiexperiments/RaspberryPi-OpenCV.git
~ $ cd RaspberryPi-OpenCV
~/RaspberryPi-OpenCV $ make install
```

## Unistallation procedure

```bash
~/RaspberryPi-OpenCV $ make uninstall
~/RaspberryPi-OpenCV $ cd ..
~ $ rm -rf RaspberryPi-OpenCV
```

## License

MIT License

Copyright (c) 2021 Marcin Sielski <marcin.sielski@gmail.com>
