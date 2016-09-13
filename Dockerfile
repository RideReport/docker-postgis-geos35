FROM mdillon/postgis:9.5

RUN apt-get update \
  && apt-get install -y build-essential

RUN apt-get install -y wget

RUN cd tmp \
  && wget http://download.osgeo.org/geos/geos-3.5.0.tar.bz2 \
  && tar xfj geos-3.5.0.tar.bz2 \
  && cd geos-3.5.0 \
  && ./configure \
  && make \
  && make install

RUN apt-get purge -y --auto-remove build-essential
