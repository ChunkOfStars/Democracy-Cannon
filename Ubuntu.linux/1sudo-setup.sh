#!/bin/bash
##Ruby Check and Install
rubyver=`ruby -v | grep '1.9.3.p'`
if [ -z $rubyver ]; then
	echo 'Ruby 1.9.3 not found. Starting install'
	apt-get install ruby1.9.3
else
	echo 'Ruby 1.9.3 found.'
end
##t install & setup
echo "Installing t Twitter CLI"
gem install t
exit 0
