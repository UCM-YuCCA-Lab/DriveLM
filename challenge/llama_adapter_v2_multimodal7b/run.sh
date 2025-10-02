#!/bin/bash
num_gpus=1
llama_dir="/data/shared/llama2-7b-weights"

if [ "$1" == "lora-bias" ]; then
    checkpoint="/data/shared/llama-adapter-multimodal-7b-pretrained-ckpts/1bcbffc43484332672092e0024a8699a6eb5f558161aebf98a7c6b1db67224d1_LORA-BIAS-7B.pth"
    output_dir="../output_lora_bias"
    output="$output_dir"/output_lora_bias.json
elif [ "$1" == "bias" ]; then
    checkpoint="/data/shared/llama-adapter-multimodal-7b-pretrained-ckpts/7fa55208379faf2dd862565284101b0e4a2a72114d6490a95e432cf9d9b6c813_BIAS-7B.pth"
    output_dir="../output_bias"
    output="$output_dir"/output_bias.json
elif [ "$1" == "caption" ]; then
    checkpoint="/data/shared/llama-adapter-multimodal-7b-pretrained-ckpts/5088aeb63a89746b90bcfd5cb819e1c7411b2771b267c6d131ce73e250a8abf0_CAPTION-7B.pth"
    output_dir="../output_caption"
    output="$output_dir"/output_caption.json
else
    echo "Please specify the checkpoint type: lora-bias, bias, caption"
    exit 1
fi

# /path/to/llama_model_weights, /path/to/pre-trained/checkpoint.pth and /output/path need to be modified by your path
# make sure you are under ./challenge/llama_adapter_v2_multimodal7b
./exps/finetune.sh \
$llama_dir $checkpoint \
finetune_data_config.yaml $output_dir

# /path/to/llama_model_weights and /path/to/pre-trained/checkpoint.pth need to be modified by your path
# num_processes is the number of the gpu you will use to infer the data.
# make sure you are under ./challenge/llama_adapter_v2_multimodal7b
#python demo.py --llama_dir $llama_dir --checkpoint $checkpoint --data ../test_llama.json  --output $output --batch_size 4 --num_processes $num_gpus
