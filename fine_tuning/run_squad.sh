#!/bin/bash
PYTORCH_BERT_GITHUB_REPO_NAME=pytorch-pretrained-BERT

if [[ -d ${PYTORCH_BERT_GITHUB_REPO_NAME} ]]
then
	echo "torch bert already exists"
else
	git clone https://github.com/huggingface/${PYTORCH_BERT_GITHUB_REPO_NAME}
fi

cp pytorch-pretrained-BERT/examples/run_squad.py .

set -x

KORQUAD_TRAIN_URL=https://korquad.github.io/dataset/KorQuAD_v1.0_train.json
KORQUAD_DEV_URL=https://korquad.github.io/dataset/KorQuAD_v1.0_dev.json
DATA_DIR=data

mkdir -p ${DATA_DIR}
wget ${KORQUAD_TRAIN_URL} --directory-prefix=${DATA_DIR}
wget ${KORQUAD_DEV_URL} --directory-prefix=${DATA_DIR}

python run_squad.py \
		   --bert_model bert-base-multilingual-uncased \
		   --output_dir model/test \
		   --train_file data/KorQuAD_v1.0_train.json \
		   --predict_file data/KorQuAD_v1.0_dev.json \
		   --do_train
