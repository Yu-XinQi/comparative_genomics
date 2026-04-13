#!/bin/bash
#SBATCH --job-name=busco_pro
#SBATCH --partition=k2-medpri
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --output=busco_%j.out
#SBATCH --error=busco_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yqi08@qub.ac.uk

# 激活 BUSCO 环境
source ~/miniconda3/bin/activate ~/conda_envs/busco_env

# 输入蛋白质目录
PROT_DIR=~/protein
RESULTS_DIR=~/busco/results_pro

for f in ~/protein/*.{fa,faa}; do
  # 检查文件是否存在
  [ -e "$f" ] || continue

  base=$(basename "$f")
  base="${base%.*}"  # 去掉后缀
  busco -i "$f" \
        -l /users/40483456/busco_datasets/busco_downloads/lineages/metazoa_odb10/ \
        -o "${base}_busco" \
        --out_path "$RESULTS_DIR" \
        -m proteins \
        --cpu 8 \
        --offline
        
done