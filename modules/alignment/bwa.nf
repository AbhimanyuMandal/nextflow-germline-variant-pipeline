process BWA_MEM {

    tag "$sample_id"

    publishDir "results/alignment", mode: "copy"

    input:
    tuple val(sample_id), path(reads)

    path reference
    path reference_index

    output:
    tuple val(sample_id), path("${sample_id}.sam")

    script:
    """
    bwa mem \
        ${reference} \
        ${reads} \
        > ${sample_id}.sam
    """
}