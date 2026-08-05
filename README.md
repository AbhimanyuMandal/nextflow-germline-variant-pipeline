<p align="center">
  <img src="assets/banner.png" width="100%">
</p>

<h1 align="center">Nextflow DSL2 Germline Variant Calling Pipeline</h1>

<p align="center">
A production-style modular Nextflow DSL2 workflow implementing the GATK Best Practices pipeline for germline variant discovery from FASTQ to functionally annotated variants.
</p>

<p align="center">

<img src="https://img.shields.io/badge/Nextflow-DSL2-23aa62?logo=nextflow"/>
<img src="https://img.shields.io/badge/GATK-4.6-blue"/>
<img src="https://img.shields.io/badge/SAMtools-1.22-orange"/>
<img src="https://img.shields.io/badge/VEP-Ensembl-red"/>
<img src="https://img.shields.io/badge/License-MIT-green"/>
<img src="https://img.shields.io/badge/Linux-Compatible-black?logo=linux"/>
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

## Motivation

The objective of this project is to demonstrate how a complex bioinformatics workflow can be transformed into a modular, reproducible, and maintainable Nextflow DSL2 pipeline following GATK Best Practices.

The workflow emphasizes software engineering principles such as modularity, reproducibility, scalability, and code organization while performing end-to-end germline variant discovery.

---

## Workflow Diagram

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

## Workflow Highlights

- Modular DSL2 architecture
- GATK Best Practices
- Automatic BAM indexing
- Duplicate marking
- Functional annotation using Ensembl VEP
- Organized output directories
- Resume support with `-resume`
- Easily extensible

---

## Technology Stack

- Nextflow DSL2
- Bash
- Linux
- BWA-MEM
- SAMtools
- GATK 4
- Ensembl VEP

---

## Pipeline Execution

The workflow is executed using Nextflow DSL2. 

Each module runs independently, enabling scalable, reproducible, and resumable execution.

The screenshot below demonstrates successful execution of the complete workflow.

<p align="center">
  <img src="assets/pipeline_execution.png" width="900">
</p>

---

## Installation

### Clone the repository

```bash
git clone https://github.com/AbhimanyuMandal/nextflow-germline-variant-pipeline.git

cd nextflow-germline-variant-pipeline
```
### Requirements

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

## Generated Results

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

### Quality Control
- FastQC
- MultiQC

### GATK Enhancements
- Base Quality Score Recalibration (BQSR)
- Joint Genotyping

### Workflow Improvements
- Multiple sample support
- Parameter validation
- Containerization (Docker & Singularity)

### Reproducibility
- GitHub Actions
- nf-core compatibility

---

## Skills Demonstrated

- Nextflow DSL2
- Workflow Design
- Bash Scripting
- Linux
- Bioinformatics
- GATK Best Practices
- NGS Data Processing
- Modular Pipeline Development
- Documentation

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
