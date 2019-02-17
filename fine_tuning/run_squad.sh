#!/bin/bash
PYTORCH_BERT_GITHUB_REPO_NAME=pytorch-pretrained-BERT

if [[ -d ${PYTORCH_BERT_GITHUB_REPO_NAME} ]]
then
	echo "torch bert already exists"
else
	git clone https://github.com/huggingface/${PYTORCH_BERT_GITHUB_REPO_NAME}
fi

cp pytorch-pretrained-BERT/examples/run_squad.py .

KORQUAD_TRAIN_URL=https://korquad.github.io/dataset/KorQuAD_v1.0_train.json
KORQUAD_TRAIN_URL=https://korquad.github.io/dataset/KorQuAD_v1.0_dev.json
mkdir -p data
wget KORQUAD_TRAIN_URL > data/KorQuAD_v1.0_train.json 
wget KORQUAD_TRAIN_URL > data/KorQuAD_v1.0_dev.json 

python run_squad.py \
		   --bert_model bert-base-multilingual-uncased \
		   --output_dir model/test \
		   --train_file KorQuAD_v1.0_train.json \
		   --predict_file KorQuAD_v1.0_dev.json \
		   --do_train
