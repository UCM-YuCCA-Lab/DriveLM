# The following script assumes that you prepare the output.json and test_eval.json under ./challenge
# make sure you are under ./challenge

if [ "$1" == "lora-bias" ]; then
    python3 evaluation.py --root_path1 ./output_lora_bias/output_lora_bias.json --root_path2 ./test_eval.json
elif [ "$1" == "bias" ]; then
    # Bias model gives the best results
    python3 evaluation.py --root_path1 ./output_bias/output_bias.json --root_path2 ./test_eval.json
elif [ "$1" == "caption" ]; then
    python3 evaluation.py --root_path1 ./output_caption/output_caption.json --root_path2 ./test_eval.json
else
    echo "Please specify the output type: lora-bias, bias, caption"
    exit 1
fi
