# SOC-SEM

SoC template comprising an open-source RISC-V processor (picorv32), an internal
SRAM memory subsystem, 2 UARTs (iob-uart), a SEM core that communicates with the processor via UART_1 and an optional external DDR memory
subsystem. The system also includes 16 32-bits Adders groupped in groups of 4 localized in the 4 corners of the device.

An example of a program that 

A program comprising of the injection of an error in Adder2 (placed in the bottom-left corner) is available at firmware.c and the result of this program can be found in adder2_err_injection.log .

## Clone the repository

``git clone --recursive git@github.com:AndreMerendeira/soc-sem.git``

Access to Github by *ssh* is mandatory so that submodules can be updated.


## The system configuration file: system.mk

The single system configuration is the system.mk file residing at the repository
root. The user is free to edit the created system.mk file.

 The variables that can be set are explained in the original system.mk file.

The following commands will run locally if the board selected by the BOARD
variable has its compiler installed and the board is listed in the
LOCAL\_FPGA\_LIST variable.  Otherwise they will run by ssh on the server
selected by the FPGA_SERVER variable.

To compile the FPGA:
```
make fpga
```

To clean FPGA files:
```
make fpga-clean
```

To clean and also delete any used FPGA vendor IP core:
```
make fpga-clean-ip
```


## Running on the board

The following commands will run locally if the board selected by the BOARD
variable is installed and listed in the LOCAL\_BOARD\_LIST variable. Otherwise
they will run by ssh on the server selected by the BOARD_SERVER variable.

To load the board with an FPGA configuration bitstream file:
```
make board-load
```

To load the board with the most recently compiled firmware and run:
```
make board-run
```

To clean the board directory:
```
make board-clean
```


## Software

The following commands assume the RISC-V toolchain is installed. Otherwise
follow the instructions below to install the toolchain.

To compile the firmware:
```
make  firmware
```

To clean the firmware directory:
```
make  firmware-clean
```

To compile the bootloader:
```
make bootloader
```

To clean the bootloader directory:
```
make bootloader-clean
```

To compile the provided *console* PC program to communicate with the board:
```
make console
```


To clean the console directory
```
make console-clean
```

To clean all software directories
```
make sw-clean
```


To compile and run a particular system configuration on the board selected by the BOARD variable:
```
make test-board-config
```


## Cleaning

The following command will clean the selected directories for simulation, FPGA compilation and board run:
```
make clean-all
```



## Instructions for Installing the RISC-V GNU Compiler Toolchain

### Get sources

```
git clone https://github.com/riscv/riscv-gnu-toolchain
cd riscv-gnu-toolchain
git submodule update --init --recursive
git checkout <stable tag>
git submodule update --init --recursive
```

### Prerequisites

For Ubuntu OS and its variants:

```
sudo apt install autoconf automake autotools-dev curl python3 python2 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev
```
To check your python version, use:
```
python --version
```
If this doesn't return Python 2.*, navigate to your /usr/bin folder and soft-link python2 to python using:
```
sudo ln -s python2 /usr/bin/python
```

For CentOS and its variants:

```
sudo yum install autoconf automake python3 python2 libmpc-devel mpfr-devel gmp-devel gawk  bison flex texinfo patchutils gcc gcc-c++ zlib-devel expat-devel
```

### Installation

```
sudo ./configure --prefix=/path/to/riscv --enable-multilib
sudo make
export PATH=$PATH:/path/to/riscv/bin
```
The *export PATH* command should be added to the bottom of your ~/.bashrc, so that you do not have to type it for every session.
