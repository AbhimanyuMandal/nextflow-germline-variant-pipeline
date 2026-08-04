process SAMTOOLS_INDEX {

    tag "$sample_id"

    publishDir "results/alignment", mode: "copy"

    input:
tuple val(sample_id), path(bam)

output:
tuple val(sample_id),
      path(bam),
      path("${bam}.bai")
    script:
    """
    samtools index ${bam}
    """
}