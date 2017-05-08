# 905kszaq-diff-patches

For updating S905kszaq LibreElec Community Builds.
(For uncompressed images)


Use with Xdelta3.0.11 binary diff program

https://github.com/jmacd/xdelta-gpl/releases/tag/v3.0.11



Example:

To update from version i to j

Unzip LibreELEC-S905.arm-8.0-8.0.1i.img.gz (using zip program)

xdelta3 -d -s LibreELEC-S905.arm-8.0-8.0.1i.img LibreELEC-S905.arm-8.0-8.0.1-I-TO-J LibreELEC-S905.arm-8.0-8.0.1j.img 

(xdelta3 -d -s SOURCE PATCHFILE TARGET)

MD5-SUMS for successful patches
-------------------------------

f9d4d795a7ecbf5552c35de748f23a27  LibreELEC-S905.arm-8.0-8.0.1j.img
38d9ff6a091af932da99e0ea6ebfd822  LibreELEC-S905.arm-8.0-8.0.1i.img
