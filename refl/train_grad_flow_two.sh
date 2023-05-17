export MODEL_NAME=""
export dataset_path=""
export pre_path=""
export valid_path=""

accelerate launch --multi_gpu --mixed_precision=fp16 --num_processes=8  train_text_to_image.py \
  --pretrained_model_name_or_path=$MODEL_NAME \
  --train_data_dir=$dataset_path \
  --pre_data_dir=$pre_path \
  --valid_data_dir=$valid_path \
  --use_ema \
  --resolution=512 --center_crop --random_flip \
  --train_batch_size=2 \
  --grad_batch_size=2 \
  --gradient_accumulation_steps=4 \
  --gradient_checkpointing \
  --max_train_steps=1000 \
  --learning_rate=1e-05 \
  --max_grad_norm=1 \
  --lr_scheduler="constant" --lr_warmup_steps=0 \
  --output_dir="" \
  --run_test_dir="" \
  --webdataset True \
  --caption_column "txt" \
  --grad_mix True \
  --checkpointing_steps 50 \
  --steps_per_valid 5 \
  --grad_scale 0.01 \