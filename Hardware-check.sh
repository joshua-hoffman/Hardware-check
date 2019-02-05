#!/bin/bash


##/ Joshua Hoffman /##

  
FORMATING () {

            RED=`tput setaf 1`
            GREEN=`tput setaf 2`
			BLUE=`tput setaf 4`
            NONE=`tput sgr0`
            LINS="----------------------------------------"
            ELINS="${RED}$LINS${NONE}"

} 


SPINNER () { ##/ Spinning animation (Stack Overflow) /## 

            info="$1"
            pid=$!
            delay=0.25
            spinstr='|/-\'
        
    while kill -0 $pid 2> /dev/null; do
    
            temp=${spinstr#?}
            
                printf "[%c]  $info" "$spinstr"

            spinstr=$temp${spinstr%"$temp"}
        
                sleep $delay
            
            reset="\b\b\b\b\b\b"
        
        for ((i=1; i<=$(echo $info | wc -c); i++)); do
    
                reset+="\b"
        
        done
        
                printf $reset
        
    done
    
            printf "   \b\b\b\b"
    
}


CHECK_ROOT () { 
  
    "FORMATING"
    
    if (( EUID != 0 ))
    then

        echo $ELINS
        echo -e "${RED}ERROR:${NONE} Run as root!"  
        echo $ELINS
        exit
    
    fi

}


CHECK_DEP () { ##/ Depericated for AUTO_DEP /##

    "FORMATING"
 
            CHKHP=$(dpkg-query -l | grep -c "hdparm")
            CHKLS=$(dpkg-query -l | grep -c "lm-sensors")
            CHKSM=$(dpkg-query -l | grep -c "smartmontools")
            CHKMD=$(dpkg-query -l | grep -c "mdadm")
            CHKIF=$(dpkg-query -l | grep -c "net-tools")
			CHKCL=$(dpkg-query -l | grep -c "bsdmainutils")
         
	if [ $CHKCL = 0 ]
    then

        echo $LINS
        echo "${RED}Package bsdmainutils not found, install it (y/n)?${NONE}"
        echo $LINS
        read LMRCL
        
            [[ $LMRCL == '' ]]
            
                if [ $LMRCL = "y" ]
                then 
                
                    apt-get -y install bsdmainutils
					clear
                
                elif [ $LMRCL = "n" ]
                then
                
                    clear
                    echo $LINS
                    echo "bsdmainutils not installed, any key to exit..."
                    echo $LINS
                    read
                    clear
                    exit
                    
                fi
				
    fi;
		 
    if [ $CHKHP = 0 ]
    then

        echo $LINS
        echo "${RED}Package hdparm not found, install it (y/n)?${NONE}"
        echo $LINS
        read LMRHP
        
            [[ $LMRHP == '' ]]
            
                if [ $LMRHP = "y" ]
                then 
                
                    apt-get -y install hdparm
					clear
                
                elif [ $LMRHP = "n" ]
                then
                
                    clear
                    echo $LINS
                    echo "hdparm not installed, any key to exit..."
                    echo $LINS
                    read
                    clear
                    exit
                    
                fi
				
    fi;
         
    if [ $CHKLS = 0 ]
    then
        
        echo $LINS
        echo "${RED}Package lm-sensors not found, install it (y/n)?${NONE}"
        echo $LINS
        read LMREA
        
            [[ $LMREA == '' ]]
            
                if [ $LMREA = "y" ]
                then
                
                    apt-get -y install lm-sensors 
					clear
					
                elif [ $LMREA = "n" ]
                then
                
                    clear
                    echo $LINS
                    echo "lm-sensors not installed, any key to exit..."
                    echo $LINS
                    read
                    clear
                    exit
                    
                fi
				
    fi;
             
    if [ $CHKSM = 0 ]
    then
        
        echo $LINS
        echo "${RED}Package smartmontools not found, install it (y/n)?${NONE}"
        echo $LINS
        read SMREA
        
            [[ $SMREA == '' ]]
            
                if [ $SMREA = "y" ]
                then
                
                    apt-get -y install smartmontools 
					clear
					
                elif [ $SMREA = "n" ]
                then
                
                    clear
                    echo $LINS
                    echo "smartmontools not installed, any key to exit..."
                    echo $LINS
                    read
                    clear
                    exit
                    
                fi
				
    fi;
    
    if [ $CHKMD = 0 ]
    then
        
        echo $LINS
        echo "${RED}Package mdadm not found, install it (y/n)?${NONE}"
        echo $LINS
        read MDREA
        
    
        [[ $MDREA == '' ]]
            
                if [ $MDREA = "y" ]
                then
                
                    apt-get -y install mdadm
					clear
					
                elif [ $MDREA = "n" ]
                then
                
                    clear
                    echo $LINS
                    echo "mdadm not installed, any key to exit..."
                    echo $LINS
                    read
                    clear
                    exit
                    
                fi
				
    fi;
    
    if [ $CHKIF = 0 ]
    then
        
        echo $LINS
        echo "${RED}Package net-tools not found, install it (y/n)?${NONE}"
        echo $LINS
        read IFREA
        
    
        [[ $IFREA == '' ]]
            
                if [ $IFREA = "y" ]
                then
                
                    apt-get -y install net-tools
					clear
					
				elif [ $IFREA = "n" ]
                then
                
                    clear
                    echo $LINS
                    echo "net-tools not installed, any key to exit..."
                    echo $LINS
                    read
                    clear
                    exit
                    
                fi
                 
    fi;
     
}

AUTO_DEP () {

	"FORMATING"
	
		CHKHP=$(dpkg-query -l | grep -c "hdparm")
        CHKLS=$(dpkg-query -l | grep -c "lm-sensors")
        CHKSM=$(dpkg-query -l | grep -c "smartmontools")
        CHKMD=$(dpkg-query -l | grep -c "mdadm")
        CHKIF=$(dpkg-query -l | grep -c "net-tools")
		CHKCL=$(dpkg-query -l | grep -c "bsdmainutils")
		
	if [ $CHKHP = 1 ] && [ $CHKLS = 1 ] && [ $CHKSM = 1 ] && [ $CHKMD = 1 ] && [ $CHKIF = 1 ] && [ $CHKCL = 1 ]
    then
              
		echo $LINS
		echo "All packages are installed"
		echo $LINS
		sleep 5
		clear
		
	elif [ $CHKHP = 0 ] || [ $CHKLS = 0 ] || [ $CHKSM = 0 ] || [ $CHKMD = 0 ] || [ $CHKIF = 0 ] || [ $CHKCL = 0 ]
	then
	
	apt-get install hdparm lm-sensors smartmontools mdadm net-tools bsdmainutils -y
	clear
	
	fi
	
		

}

BIG_FILE () {

	"FORMATING"
			
			CUDIR=$(pwd)
			BFEXI=$(ls $CUDIR | grep -c Big_file.txt)

	if [ $BFEXI = 0 ]
	then
	
		fallocate -l 1G Big_file.txt
		
	fi

}


AUTO_HD () {

	"FORMATING"
	
			HDNUM_1=$(fdisk -l | grep 'Disk /dev/sd*' | awk '{print $2}' | sed -n '1p' | tr -d :)
			HDNUM_2=$(fdisk -l | grep 'Disk /dev/sd*' | awk '{print $2}' | sed -n '2p' | tr -d :)
			HDNUM_3=$(fdisk -l | grep 'Disk /dev/sd*' | awk '{print $2}' | sed -n '3p' | tr -d :)

}


AUTO_NIC () {

	"FORMATING"
	
			NETIF_1=$(ifconfig | grep "encap:Ethernet" | awk '{print $1}' | tr -d : | sed -n '1p')
			NETIF_2=$(ifconfig | grep "encap:Ethernet" | awk '{print $1}' | tr -d : | sed -n '2p')
			NETIF_3=$(ifconfig | grep "encap:Ethernet" | awk '{print $1}' | tr -d : | sed -n '3p')

}


USER_HD () {

    "FORMATING"

        clear
        echo $LINS
        echo "Avaliable disks:"
        echo $LINS
        echo

            fdisk -l | grep 'Disk /dev/*' | awk '{print $2, $3, $4}'

        echo
        echo $LINS
        echo "Enter HD ID:"
        echo $LINS
        read HDNUM

            [[ $HDNUM == '' ]]
            
				OPTD=$(smartctl -a /dev/$HDNUM | sed -n '4p' | grep -c 'Unable to detect')
            
                if [ $OPTD = 1 ] 
                then
                
                    clear
                    echo $ELINS
                    echo "${RED}ERROR:${NONE} HD not found!"
                    echo $ELINS
                    exit
                    
                fi
                
        clear
                
}


USER_NIC () {

    "FORMATING"

        clear
        echo $LINS
        echo "Network interfaces:"
        echo $LINS
        echo

            ifconfig | grep "encap:Ethernet" | awk '{print $1}' | tr -d :

        echo
        echo $LINS
        echo "Enter NIC ID:"
        echo $LINS
        read NETIF

            [[ $NETIF == '' ]]
            
				ETHDT=$(ifconfig $NETIF | grep -c "encap:Ethernet")
            
                if [ $ETHDT = 0 ] 
                then
        
                    clear
                    echo $ELINS
                    echo "${RED}ERROR:${NONE} NIC not found!"
                    echo $ELINS
                    exit

                fi
            
        clear
    
}


VIGOR_STATUS () {

	"FORMATING"
	
			VIGOS=$(uname -a | awk '{print $2}')
			VIGSN=$(/vigor/scripts/getregvalue.sh /system/HW_SerialNumber)
			VIGSV=$(/vigor/scripts/getregvalue.sh /version/ServerVersion)
			VIGPV=$(/vigor/scripts/getregvalue.sh /system/PatchVersion)
			VIGCL=$(grep -Po '(?<=value=str:")([aA0-zZ9]{0,5})' /vigor/registry/_showtracker_StationCallLetters.regdef)

}


SYSTEM_STATUS () {


	"FORMATING"
	
			SYSUT=$(uptime -s | awk -F'( |-)+' '{print $2 "/" $3 "/" $1}' | xargs date +'%m/%d/%y' -d)
			SYSUS=$(whoami)
			SYSDI=$(uname -a | awk '{print $6}')
			SYSKV=$(uname -a | awk '{print $7}')
			SYSSI=$(ls /storage/ | grep "server*" | awk -F'(_|-)' '{print $4}' | xargs date +'%m/%d/%y' -d)
}

SAT_STATUS () {


	"FORMATING"
	
			SATHW=$(/vigor/scripts/getregvalue.sh /recorder/Adapters/primary/CardType)
			SATOS=$(/vigor/scripts/getregvalue.sh /recorder/Adapters/primary/Calibration)
			SATSG=$(/vigor/scripts/getregvalue.sh )
		
}

NET_STATUS_GLOBAL () {

	"FORMATING"


			GLODH=$(/vigor/scripts/getregvalue.sh /system/DHCP_Enabled)
			GLODO=$(cat /storage/config/dns | grep Server1 | awk '{print $2}')
			GLODT=$(cat /storage/config/dns | grep Server2 | awk '{print $2}')
			GLONO=$(cat /storage/config/ntp | grep Server1 | awk '{print $2}')
			GLONT=$(cat /storage/config/ntp | grep Server2 | awk '{print $2}')
		
}

HW_DETECT () {

	"FORMATING"
	
			DETMA=$(lspci | grep -c "Matrox")
			DETSO=$(lspci | grep -c "Philips")
			DETST=$(lspci | grep -c "544d:6178")
			DETET=$(lspci | grep -c "82576")
			DETUS=$(lsblk | grep -c "usb")
			DETMB=$(dmidecode --type baseboard | grep "Product Name" | awk '{print $3}')
		
}


HD_STATUS_1 (){

    "FORMATING"
     
			if [[ -z "$HDNUM_1" ]]
			then
			
				HDNUM_1=$(echo "Not detected")
			
			else
				
				OPTR_1=$(smartctl -a $HDNUM_1 | grep "Reallocated_Sector_Ct" | awk '{print $10}')
				OPTT_1=$(smartctl -a $HDNUM_1 | grep "overall-health" | grep -c 'PASSED')
				OPTS_1=$(smartctl -a $HDNUM_1 | grep "User Capacity:" | awk '{print $5, $6}' | tr -d [ | tr -d ])
				OPTN_1=$(smartctl -a $HDNUM_1 | grep "Serial Number:" | awk '{print $3}')
				OPTC_1=$(smartctl -a $HDNUM_1 | grep "Power On Hours:" | tr -d , | awk '{print $4/24}')
				OPTO_1=$(sync; dd if=$HDNUM_1 of=tempfile bs=1M count=1024 |& grep 'copied' | awk '{print $8}'; sync) # & "SPINNER" "Write speed test "
				OPTI_1=$(hdparm -Tt $HDNUM_1 | grep buffered | awk '{print $11}') # & "SPINNER" "Read speed test "
			
			fi;
}


HD_STATUS_2 (){

    "FORMATING"
     
			if [[ -z "$HDNUM_2" ]]
			then
			
				HDNUM_2=$(echo "Not detected")
			
			else
				
				OPTR_2=$(smartctl -a $HDNUM_2 | grep "Reallocated_Sector_Ct" | awk '{print $10}')
				OPTT_2=$(smartctl -a $HDNUM_2 | grep "overall-health" | grep -c 'PASSED') 
				OPTS_2=$(smartctl -a $HDNUM_2 | grep "User Capacity:" | awk '{print $5, $6}' | tr -d [ | tr -d ])
				OPTN_2=$(smartctl -a $HDNUM_2 | grep "Serial Number:" | awk '{print $3}')
				OPTC_2=$(smartctl -a $HDNUM_2 | grep "Power On Hours:" | tr -d , | awk '{print $4/24}')
				OPTO_2=$(sync; dd if=$HDNUM_2 of=tempfile bs=1M count=1024 |& grep 'copied' | awk '{print $8}'; sync) # & "SPINNER" "Write speed test "
				OPTI_2=$(hdparm -Tt $HDNUM_2 | grep buffered | awk '{print $11}') # & "SPINNER" "Read speed test "
			
			fi;
}


HD_STATUS_3 (){

    "FORMATING"
     
			if [[ -z "$HDNUM_3" ]]
			then
			
				HDNUM_3=$(echo "Not detected")
			
			else
			
				OPTR_3=$(smartctl -a $HDNUM_3 | grep "Reallocated_Sector_Ct" | awk '{print $10}')
				OPTT_3=$(smartctl -a $HDNUM_3 | grep "overall-health" | grep -c 'PASSED')
				OPTS_3=$(smartctl -a $HDNUM_3 | grep "User Capacity:" | awk '{print $5, $6}' | tr -d [ | tr -d ])
				OPTN_3=$(smartctl -a $HDNUM_3 | grep "Serial Number:" | awk '{print $3}')
				OPTC_3=$(smartctl -a $HDNUM_3 | grep "Power On Hours:" | tr -d , | awk '{print $4/24}')
				OPTO_3=$(sync; dd if=$HDNUM_3 of=tempfile bs=1M count=1024 |& grep 'copied' | awk '{print $8}'; sync) # & "SPINNER" "Write speed test "
				OPTI_3=$(hdparm -Tt $HDNUM_3 | grep buffered | awk '{print $11}') # & "SPINNER" "Read speed test "

			fi;
}


NET_STATUS_1 (){

	"FORMATING"
	
			if [[ -z "$NETIF_1" ]]
			then
			
				NETIF_1=$(echo "Not detected")
			
			else

				ETHGW_1=$(route | grep "default" | awk '{print $2}')
				ETHIP_1=$(ifconfig $NETIF_1 | grep 'inet' | awk '{print $2}' | tr -d [:alpha:] | tr -d :)
				ETHNM_1=$(ifconfig $NETIF_1 | grep 'Mask' | awk '{print $4}' | tr -d [:alpha:] | tr -d :)
				ETHMA_1=$(ifconfig $NETIF_1 | grep 'HWaddr' | awk '{print $5}')
				ETHLD_1=$(ethtool $NETIF_1 | grep 'Link detected:' | awk '{print $3}')
				ETHSP_1=$(ifconfig $NETIF_1 | grep txqueuelen | awk '{print $2}' | tr -d [:alpha:] | tr -d :)
				ETHTR_1=$(sshpass -p 'XXXXXXXXXX' scp -v -o BindAddress=$ETHIP_1 /vigor/misc/Big_file.txt root@10.33.40.30:/vigor/misc/ 2>&1 | grep "Bytes per second:" | awk '{print $5}' | tr -d , | cut -d "." -f 1)

			fi;
}


NET_STATUS_2 (){

	"FORMATING"

			if [[ -z "$NETIF_2" ]]
			then
			
				NETIF_2=$(echo "Not detected")
			
			else
			
				ETHIP_2=$(ifconfig $NETIF_2 | grep 'inet' | awk '{print $2}' | tr -d [:alpha:] | tr -d :)
				ETHNM_2=$(ifconfig $NETIF_2 | grep 'Mask' | awk '{print $4}' | tr -d [:alpha:] | tr -d :)
				ETHMA_2=$(ifconfig $NETIF_2 | grep 'HWaddr' | awk '{print $5}')
				ETHLD_2=$(ethtool $NETIF_2 | grep 'Link detected:' | awk '{print $3}')
				ETHSP_2=$(ifconfig $NETIF_2 | grep txqueuelen | awk '{print $2}' | tr -d [:alpha:] | tr -d :)
				ETHTR_2=$(sshpass -p 'XXXXXXXXXX' scp -v -o BindAddress=$ETHIP_2 /vigor/misc/Big_file.txt root@10.33.40.30:/vigor/misc/ 2>&1 | grep "Bytes per second:" | awk '{print $5}' | tr -d , | cut -d "." -f 1)

			fi;
}

NET_STATUS_3 (){

	"FORMATING"
	
			if [[ -z "$NETIF_1" ]]
			then
			
				NETIF_1=$(echo "Not detected")
			
			else
			
				ETHIP_3=$(ifconfig $NETIF_3 | grep 'inet' | awk '{print $2}' | tr -d [:alpha:] | tr -d :)
				ETHNM_3=$(ifconfig $NETIF_3 | grep 'Mask' | awk '{print $4}' | tr -d [:alpha:] | tr -d :)
				ETHMA_3=$(ifconfig $NETIF_3 | grep 'HWaddr' | awk '{print $5}')
				ETHLD_3=$(ethtool $NETIF_3 | grep 'Link detected:' | awk '{print $3}')
				ETHSP_3=$(ifconfig $NETIF_3 | grep txqueuelen | awk '{print $2}' | tr -d [:alpha:] | tr -d :)
				ETHTR_3=$(sshpass -p 'XXXXXXXXXX' scp -v -o BindAddress=$ETHIP_3 /vigor/misc/Big_file.txt root@10.33.40.30:/vigor/misc/ 2>&1 | grep "Bytes per second:" | awk '{print $5}' | tr -d , | cut -d "." -f 1)

			fi; 
}


CPU_STATUS (){

    "FORMATING"
     
            CPUID=$(lscpu | grep "Model name:" | awk '{print $5}')
            CPUCC=$(lscpu | grep "Core(s) per socket:" | awk '{print $4}')
            CPUTM=$(sensors -f | grep "Core 0:" | awk '{print $3}' | tr -d +)
            CPUFR=$(lscpu | grep "CPU max MHz:" | awk '{print $4}')
            CPUCT=$(lscpu | sed -n '4p' | grep "CPU(s):" | awk '{print $2}')

}


RAM_STATUS () {

    "FORMATING"
            
            MEMIN=$(free | grep "Mem" | awk '{print $2}')
            MEMGB=$(free | grep "Mem" | awk '{print $2/1000000}')
			MEMTO=$( printf "%1.f\n" $MEMGB)
            MEMTS=$(dd if=/dev/urandom bs=$MEMIN of=/tmp/memtest count=1050 &> /dev/null) # & "SPINNER" "Checksum test "
            MEMOK_1=$(md5sum /tmp/memtest) # & "SPINNER" "Validating MD5 #1 "
            MEMOK_2=$(md5sum /tmp/memtest) # & "SPINNER" "Validating MD5 #2 "
            MEMOK_3=$(md5sum /tmp/memtest) # & "SPINNER" "Validating MD5 #3 " 
            MEMSP=$(dmidecode --type 17 | grep "Speed:" | awk '{print $4}' | tr -d "Unknown" | sed -n '4p')
            MEMTY=$(dmidecode --type 17 | grep "Type:" | awk '{print $2}' | sed -n '2p')
            MEMBK_1=$(dmidecode --type 17 | grep "Locator:" | awk '{print $4}' | sed -n '1p')
            MEMBK_2=$(dmidecode --type 17 | grep "Locator:" | awk '{print $4}' | sed -n '2p')
            MEMBK_3=$(dmidecode --type 17 | grep "Locator:" | awk '{print $4}' | sed -n '3p')
            MEMBK_4=$(dmidecode --type 17 | grep "Locator:" | awk '{print $4}' | sed -n '4p')
            
}


RAID_STATUS (){

    "FORMATING"
     
            RAID=$(cat /proc/mdstat | sed -n '2p' | grep -c 'none')
            RAIDT=$(cat /proc/mdstat | grep 'Personalities' | awk '{print $3}' | tr -d ] | tr -d [)
            RAIDV=$(cat /proc/mdstat | grep 'active raid*' | awk '{print $1}')
			RAIDL=$(mdadm --detail /dev/md127 | grep 'Raid Level' | awk '{print $4}' | grep raid* | sed -n '1p')
			RAIDN=$(mdadm --detail /dev/md127 | grep 'Raid Devices' | awk '{print $4}')
			RAIDD=$(cat /proc/mdstat | grep -c "active")
			RAIDP=$(cat /proc/mdstat | grep resync | awk '{print $4}')
			RAIDC=$(mdadm --detail /dev/md127 | grep "State :" | awk '{print $3 $4 $5}')
			RAIDS=$(cat /proc/mdstat | grep -c resync)
}


CHECK_NET_GLO () {

	"FORMATING"
	"NET_STATUS_GLOBAL"
	
		echo $LINS
		echo "NET CONFIG:                 "
		echo $LINS
		echo
		
		echo "DHCP:                  $GLODH"
		echo "DNS 1:                 $GLODO"
		echo "DNS 2:                 $GLODT"
		echo "NTP 1:                 $GLONO"
		echo "NTP 2:                 $GLONT"

}


CHECK_HW () {

	"FORMATING"
	"HW_DETECT"
	
		echo $LINS
		echo "HW SANITY:                   "
		echo $LINS
		echo
		
			if [ $DETMA = 0 ]
			then
			
				HWDMA=$(echo "Not Deteted")
			
			elif [ $DETMA = 1 ]
			then
			
				HWDMA=$(echo "Detected")
			
			fi
		
			if [ $DETSO = 0 ] && [ $DETST = 0 ]
			then
			
				HWDSA=$(echo "Not Deteted")
			
			elif [ $DETSO = 1 ]
			then
			
				HWDSA=$(echo "6985")
				
			elif [ $DETST = 1 ]
			then
			
				HWDSA=$(echo "6908")
			
			fi
		
			if [ $DETET = 0 ]
			then
			
				HWDET=$(echo "Not Deteted")
			
			elif [ $DETET = 2 ]
			then
			
				HWDET=$(echo "Detected")
			
			fi
			
		echo "Satelite:             $HWDSA"
		echo "Matrox:               $HWDMA"
		echo "Dual NIC:             $HWDET"
		echo "USB storage:          $DETUS"
		echo "Chipset:              $DETMB"

}


CHECK_VIGOR () {


	"FORMATING"
	"VIGOR_STATUS"
	
		echo $LINS
		echo "VIGOR STATUS:               "
		echo $LINS
		echo
	
		echo "OS:                   $VIGOS"
		echo "Serial:               $VIGSN"
		echo "OS Version:           $VIGSV"
		echo "OS Patch:             $VIGPV"
		echo "Call letters:         $VIGCL"
	
}


CHECK_SYSTEM () {

	"FORMATING"
	"SYSTEM_STATUS"


		echo $LINS
		echo "SYSTEM STATUS:                  "
		echo $LINS
		echo
	
		echo "Uptime:               $SYSUT"
		echo "User:                 $SYSUS"
		echo "Distro:               $SYSDI"
		echo "Kernel:               $SYSKV"
		echo "Imaged on:            $SYSSI" 
	
}


CHECK_HD_1 (){

    "FORMATING"
    "HD_STATUS_1"
	
			if [[ OPTT_1 = 1 ]]
			then
			
				OPTZ_1=$(echo "Passed")
			
			elif [[ OPTT_1 = 0 ]]
			then
			
				OPTZ_1=$(echo "Failed")
			
			fi
    
		echo $LINS
        echo "HD STATUS:            $HDNUM_1"
        echo $LINS
        echo
           
		echo "Realocated:           $OPTR_1"
        #echo "Error check:          $OPTZ_1"
        echo "Size:                 $OPTS_1"
        #echo "Written:              $OPTW_1"
        #echo "Read:                 $OPTR_1"
        echo "Serial #:             $OPTN_1"
        #echo "Up time:              ${OPTC_1%.*} Days"
        echo "Write speed:          $OPTO_1 MB/s"
        echo "Read speed:           $OPTI_1 MB/s"
    
}


CHECK_HD_2 (){

    "FORMATING"
    "HD_STATUS_2"
	
			if [[ OPTT_2 = 1 ]]
			then
			
				OPTZ_2=$(echo "Passed")
			
			elif [[ OPTT_2 = 0 ]]
			then
			
				OPTZ_2=$(echo "Failed")
			
			fi
    
		echo $LINS
        echo "HD STATUS:            $HDNUM_2"
        echo $LINS
        echo
           
		echo "Realocated:           $OPTR_2"
        #echo "Error check:          $OPTZ_2"
        echo "Size:                 $OPTS_2"
        #echo "Written:              $OPTW_2"
        #echo "Read:                 $OPTR_2"
        echo "Serial #:             $OPTN_2"
        #echo "Up time:              ${OPTC_2%.*} Days"
        echo "Write speed:          $OPTO_2 MB/s"
        echo "Read speed:           $OPTI_2 MB/s"
    
}


CHECK_HD_3 (){

    "FORMATING"
    "HD_STATUS_3"
	
			if [[ OPTT_3 = 1 ]]
			then
			
				OPTZ_3=$(echo "Passed")
			
			elif [[ OPTT_3 = 0 ]]
			then
			
				OPTZ_3=$(echo "Failed")
			
			fi
    
		echo $LINS
        echo "HD STATUS:            $HDNUM_3"
        echo $LINS
        echo 
        
		echo "Realocated:           $OPTR_3"
		#echo "Error check:          $OPTZ_3"
        echo "Size:                 $OPTS_3"
        #echo "Written:              $OPTW_3"
        #echo "Read:                 $OPTR_3"
        echo "Serial #:             $OPTN_3"
        #echo "Up time:              ${OPTC_3%.*} Days"
        echo "Write speed:          $OPTO_3 MB/s"
        echo "Read speed:           $OPTI_3 MB/s"
    
}



CHECK_NET_1 () {

    "FORMATING"
    "NET_STATUS_1"
    
        echo $LINS
        echo "NET STATUS:           $NETIF_1"
        echo $LINS
        echo
		
        echo "IP:                   $ETHIP_1"
        echo "Netmask:              $ETHNM_1"
		echo "Gateway:              $ETHGW_1"
        echo "MAC:                  $ETHMA_1"
        #echo "Link detect:          $ETHLD_1"
        echo "Speed:                $(( ETHTR_1 / 125000 )) MB/s"

}


CHECK_NET_2 () {

    "FORMATING"
    "NET_STATUS_2"
    
        echo $LINS
        echo "NET STATUS:           $NETIF_2"
        echo $LINS
        echo
		
        echo "IP:                   $ETHIP_2"
        echo "Netmask:              $ETHNM_2"
        echo "MAC:                  $ETHMA_2"
        echo "Link detect:          $ETHLD_2"
        echo "Speed:                $(( ETHTR_2 / 125000 )) MB/s"

}


CHECK_NET_3 () {

    "FORMATING"
    "NET_STATUS_3"
	
        echo $LINS
        echo "NET STATUS:           $NETIF_3"
        echo $LINS
        echo
		
        echo "IP:                   $ETHIP_3"
        echo "Netmask:              $ETHNM_3"
        echo "MAC:                  $ETHMA_3"
        echo "Link detect:          $ETHLD_3"
        echo "Speed:                $(( ETHTR_3 / 125000 )) MB/s"

}


CHECK_CPU (){

    "FORMATING"
    "CPU_STATUS"
    
        echo $LINS
        echo "CPU STATUS:                 "
        echo $LINS
		echo
		
        echo "Model:                $CPUID"
        echo "Temp:                 $CPUTM"
        echo "Physical:             $CPUCC Cores"
        echo "Hyper:                $CPUCT Threads"
        echo "Max freq:             ${CPUFR%.*} MHz"

}

CHECK_RAID (){
    
    "FORMATING"
    "RAID_STATUS"

        echo $LINS
        echo "RAID STATUS:                "
        echo $LINS
		echo
	
			if [ $RAIDS = 0 ]
			then
			
			echo "Synced:               Yes"
		
			elif [ $RAIDS = 1 ]
			then
		
			echo "Synced                No $RAIDP %"
		
			fi
        
        echo "Devices:              $RAIDD"
		echo "Drives:               $RAIDN"
		echo "State:                $RAIDC"
		echo "Level:                $RAIDL"
		
}


CHECK_RAM () {

    "FORMATING"
		
		echo $LINS
        echo "RAM STATUS:           "
        echo $LINS
		echo

    "RAM_STATUS"
    
			if [[ $MEMOK_1 != $MEMOK_2 ]] & [[ $MEMOK_1 != $MEMOK_3 ]]
			then
    
			echo "MD5 Check:            ${RED}FAILED${NONE}"
        
			elif [[ $MEMOK_1 = $MEMOK_2 ]] && [[ $MEMOK_1 = $MEMOK_3 ]]
			then
    
			echo "MD5 Check:            PASSED"
            
			fi
	
			if [[ $MEMTY = "<OUT" ]]
			then
	
				MEMTY=$(echo "DDR4")
	
			fi
		
        echo "RAM type:             $MEMTY"
        echo "RAM total:            $MEMTO GB"
        echo "RAM speed:            $MEMSP MHs"
        echo "DIM's used:           $MEMBK_1 $MEMBK_2 $MEMBK_3 $MEMBK_4"
        #echo $LINS
}


        clear
	
EXECUTE () {

echo "text 15,15 \""
echo
CHECK_ROOT
AUTO_DEP > /dev/null
AUTO_HD
AUTO_NIC
BIG_FILE
paste <("CHECK_VIGOR") <("CHECK_SYSTEM") <("CHECK_RAID") | column -s $'\t' -t
paste <("CHECK_HW") <("CHECK_NET_GLO") <("CHECK_CPU") | column -s $'\t' -t
paste <("CHECK_NET_1") <("CHECK_NET_2") <("CHECK_NET_3") | column -s $'\t' -t
paste <("CHECK_HD_1") <("CHECK_HD_2") <("CHECK_HD_3") | column -s $'\t' -t
paste <(echo $LINS) <(echo $LINS) <(echo $LINS) | column -s $'\t' -t
#paste <("CHECK_CPU") <("CHECK_RAM") | column -s $'\t' -t
#USER_HD
#USER_NIC
#CHECK_DEP
#CHECK_NET_1
#CHECK_NET_2
#CHECK_NET_3
#CHECK_HD_1
#CHECK_HD_2
#CHECK_HD_3
#CHECK_CPU
#CHECK_RAID 
#CHECK_RAM
echo
echo "\""

}  

	"EXECUTE"
