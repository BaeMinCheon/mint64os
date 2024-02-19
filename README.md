# mint64os
Make my own operating system based on the repository https://github.com/kkamagui/mint64os, but using `Visual Studio Code` in `Windows 11`.

# Prerequisites
0. You must prepare a system with `Windows 11` installed.
1. Install `Visual Studio Code`.
2. Prepare the environment for `GCC` in `Visual Studio Code` using https://code.visualstudio.com/docs/cpp/config-mingw.
    - Especially, I recommend you to install `MSYS2` for your convenience.
3. Install `NASM` via `MSYS2`.
    - https://packages.msys2.org/package/mingw-w64-ucrt-x86_64-nasm
4. Install `QEMU` via `MSYS2`.
    - https://www.qemu.org/download/#windows
5. Install `make` via `MSYS2`.
    - https://packages.msys2.org/package/mingw-w64-ucrt-x86_64-make
6. Install `Binutils` via `MSYS2`.
    - https://packages.msys2.org/package/mingw-w64-ucrt-x86_64-avr-binutils

# Notices
- You can use `make` with the name of `mingw32-make` from the command prompt. If you want to use `make` itself, you should create [a link for it](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/mklink).