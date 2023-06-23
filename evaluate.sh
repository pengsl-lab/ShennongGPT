PRE_SEQ_LEN=128
CHECKPOINT=adgen-chatglm-6b-pt-128-2e-2
STEP=500

CUDA_VISIBLE_DEVICES=0 python3 main.py \
    --do_predict \
    --validation_file dev.json \
    --test_file dev.json \
    --overwrite_cache \
    --prompt_column content \
    --response_column summary \
    --model_name_or_path your lcoal chatglm-6b path  \
    --ptuning_checkpoint ./output/$CHECKPOINT/checkpoint-$STEP \
    --output_dir ./output/$CHECKPOINT \
    --overwrite_output_dir \
    --max_source_length 64 \
    --max_target_length 64 \
    --per_device_eval_batch_size 1 \
    --predict_with_generate \
    --pre_seq_len $PRE_SEQ_LEN
    # --quantization_bit 4
