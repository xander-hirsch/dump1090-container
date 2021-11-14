#!/bin/bash
docker run --rm \
    --env-file ~/.gps-coordinates.list \
    --device=/dev/bus/usb/001/005 \
    --publish 127.0.0.1:30002:30002/tcp \
    --publish 127.0.0.1:30005:30005/tcp \
    dump1090 \
    dump1090-fa --quiet --net --lat $ADSB_LATITUDE --lon $ADSB_LONGITUDE
