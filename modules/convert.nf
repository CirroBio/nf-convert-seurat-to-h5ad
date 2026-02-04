process convert {
    publishDir params.outdir, mode: 'copy', overwrite: true, glob: "${sample_id}.h5Seurat"
    publishDir params.outdir, mode: 'copy', overwrite: true, glob: "${sample_id}.h5ad", enabled: ! { params.cellxgene_prepare }
    input:
        tuple val(sample_id), path(seurat_file)
    output:
        tuple val(sample_id), path("${sample_id}.h5Seurat"), emit: h5Seurat
        tuple val(sample_id), path("${sample_id}.h5ad"), emit: h5ad
    script:
        template "convert.Rscript"
}