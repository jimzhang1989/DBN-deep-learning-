#!/bin/bash

#export LD_LIBRARY_PATH=/home/wei/deepnet/cudamat
#export PYTHONPATH=$PYTHONPATH:/home/spark/python/
export PATH=$PATH:/home/wei/deepnet/deepnet

#echo $PYTHONPATH
train='python /home/wei/deepnet/deepnet/trainer.py'
write='python /home/wei/deepnet/deepnet/write_model_to_mat.py'



echo "start train layer1..."
$train  /home/wei/Language/model/mnist_rbm1.pbtxt /home/wei/Language/model/train.pbtxt /home/wei/Language/model/eval.pbtxt ||exit
echo "start write layer1 to mat file"
$write '/home/wei/Language/Results/hcp_rbm_layer1_LAST' '/home/wei/Language/Results/weight1' ||exit

echo "start train layer2..."
$train  /home/wei/Language/model/mnist_rbm2.pbtxt /home/wei/Language/model/train.pbtxt /home/wei/Language/model/eval.pbtxt ||exit
echo "start write layer2 to mat file"
$write '/home/wei/Language/Results/hcp_rbm_layer2_rbm_LAST' '/home/wei/Language/Results/weight2' ||exit

echo "start train layer3..."
$train  /home/wei/Language/model/mnist_rbm3.pbtxt /home/wei/Language/model/train.pbtxt /home/wei/Language/model/eval.pbtxt ||exit
echo "start write layer3 to mat file"
$write '/home/wei/Language/Results/hcp_rbm_layer3_rbm_LAST' '/home/wei/Language/Results/weight3' ||exit
