<p align="center">
  <img src="assets/banner.png" width="100%">
</p>

<h1 align="center">Nextflow DSL2 Germline Variant Calling Pipeline</h1>

<p align="center">
A modular, reproducible Germline Variant Calling Pipeline built using Nextflow DSL2 for processing next-generation sequencing (NGS) data.
</p>

<p align="center">

<img src="https://img.shields.io/badge/Nextflow-DSL2-23aa62?logo=nextflow"/>
<img src="[https://img.shields.io/badge/GATK-4.6-blue"/>
<img src="https://img.shields.io/badge/SAMtools-1.22-orange"/>
<img src="https://img.shields.io/badge/VEP-Ensembl-red"/>
<img src="https://img.shields.io/github/license/AbhimanyuMandal/nextflow-germline-variant-pipeline"/>
</p>

---

## Project Overview

This pipeline follows GATK Best Practices for germline variant discovery and demonstrates how modular Nextflow DSL2 workflows can be used to build reproducible bioinformatics pipelines.

It includes:

- Sequence Alignment
- BAM Sorting & Indexing
- Read Group Addition
- PCR Duplicate Marking
- Germline Variant Calling
- Variant Filtration
- Functional Annotation

---

## Workflow Overview

The pipeline implements a modular Nextflow DSL2 workflow for germline variant discovery following GATK Best Practices.

<p align="center">
  <img src="assets/workflow.png" width="100%">
</p>

---

## Features

- Modular Nextflow DSL2 workflow
- Read alignment using **BWA-MEM**
- BAM sorting and indexing with **SAMtools**
- Read group assignment using **GATK AddOrReplaceReadGroups**
- PCR duplicate marking using **MarkDuplicates**
- Germline variant calling using **GATK HaplotypeCaller**
- Variant filtration using **GATK VariantFiltration**
- Functional annotation using **Ensembl VEP**
- Reproducible and scalable workflow execution
- Easily extensible modular architecture

---

## Pipeline Execution

The workflow is executed using Nextflow DSL2. Each module runs independently, enabling scalable, reproducible, and resumable execution.

<p align="center">
  <img src="assets/pipeline_execution.png" width="900">
</p>

---

## Output Directory

The pipeline automatically organizes results into separate directories for alignment, quality control, variant calling, and annotation.

<p align="center">
  <img src="assets/output_directory.png" width="450">
</p>

---

## Repository Structure

```text
nextflow-germline-variant-pipeline/

├── modules/
│   ├── alignment/
│   ├── gatk/
│   ├── qc/
│   └── annotation/
│
├── reference/
│
├── test_data/
│
├── results/
│
├── main.nf
├── nextflow.config
├── README.md
└── LICENSE
```

---



## Installation

### Clone the repository

```bash
git clone https://github.com/AbhimanyuMandal/nextflow-germline-variant-pipeline.git

cd nextflow-germline-variant-pipeline
```

### Create environment

```bash
conda env create -f environment.yml

conda activate germline-pipeline
```

## Requirements

- Nextflow ≥ 24.x
- Java 17+
- BWA
- SAMtools
- GATK 4
- Ensembl VEP

Ensure all tools are available in your system PATH before executing the workflow.

---

## Running the Pipeline

### Execute the workflow using:

```bash
nextflow run main.nf
```

### To resume an interrupted workflow:

```bash
nextflow run main.nf -resume
```
---

## Input

The pipeline expects:

```
test_data/
├── sample.fastq
```

Reference genome files should be placed inside:

```
reference/
├── toy_reference.fa
├── toy_reference.fa.fai
├── toy_reference.dict
├── ...
```

The reference genome must already be indexed before running the workflow.

---

## Output

After successful execution, the following directory structure is generated.

```text
results/

├── alignment/
│   ├── sample.sam
│   ├── sample.sorted.bam
│   ├── sample.sorted.bam.bai
│   ├── sample.rg.bam
│   ├── sample.rg.bam.bai
│   ├── sample.dedup.bam
│   └── sample.dedup.bam.bai
│
├── variants/
│   ├── sample.g.vcf.gz
│   ├── sample.g.vcf.gz.tbi
│   ├── sample.filtered.vcf.gz
│   └── sample.annotated.vcf
│
└── readcount/
    └── sample.readcount.txt
```

---

## Pipeline Modules

| Module | Purpose |
|---------|---------|
| BWA-MEM | Align reads to reference genome |
| SAMtools Sort | Coordinate sort BAM |
| SAMtools Index | Generate BAM index |
| AddReadGroups | Add sequencing metadata |
| MarkDuplicates | Remove PCR duplicates |
| HaplotypeCaller | Germline variant calling |
| VariantFiltration | Filter low-quality variants |
| VEP | Functional variant annotation |

---

## Future Improvements

- Integrate FastQC and MultiQC
- Base Quality Score Recalibration (BQSR)
- Joint Genotyping workflow
- Container support using Docker and Singularity
- Cloud execution on AWS and Google Cloud
- Support for multiple samples
- Workflow testing using GitHub Actions
- Parameter validation
- nf-core compatible configuration

---

# Acknowledgements

This workflow is inspired by the GATK Best Practices pipeline developed by the Broad Institute and implemented using Nextflow DSL2 modular design principles.

---

## License

This project is distributed under the MIT License.

See the LICENSE file for details.

---

## Contact

**Abhimanyu Mandal**

- LinkedIn: https://www.linkedin.com/in/abhimanyu-mandal/
- Portfolio: https://abhimanyumandal.github.io/Personal-Portfolio/
- Email: abhimanyumandal0810@gmail.com

---

<div align="center">

### ⭐ If you found this repository useful, please consider giving it a Star!

</div>
