# busco
 busco -i "$f" \
        -l /busco_datasets/busco_downloads/lineages/metazoa_odb10/ \
        -o "${base}_busco" \
        --out_path "$RESULTS_DIR" \
        -m proteins \
        --cpu 8 \
        --offline

# plot
generate_plot.py -wd $WORKING_DIR
