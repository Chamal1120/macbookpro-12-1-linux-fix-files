#!/bin/bash
# shellcheck.net: 4 warnings

logger -p info "$0 executed."

if [ "$#" -eq 2 ];then
    
    removevendorid=$1
    removeproductid=$2
    
    usbpath="/sys/bus/usb/devices/"
    devicerootdirs=`ls -1 $usbpath`
    
    for devicedir in $devicerootdirs; do
	
        if [ -f "$usbpath$devicedir/product" ]; then
            product=`cat "$usbpath$devicedir/product"`
            productid=`cat "$usbpath$devicedir/idProduct"`
            vendorid=`cat "$usbpath$devicedir/idVendor"`
            if [ "$removevendorid" == "$vendorid" ] && [ "$removeproductid" == "$productid" ];    then
                if [ -f "$usbpath$devicedir/remove" ]; then
                    logger -p info "$0 removing $product ($vendorid:$productid)"
           	    echo 1 > "$usbpath$devicedir/remove"
                    exit 0
   		else
                    logger -p info "$0 already removed $product ($vendorid:$productid)"
                    exit 0
   		fi
            fi
        fi
	
	
    done
    
else
    logger -p err "$0 needs 2 args vendorid and productid"
    exit 1
fi
