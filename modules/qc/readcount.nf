process READCOUNT {

    tag "$sample_id"

    publishDir "results/readcount", mode: "copy"

    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path("${sample_id}.readcount.txt")

    script:
"""
lines=\$(zcat ${reads} | wc -l)
reads=\$((lines / 4))

echo "Sample ID : ${sample_id}" > ${sample_id}.readcount.txt
echo "FASTQ File: ${reads}" >> ${sample_id}.readcount.txt
echo "Total Reads: \$reads" >> ${sample_id}.readcount.txt
"""
}