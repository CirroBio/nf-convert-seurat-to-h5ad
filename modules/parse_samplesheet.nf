workflow parse_samplesheet {
    main:
    // Create a channel which contains the mainfest file
    samplesheet = channel.fromPath(
        "${params.samplesheet}",
        checkIfExists: true,
        glob: false
    )

    samplesheet
        .splitCsv(header: true)
        .map {
            r -> [
                r['sample'],
                file(
                    r['rds'],
                    checkIfExists: true,
                    glob: false
                )
            ]
        }
        .set { sample_ch }

    emit:
    sample_ch
}