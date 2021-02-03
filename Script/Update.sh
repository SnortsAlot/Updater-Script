#!/usr/bin/env bash
source config.sh
DOWNLOAD_LOCATION=$directory
REQUIRED_PKG="p7zip-full"

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK

if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  sudo apt-get --yes install $REQUIRED_PKG 
fi

cd $DOWNLOAD_LOCATION

FN=`curl -s -I https://get.5e.tools/release/|grep filename|cut -d"=" -f2 | awk '{print $1}'`
FN=${FN//[$'\t\r\n"']}
echo "FN: $FN"

FN_IMG=`curl -s -I https://get.5e.tools/img/|grep filename|cut -d"=" -f2 | awk '{print $1}'`
FN_IMG=${FN_IMG//[$'\t\r\n"']}
echo "FN_IMG: $FN_IMG"

VER=`basename ${FN} ".zip"|sed 's/5eTools\.//'`
echo "VER: $VER"

CUR=$(<version)
echo " === Remote version: $VER"
echo " === Local version: $CUR"

if [ "$VER" != "$CUR" ]; then
  echo " === Local version outdated, updating..."
  echo -n $VER > version
  rm ./site/index.html 2> /dev/null || true
  
  echo " === Downloading new remote version..."
  curl --progress-bar -O -J https://get.5e.tools/release/ -C -
  curl --progress-bar -O -J https://get.5e.tools/img/ -C -
  
  echo " === Extracting site..."
  7z x ./$FN -o./site/ -y
  
  echo " === Extracting images..."
  7z x ./$FN_IMG -o./site/img -y
  mv ./site/img/tmp/5et/img/* ./site/img
  rm -r ./site/img/tmp
  rm ./$FN
  rm ./$FN_IMG
  
  echo " === Configuring..."
  cd ./site/
  find . -name \*.html -exec sed -i 's/"width=device-width, initial-scale=1"/"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/' {} \;
  cp 5etools.html index.html
  sed -i 's/<head>/<head>\n<link rel="apple-touch-icon" href="icon\/icon-512.png">/' index.html
  sed -i 's/navigator.serviceWorker.register("\/sw.js/navigator.serviceWorker.register("sw.js/' index.html
  sed -i 's/navigator.serviceWorker.register("\/sw.js/navigator.serviceWorker.register("sw.js/' 5etools.html
  
  echo " === Done!"
else
  echo " === Local version matches remote, no action."
fi
exit
