# nf-convert-seurat-to-h5ad
Nextflow workflow to convert Seurat objects (.rds) to cellxgene-compatible AnnData (.h5ad)

### Parameters

- `samplesheet`: Path to CSV with columns `sample` and `rds`
- `outdir`: Folder where outputs will be written (`${params.outdir}/${sample}.h5ad`)

### Conversion via Seurat

```
#!/usr/bin/env Rscript

library(Seurat)
library(SeuratDisk)

print("Reading in ${seurat_file}")
obj = readRDS("${seurat_file}")
print(obj)

print("Saving in h5Seurat format")
SaveH5Seurat(obj, filename = "${sample_id}.h5Seurat")
print("Saving in h5ad format")
Convert("${sample_id}.h5Seurat", dest = "h5ad")
```