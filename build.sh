#!/bin/bash
_current_folder=`pwd`

select_folder (){
	options=( $(ls -d */ ) )
	PS3="Please make a choice: "
	select opt in "${options[@]}" "Quit" ; do 
	    if (( REPLY == 1 + ${#options[@]} )) ; then
		exit

	    elif (( REPLY > 0 && REPLY <= ${#options[@]} )) ; then
		echo  "You picked $opt which is $REPLY"
		break

	    else
		echo "Invalid option. Try another one."
	    fi
	done    
}

rm -rf build
echo "select which vnf you would like to build"
select_folder 
mkdir build
pushd $opt

echo "select which type of VNFM you are using"
select_folder
pushd $opt

echo "creating tar files"
make all
mv *.tar ${_current_folder}/build 
cp nsd.json ${_current_folder}/build

popd 
popd 
