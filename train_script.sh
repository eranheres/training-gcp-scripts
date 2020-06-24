cd adaptive-style-transfer
python main.py \
                 --model_name=model_van-gogh_new \
                 --batch_size=1 \
                 --phase=train \
                 --image_size=768 \
                 --lr=0.0002 \
                 --dsr=0.8 \
                 --ptcd=./data/sdb/data_large \
                 --ptad=./data/sdb/vincent-van-gogh_road-with-cypresses-1890