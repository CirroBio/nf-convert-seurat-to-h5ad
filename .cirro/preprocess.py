#!/usr/bin/env python3

from cirro.helpers.preprocess_dataset import PreprocessDataset

if __name__ == "__main__":
    # Get the information provided to run this process
    ds = PreprocessDataset.from_running()

    # Get the table of files given as inputs, filtering to
    # just those files with the .rds extension
    files = ds.files.loc[ds.files['file'].str.endswith('.rds')]

    ds.log(f"Found {len(files):,} .rds files to process")

    # Write out the table of files to be used as input to the workflow
    files.rename(columns={'file': 'rds'}).to_csv("samplesheet.csv", index=None)

    # Add a parameter pointing to the samplesheet
    ds.add_param("samplesheet", "samplesheet.csv")
