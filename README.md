# PEARS Nightly Export Reformatting

[PEARS](https://www.k-state.edu/oeie/pears/) exports custom multi-select dropdown fields formatted as binary columns for each field value like so:

| module_id | custom_field_value_1 | custom_field_value_2 | custom_field_value_3 |
|-----------|----------------------|----------------------|----------------------|
| 1         | 1                    | 0                    | 0                    |
| 2         | 0                    | 1                    | 0                    |
| 3         | 0                    | 1                    | 1                    |

This script converts these columns to a single column of list-like strings for ease of analysis, demonstrated below:

| module_id | custom_field    |
|-----------|-----------------|
| 1         | Value 1         |
| 2         | Value 2         |
| 3         | Value 2,Value 3 |

## Installation

The recommended way to install the PEARS Nightly Export Reformatting script is through git, which can be downloaded [here](https://git-scm.com/downloads). Once downloaded, run the following command:

```bash
git clone https://github.com/jstadni2/pears_nightly_export_reformatting
```

Alternatively, this repository can be downloaded as a zip file via this link:
[https://github.com/jstadni2/pears_nightly_export_reformatting/zipball/master/](https://github.com/jstadni2/pears_nightly_export_reformatting/zipball/master/)

This repository is designed to run out of the box on a Windows PC using Docker and the [/sample_inputs](https://github.com/jstadni2/pears_nightly_export_reformatting/tree/master/sample_inputs) and [/sample_outputs](https://github.com/jstadni2/pears_nightly_export_reformatting/tree/master/sample_outputs) directories.
To run the script in its current configuration, follow [this link](https://docs.docker.com/desktop/windows/install/) to install Docker Desktop for Windows. 

With Docker Desktop installed, this script can be run simply by double clicking the `run_script.bat` file in your local directory.

The `run_script.bat` file can also be run in Command Prompt by entering the following command with the appropriate path:

```bash
C:\path\to\pears_nightly_export_reformatting\run_script.bat
```

### Setup instructions for SNAP-Ed implementing agencies

The following steps are required to execute PEARS Nightly Export Reformatting using your organization's PEARS data:
1. Contact [PEARS support](mailto:support@pears.io) to set up an [AWS S3](https://aws.amazon.com/s3/) bucket to store automated PEARS exports.
2. Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).
3. Use AWS CLI to [create a named profile](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html) for the PEARS S3 credentials.
	- The command used to create a named profile is provided in [pears_nightly_export_reformatting.py](https://github.com/jstadni2/pears_nightly_export_reformatting/blob/master/pears_nightly_export_reformatting.py#L9-L18).
4. Set the appropriate input and output paths in `pears_nightly_export_reformatting.py` and `run_script.bat`.
	- The [Input Files](#input-files) and [Output Files](#output-files) sections provide an overview of required and output data files.
	- Downloading PEARS S3 objects to the build context would enable continued use of Docker and `run_script.bat` with minimal modifications.

### Additional setup considerations

- The formatting of PEARS export workbooks changes periodically. The example PEARS exports included in the [/sample_inputs](https://github.com/jstadni2/pears_nightly_export_reformatting/tree/master/sample_inputs) directory are based on workbooks downloaded on 06/28/22.
Modifications to `pears_nightly_export_reformatting.py` may be necessary to run with subsequent PEARS exports.
- Illinois Extension utilized [Task Scheduler](https://docs.microsoft.com/en-us/windows/win32/taskschd/task-scheduler-start-page) to run this script ahead of routine reports.
- Plans to deploy the PEARS Nightly Export Reformatting on AWS were never implemented and are currently beyond the scope of this repository.
- Other SNAP-Ed implementing agencies intending to utilize the PEARS Nightly Export Reformatting script should consider the following adjustments as they pertain to their organization:
	- [import_modules](https://github.com/jstadni2/pears_nightly_export_reformatting/blob/master/pears_nightly_export_reformatting.py#L62-L66),
	[custom_field_labels](https://github.com/jstadni2/pears_nightly_export_reformatting/blob/master/pears_nightly_export_reformatting.py#L71-L72),
	and the [dictionary](https://github.com/jstadni2/pears_nightly_export_reformatting/blob/master/pears_nightly_export_reformatting.py#L78-L96) defined in the `replace_all()` function of `pears_nightly_export_reformatting.py`
	are based on Illinois Extension's implementation of [PEARS Custom Fields](https://support.pears.io/manage-custom-fields/). Adjust as needed for your organization's specification.	
	
## Input Files

The following input files are required to run the PEARS Nightly Export Reformatting script:
- PEARS module exports downloaded from the AWS S3:
	- [Coalition_Export.xlsx](https://github.com/jstadni2/pears_nightly_export_reformatting/blob/master/sample_inputs/Coalition_Export.xlsx)
	- [Indirect_Activity_Export.xlsx](https://github.com/jstadni2/pears_nightly_export_reformatting/blob/master/sample_inputs/Indirect_Activity_Export.xlsx)
	- [Partnership_Export.xlsx](https://github.com/jstadni2/pears_nightly_export_reformatting/blob/master/sample_inputs/Partnership_Export.xlsx)
	- [Program_Activities_Export.xlsx](https://github.com/jstadni2/pears_nightly_export_reformatting/blob/master/sample_inputs/Program_Activities_Export.xlsx)
	- [PSE_Site_Activity_Export.xlsx](https://github.com/jstadni2/pears_nightly_export_reformatting/blob/master/sample_inputs/PSE_Site_Activity_Export.xlsx)

Example input files are provided in the [/sample_inputs](https://github.com/jstadni2/pears_nightly_export_reformatting/tree/master/sample_inputs) directory. 

## Output Files

The following output files are produced by the PEARS Nightly Export Reformatting script:
- Reformatted PEARS module exports:
	- [Coalition_Export.xlsx](https://github.com/jstadni2/pears_nightly_export_reformatting/blob/master/sample_outputs/Coalition_Export.xlsx)
	- [Indirect_Activity_Export.xlsx](https://github.com/jstadni2/pears_nightly_export_reformatting/blob/master/sample_outputs/Indirect_Activity_Export.xlsx)
	- [Partnership_Export.xlsx](https://github.com/jstadni2/pears_nightly_export_reformatting/blob/master/sample_outputs/Partnership_Export.xlsx)
	- [Program_Activities_Export.xlsx](https://github.com/jstadni2/pears_nightly_export_reformatting/blob/master/sample_outputs/Program_Activities_Export.xlsx)
	- [PSE_Site_Activity_Export.xlsx](https://github.com/jstadni2/pears_nightly_export_reformatting/blob/master/sample_outputs/PSE_Site_Activity_Export.xlsx)
	
Example output files are provided in the [/sample_outputs](https://github.com/jstadni2/pears_nightly_export_reformatting/tree/master/sample_outputs) directory.