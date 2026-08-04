process HAPLOTYPECALLER {

    tag "$sample_id"

    publishDir "results/variants", mode: "copy"

    input:
    tuple val(sample_id), path(bam), path(bai)
    path reference
    path reference_files

    output:
    tuple val(sample_id), path("${sample_id}.g.vcf.gz")

    script:
    """
    gatk HaplotypeCaller \
        -R ${reference} \
        -I ${bam} \
        -O ${sample_id}.g.vcf.gz \
        -ERC GVCF
    """
}