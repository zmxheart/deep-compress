#! /bin/bash
#$ -S /bin/bash
#$ -q gpu.q
#$ -cwd
#$ -N myjob
#$ -j y
#$ -o compress_lenet_5.qlog
#$ -l mem_free=64G
#$ -pe smp 20
#$ -V
export CUDA_HOME=/usr/local/cuda:/usr/local/cuda-8.0:/home/jrafatiheravi/src/cuda
export PATH=${CUDA_HOME}/bin:${PATH}
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH

module load anaconda3
source activate jacobenv
python LeNet_5.py 2
python LeNet_5.py 4
python LeNet_5.py 8
python LeNet_5.py 16
python LeNet_5.py 32
python LeNet_5.py 64
