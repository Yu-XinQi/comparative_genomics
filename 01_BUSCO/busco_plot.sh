#!/bin/bash
#SBATCH --job-name=busco_plot
#SBATCH --partition=k2-medpri
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --output=busco_plot_%j.out
#SBATCH --error=busco_plot_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yqi08@qub.ac.uk

# 激活
source /opt/gridware/depots/54e7fb3c/el8/pkg/apps/anaconda3/2024.10/bin/etc/profile.d/conda.sh
# 环境
conda activate /users/40483456/sharedscratch/.conda/envs/busco

# 输入蛋白质目录
PROT_DIR=/users/40483456/busco/busco_plot/

cd $WORKING_DIR

# -wd 指定包含 summary 文件的文件夹路径
generate_plot.py -wd $WORKING_DIR
