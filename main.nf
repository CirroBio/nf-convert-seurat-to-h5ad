#!/usr/bin/env nextflow

include { convert } from './modules/convert.nf'
include { parse_samplesheet } from './modules/parse_samplesheet.nf'

workflow {
    parse_samplesheet()
    convert(parse_samplesheet.out)
}
