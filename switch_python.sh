#!/bin/bash
echo "Prepare to switch to the Python version"

python_version=3
usr_python_link="/usr/bin/python"
usr_python2_path="/usr/bin/python2"
usr_python3_path="/usr/bin/python3"

bin_python_link="/bin/python"
bin_python2_path="/bin/python2"
bin_python3_path="/bin/python3"

# get argument
if [[ ! "$#" -eq "1" ]];then
    echo "Error: need python version!"
    echo "Example: ./switch_python 2"
    exit 1
fi
python_version=$1
echo "Info: switch to Python $python_version"

echo "Info: current python version: " 
echo -n "[$usr_python_link]: " & $usr_python_link -V
echo -n "[$bin_python_link]: " & $bin_python_link -V


# judge python
if ! [ -x "$(command -v python2)" ]; then
    echo 'Error: python2 is not installed.' >&2
    exit 1
else
    echo "Info: Python2 version: "
    echo -n "[$usr_python2_path(Defalut): " & $usr_python2_path -V
    echo -n "[$bin_python2_path]: " & $bin_python2_path -V
fi
if ! [ -x "$(command -v python3)" ]; then
    echo 'Error: python3 is not installed.' >&2
    exit 1
else
    echo "Info: Python3 version: "
    echo -n "[$usr_python3_path](Defalut): " & $usr_python3_path -V
    echo -n "[$bin_python3_path]: " & $bin_python3_path -V
fi

# switch
sudo rm $usr_python_link
sudo rm $bin_python_link
if [ $python_version -eq 2 ]; then
    sudo ln -s $usr_python2_path $usr_python_link
    sudo ln -s $bin_python2_path $bin_python_link
elif [ $python_version -eq 3 ]; then
    sudo ln -s $usr_python3_path $usr_python_link
    sudo ln -s $bin_python3_path $bin_python_link
else
    echo "Error: unsupport python version!"
    exit 1
fi

echo "Info: switch python version success!"

echo "Info: current python version: " 
echo -n "[$usr_python_link]: " & $usr_python_link -V
echo -n "[$bin_python_link]: " & $bin_python_link -V







