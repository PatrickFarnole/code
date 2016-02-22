#!/bin/sh

# if not set use the suggested source code installation directories
GOTM_BASE=${GOTM_BASE:=~/GOTM/code}
FABM_BASE=${FABM_BASE:=~/FABM/code}

# default Fortran compiler is gfortran - overide by setting compuiler like:
# export compiler=ifort
compiler=${compiler:=gfortran}

# NetCDF
# nf-config must be in the path and correpsond to the value of compiler
# try:
# nf-config --all

# ready to configure
mkdir -p $compiler
cd $compiler
cmake $GOTM_BASE/src \
      -DGOTM_USE_FLEXIBLE_OUTPUT=on \
      -DGOTM_USE_FABM=on \
      -DFABM_BASE=$FABM_BASE/ \
      -DCMAKE_Fortran_COMPILER=$compiler \
      -DCMAKE_INSTALL_PREFIX=~/local/gotm/$compiler
cd ..