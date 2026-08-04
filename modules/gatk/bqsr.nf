process BASE_RECALIBRATOR {

    tag "$sample_id"

    publishDir "results/recalibration", mode: "copy"

    input:
    tuple val(sample_id), path(dedup_bam)
    path bam_index
    path reference
    path known_sites

    output:
    tuple val(sample_id), path("${sample_id}.recal.table")

    script:
    """
    gatk BaseRecalibrator \
        -R ${reference} \
        -I ${dedup_bam} \
        --known-sites ${known_sites} \
        -O ${sample_id}.recal.table
    """
}