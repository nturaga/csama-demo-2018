## Inherit from the bioconductor/release_base2 image
FROM bioconductor/bioconductor_full:devel

#Build netcdf
RUN wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.3.3.1.tar.gz
RUN tar xzvf netcdf-4.3.3.1.tar.gz
RUN cd netcdf-4.3.3.1; \
    patch -p1 < largefiles.patch; \
    ./configure --prefix=/usr/local/netcdf \ 
                CC=mpicc \
                LDFLAGS=-L/usr/local/hdf5/lib \
                CFLAGS=-I/usr/local/hdf5/include; \
    make; \
    make install;\
    cd ..;\
    rm -rf netcdf-4.3.3.1 netcdf-4.3.3.1.tar.gz
