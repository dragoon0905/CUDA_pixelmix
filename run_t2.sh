#!/bin/bash

#SBATCH --job-name=pixmatch_t2_ours_pixel
#SBATCH --gres=gpu:1
#SBATCH -o ./train_out/t2_wobest/t2_wobest_95.out
#SBATCH -w agi1
#SBATCH -p batch
#SBATCH --cpus-per-task=1
#SBATCH --time=14-0

source /data/seunan/init.sh
conda activate torch38gpu


HYDRA_FULL_ERROR=1 python main_pixelmix_t2_wobest.py --config-name=gta52idd pseudobest_threshold=0.5 name=gta52idd_wobest > ./train_log/t2_wobest/t22_wobest.log
HYDRA_FULL_ERROR=1 python main_pixelmix_t2_wobest_mix.py --config-name=gta52idd pseudobest_threshold=0.5 name=gta52idd_wobest_mix > ./train_log/t2_wobest/t2_wobest_mix.log
