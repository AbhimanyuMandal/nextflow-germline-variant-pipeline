process ADD_READ_GROUPS {

    tag "$sample_id"

    publishDir "results/alignment", mode: "copy"

    input:
    tuple val(sample_id), path(bam), path(bai)
    output:
    tuple val(sample_id), path("${sample_id}.rg.bam")

    script:
    """
    gatk AddOrReplaceReadGroups \
        -I ${bam} \
        -O ${sample_id}.rg.bam \
        -RGID 1 \
        -RGLB lib1 \
        -RGPL ILLUMINA \
        -RGPU unit1 \
        -RGSM ${sample_id}
    """
}