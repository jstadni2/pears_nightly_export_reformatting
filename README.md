# pears_nightly_export_reformatting

By default, [PEARS](https://www.k-state.edu/oeie/pears/) exports custom multi-select dropdown fields formatted as binary columns for each field value like so:

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
