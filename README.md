# Modular Germline Variant Calling Pipeline using Nextflow DSL2

![Nextflow](https://img.shields.io/badge/Nextflow-DSL2-brightgreen)
![GATK](https://img.shields.io/badge/GATK-4.6-blue)
![SAMtools](https://img.shields.io/badge/SAMtools-1.x-orange)
![BWA](https://img.shields.io/badge/BWA-MEM-yellow)
![VEP](https://img.shields.io/badge/VEP-Ensembl-red)
![Platform](https://img.shields.io/badge/Platform-Linux-success)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

---

## Overview

This repository contains a modular **Nextflow DSL2** pipeline implementing the **GATK Best Practices** workflow for germline variant discovery from next-generation sequencing (NGS) data.

The workflow performs read alignment, BAM processing, duplicate marking, germline variant calling, variant filtration, and functional annotation using the Ensembl Variant Effect Predictor (VEP). Each analysis step is implemented as an independent DSL2 module, making the pipeline reproducible, scalable, and easy to extend.

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

# Pipeline Workflow

```text
FASTQ
   │
   ▼
BWA-MEM
   │
   ▼
SAMtools Sort
   │
   ▼
SAMtools Index
   │
   ▼
Add Read Groups
   │
   ▼
SAMtools Index
   │
   ▼
MarkDuplicates
   │
   ▼
SAMtools Index
   │
   ▼
HaplotypeCaller
   │
   ▼
Index GVCF
   │
   ▼
Variant Filtration
   │
   ▼
VEP Annotation
```

---

## Directory Structure

```text
nextflow-germline-variant-pipeline/

├── modules/
│   ├── alignment/
│   ├── gatk/
│   └── qc/
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
