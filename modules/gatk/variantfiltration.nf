process VARIANT_FILTRATION {

    tag "$sample_id"

    publishDir "results/variants", mode: "copy"

    input:
tuple val(sample_id),
      path(vcf),
      path(tbi)

    output:
    tuple val(sample_id), path("${sample_id}.filtered.vcf.gz")

    script:
    """
    gatk VariantFiltration \
        -V ${vcf} \
        -O ${sample_id}.filtered.vcf.gz \
        --filter-expression "QD < 2.0" \
        --filter-name "LowQD"
    """
}