process INDEX_GVCF {

    tag "$sample_id"

    publishDir "results/variants", mode: "copy"

    input:
    tuple val(sample_id), path(gvcf)

    output:
    tuple val(sample_id),
          path(gvcf),
          path("${gvcf.getName()}.tbi")

    script:
    """
    gatk IndexFeatureFile \
        -I ${gvcf}
    """
}