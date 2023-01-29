# This repo is a fork of [socat-1.7.3.0-windows](https://github.com/tech128/socat-1.7.3.0-windows) #

## Introduction ##
This repository contains a compiled Socat binary for Windows with the
required library

Some optimizations are done which should help this version of socat to
stand up out of the rest.

These optimizations were -march=i586 -flto -fomit-frame-pointer

## Install ##
Run the powershell script as administrator in order to install Socat,
this will download all necessary libs and executable and add them to
the path: 

``` powershell
.\install.ps1
```
