if [ "$1" == "-skip" ] ; then
  # This skip is to set the flags to a switch
	python=1
	req=1
	logging=1
else
    # To ensure that Mac OS doesnt have trouble multi threading
  export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
  echo "------------------------- Attention -------------------------------"
  echo "   If this is your first installation, you may have to restart "
  echo "   your terminal, after this preliminary installation"
  echo "-------------------------------------------------------------------"

	# Setup files and logs that we will need
	mkdir tmp/
	touch tmp/bot.log
	echo "------------------------- Step 1/4 --------------------------------"
	echo "      Succesfully setup 'tmp' directory and logging files"
	echo "-------------------------------------------------------------------"
	logging=1
	python=0
	req=0
fi

# Checks for correct python version
if [[ "$python" == 0 ]] ; then
  version=(python3 -c 'import sys; print(sys.version_info[:])')
  if [[ -z "$version" ]] ; then
    echo "Requires Python 3.7.5 or higher to run"
    exit 1;
  else
    echo "------------------------- Step 2/4 --------------------------------"
	  echo "      Succesfully Verified Python3 Installation"
	  echo "-------------------------------------------------------------------"
    python=1
  fi
fi

# Pip installs any python package required from "requirements.txt"
if [ "$req" != 1 ] ; then
 	while read -r p; do
	 pip3 install "$p"
 	done < requirements.txt
	req=1
	echo "--------------------------- Step 3/4 ------------------------------"
	echo "       Succesfully Installed Python3 Pip Requirements"
	echo "-------------------------------------------------------------------"
fi

# Try to kickstart Python Server:
echo "--------------------------- Step 4/4 ------------------------------"
echo "                 ...Launching Flask Server..."
echo "-------------------------------------------------------------------"
python3 scraper.py