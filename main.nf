nextflow.enable.dsl = 2

include { BWA_MEM } from './modules/alignment/bwa'
include { READCOUNT } from './modules/qc/readcount'
include { SAMTOOLS_SORT } from './modules/alignment/samtools_sort'
include { SAMTOOLS_INDEX as INDEX_SORTED } from './modules/alignment/samtools_index'
include { SAMTOOLS_INDEX as INDEX_RG } from './modules/alignment/samtools_index'
include { SAMTOOLS_INDEX as INDEX_DEDUP } from './modules/alignment/samtools_index'
include { ADD_READ_GROUPS } from './modules/gatk/addreadgroups'
include { MARKDUPLICATES } from './modules/gatk/markduplicates'
include { HAPLOTYPECALLER } from './modules/gatk/haplotypecaller'
include { INDEX_GVCF } from './modules/gatk/index_gvcf'
include { VARIANT_FILTRATION } from './modules/gatk/variantfiltration'
include { VEP } from './modules/gatk/vep'

workflow {

    reads_ch = channel
        .fromPath(params.reads)
        .map { file ->
            tuple(file.baseName.replace(".fastq",""), file)
        }

    reference_ch = channel.value(file(params.reference))

    reference_index_ch = channel
    .fromPath("${params.reference}.*")
    .collect()

    reference_bundle_ch = channel
    .fromPath([
        "reference/*.dict",
        "reference/*.fai",
        "reference/*.amb",
        "reference/*.ann",
        "reference/*.bwt",
        "reference/*.pac",
        "reference/*.sa"
    ])
    .flatten()
    .collect()

    // Alignment
    sam_ch = BWA_MEM(
    reads_ch,
    reference_ch,
    reference_index_ch
)
    // Sort BAM
    sorted_bam_ch = SAMTOOLS_SORT(sam_ch)

    // Index Sorted BAM
    indexed_bam_ch = INDEX_SORTED(sorted_bam_ch)

    // Add Read Groups
    rg_bam_ch = ADD_READ_GROUPS(indexed_bam_ch)

    // Index Deduplicated BAM
     rg_index_ch = INDEX_RG(rg_bam_ch)


    // Mark PCR Duplicates
    dedup_bam_ch = MARKDUPLICATES(rg_index_ch)

    
    dedup_index_ch = INDEX_DEDUP(dedup_bam_ch)



    // Variant Calling    
     variant_ch = HAPLOTYPECALLER(
    dedup_index_ch,
    reference_ch,
    reference_bundle_ch
    )

     indexed_variant_ch = INDEX_GVCF(variant_ch)

    
    // Variant Filtering
    filtered_variant_ch = VARIANT_FILTRATION(indexed_variant_ch)

    // Functional Annotation
    annotated_variant_ch = VEP(filtered_variant_ch)

    // QC
    readcount_ch = READCOUNT(reads_ch)

    // Debugging: View the channels

    readcount_ch.view()
    sam_ch.view()
    sorted_bam_ch.view()
    indexed_bam_ch.view()
    rg_bam_ch.view()
    dedup_bam_ch.view()
    dedup_bam_ch.view()
    variant_ch.view()
    filtered_variant_ch.view()
    annotated_variant_ch.view()

}