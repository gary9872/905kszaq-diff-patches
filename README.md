# 905kszaq-diff-patches

For updating S905kszaq LibreElec Community Builds.
(For images with sensors)

Interactive: (For Linux)

Put image in this directory and run ./updater.sh
(Preferably NOT AS ROOT!)

Requires: Xdelta 3.0.11 
        : gzip 1.6 or higher


https://github.com/jmacd/xdelta-gpl/releases/tag/v3.0.11
www.gzip.org


Manually : (For Linux)

To update from version i to j

$ gunzip LibreELEC-S905.arm-8.0-8.0.1i.img.gz 

$ xdelta3 -d -s LibreELEC-S905.arm-8.0-8.0.1i.img LibreELEC-S905.arm-8.0-8.0.1-I-TO-J LibreELEC-S905.arm-8.0-8.0.1j.img 

---------------------------------------------


(the above command should be all on one line)

(xdelta3 -d -s SOURCE PATCHFILE TARGET)

MD5-SUMS for successful patches
-------------------------------


71569645938be18845ec291cdb11d06f  LibreELEC-S905.arm-8.0-8.0.1a.img 
bfa841e465f186d888963354404d7e5e  LibreELEC-S905.arm-8.0-8.0.1b.img 
4de0d82c7a1b1467c8e4b27fecf0f279  LibreELEC-S905.arm-8.0-8.0.1c.img
b47001c2a33a5a16d24a5517b28b20d7  LibreELEC-S905.arm-8.0-8.0.1d.img
cdd2891ccc69fddd85be84597af43eb4  LibreELEC-S905.arm-8.0-8.0.1e.img
f524459a0fbd98060d6a5f3518789fdb  LibreELEC-S905.arm-8.0-8.0.1f.img
09eb407af6d9c44ace293502f3800a7b  LibreELEC-S905.arm-8.0-8.0.1g.img
f926a1b2e5f44a10655330727fa8334d  LibreELEC-S905.arm-8.0-8.0.1h.img
38d9ff6a091af932da99e0ea6ebfd822  LibreELEC-S905.arm-8.0-8.0.1i.img
9d4d795a7ecbf5552c35de748f23a27   LibreELEC-S905.arm-8.0-8.0.1j.img
3946f1c51ac2f48638a03e33695cce09  LibreELEC-S905.arm-8.0-8.0.1k.img



