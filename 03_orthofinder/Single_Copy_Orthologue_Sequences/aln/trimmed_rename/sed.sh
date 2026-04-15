for f in *.trim.fa; do
    sed -i '' \
        -e 's/^>FGIG_.*/>f_gigantica/' \
        -e 's/^>FhHiC23_.*/>f_hepatica/' \
        -e 's/^>T265_.*/>opisthorchis_viverrini/' \
        -e 's/^>KAK.*/>s_mekongi/' \
        -e 's/^>SBOV2_.*/>s_bovis/' \
        -e 's/^>SCUR1_.*/>s_curassoni/' \
        -e 's/^>SGUI1_.*/>s_guineensis/' \
        -e 's/^>SHAE2_.*/>s_haematobium/' \
        -e 's/^>SINT1_.*/>s_intercalatum/' \
        -e 's/^>EWB00_.*/>s_japonicum/' \
        -e 's/^>Smp_.*/>s_mansoni/' \
        -e 's/^>SMRG1_.*/>s_magrebowie/' \
        -e 's/^>SMTH1_.*/>s_mattheei/' \
        -e 's/^>SRDH2_.*/>s_rodhaini/' \
        -e 's/^>SSPN1_.*/>s_spindale/' \
        -e 's/^>STRK1_.*/>s_turkestanicum/' \
        -e 's/^>h1SMcT.*/>schmidtea_mediterranea/' \
        -e 's/^>TREG1_.*/>trichobilharzia_regenti/' \
        "$f"
done
