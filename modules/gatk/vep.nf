process VEP {

    tag "$sample_id"

    publishDir "results/annotation", mode: "copy"

    input:
    tuple val(sample_id), path(vcf)

    output:
    tuple val(sample_id), path("${sample_id}.annotated.vcf")

    script:
    """
    cp ${vcf} ${sample_id}.annotated.vcf
    """
}