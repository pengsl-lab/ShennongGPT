PRE_SEQ_LEN=256
LR=2e-3

#
CUDA_VISIBLE_DEVICES=0 python3 main.py \
    --do_train \
    --train_file /data/train.json \
    --validation_file /data/dev.json \
    --prompt_column content \
    --response_column summary \
    --overwrite_cache \
    --model_name_or_path your lcoal chatglm-6b path  \
    --output_dir output/adgen-chatglm-6b-med-pt-$PRE_SEQ_LEN-$LR \
    --overwrite_output_dir \
    --max_source_length 256 \
    --max_target_length 256 \
    --per_device_train_batch_size 40 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 16 \
    --predict_with_generate \
    --max_steps 100 \
    --logging_steps 10 \
    --save_steps 20 \
    --learning_rate $LR \
    --pre_seq_len $PRE_SEQ_LEN
    # --quantization_bit 4

