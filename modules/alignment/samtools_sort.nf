process SAMTOOLS_SORT {

    tag "$sample_id"

    publishDir "results/alignment", mode: "copy"

    input:
     tuple val(sample_id), path(sam)

    output:
     tuple val(sample_id), path("${sample_id}.sorted.bam")
    script:
    """
    samtools sort \
    -o ${sample_id}.sorted.bam \
    ${sam}
    """
}