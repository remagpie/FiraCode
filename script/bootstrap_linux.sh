#!/bin/bash
set -o errexit -o nounset -o pipefail
cd "`dirname $0`/.."

sudo apt update
sudo apt install -y python3.8 python3-setuptools python3.8-dev pkg-config zlib1g ttfautohint woff2 sfnt2woff-zopfli

sudo python3.8 -m easy_install pip
python3.8 -m pip install virtualenv --user
python3.8 -m virtualenv venv
source venv/bin/activate

# https://github.com/googlefonts/gftools/issues/121
python3.8 -m pip install -U Pillow==5.4.1 idna==2.8 requests==2.21.0 urllib3==1.24.1
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
python3.8 -m pip install pycairo
python3.8 -m pip install git+https://github.com/googlefonts/gftools

python3.8 -m pip install fontmake
python3.8 -m pip install fontbakery
