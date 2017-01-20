#!/bin/bash

#PBS -S /bin/bash
#PBS -N caffe_noisy
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=6
#PBS -q gpuk40q
#PBS -m abe -M maha.elbayad@student.ecp.fr

module purge
module load hdf5/1.8.12
module load boost/1.57.0
module load intel-compiler/15.0.1
module load intel-mkl/11.2.1
module load gcc/4.8.5

export LD_LIBRARY_PATH=/home/elbayadm/opt/opencv/3.0.0-gcc-4.8/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/elbayadm/opt/lmdb/0.9.16-gcc-4.8/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/elbayadm/opt/protobuf/2.6.1-gcc-4.8/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda-6.0/lib64:$LD_LIBRARY_PATH

# On se place dans le repertoire depuis lequel le job a ete soumis
cd $PBS_O_WORKDIR

caffe_bin=/home/elbayadm/opt/caffe_modified/tools/caffe.bin

$caffe_bin train --solver=solver.prototxt 
