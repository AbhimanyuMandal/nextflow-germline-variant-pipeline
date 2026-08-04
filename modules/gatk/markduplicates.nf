process MARKDUPLICATES {

    tag "$sample_id"

    publishDir "results/alignment", mode: "copy"

    input:
tuple val(sample_id), path(bam), path(bai)

    output:
tuple val(sample_id), path("${sample_id}.dedup.bam")

    script:
    """
    gatk MarkDuplicatesSpark \
        -I ${bam} \
        -O ${sample_id}.dedup.bam
    """
}