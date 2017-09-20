Setup VIM on Ubuntu 
===================
- [Intro](#intro)
- [Installation](#installation)
	- [Font for Powerline](#font-powerline)
	- [YouCompleteMe x64](#YouCompleteMe-x64)
	- [YouCompleteMe x32](#YouCompleteMe-x32)

Intro
-----
Installation
-----

### Font for Powerline

Powerline use a special font to display arrow and another symbol. We need to download 
the font and configuration font by using wget:

	wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
	
	wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf 

After download, we need to move font into font folder in our machine: **/usr/share/fonts**
or **/usr/local/share/fonts**, we can check that folder by command: **xset -q**

	sudo mv PowerlineSymbols.otf /usr/share/fonts/

Next, we need to update cache

	fc-cache -vf /usr/share/fonts/

Next step:

	mv 10-powerline-symbols.conf /etc/fonts/conf.d/


Finanlly **restart terminal** to update the change 

### YouCompleteMe x64
- Install development tools and CMake

	sudo apt-get install build-essential cmake

- Make sure you have Python headers installed:

	sudo apt-get install python-dev python3-dev

### YouCompleteMe x32
- Require CMake version >= 2.8.11

	sudo add-apt-repository ppa:kalakris/cmake
	
	sudo apt-get update
	
	sudo apt-get install cmake

- Require gcc 4.8 and g++ 4.8
•Add the ppa

	sudo add-apt-repository ppa:ubuntu-toolchain-r/test

•Then install gcc 4.8 and g++ 4.8:

	sudo apt-get update

	sudo apt-get install gcc-4.8 g++-4.8

•Once installed, run following commands one by one to use gcc 4.8 instead of previous version.

	sudo update-alternatives --remove-all gcc

	sudo update-alternatives --remove-all g++

	sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20

	sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20

	sudo update-alternatives --config gcc

	sudo update-alternatives --config g++
•Check
        gcc --version




