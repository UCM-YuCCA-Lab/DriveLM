# The following script assumes that you prepare the output.json and test_eval.json under ./challenge
# make sure you are under ./challenge

#python3 evaluation.py --root_path1 ./output_lora_bias/output_lora_bias.json --root_path2 ./test_eval.json

# Bias model gives the best results
python3 evaluation.py --root_path1 ./output_bias/output_bias.json --root_path2 ./test_eval.json

#python3 evaluation.py --root_path1 ./output_caption/output_caption.json --root_path2 ./test_eval.json
