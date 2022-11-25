# `cprdlabel`: a Stata command to automate the labelling of categorical variables provided by CPRD

## Installation
- Download `cprdlabel` by clicking [here](cprdlabel.ado) and then right-clicking on the raw button and selecting "Save link as...".
<p align="center">
	<img src="https://user-images.githubusercontent.com/72571451/204000346-d4685a89-6273-4401-ab03-2b9433a4bcc8.png" width="700"/>
</p>

- Save the ado file in Stata's ado personal location. Use the `sysdir` command within Stata to find the location of the Stata ado personal folder.
<p align="center">
	<img src="https://user-images.githubusercontent.com/72571451/203998790-160fd96d-b5d0-4ae5-9f8f-5aecec6d8a74.png" width="500"/>
</p>

## Syntax
```stata
cprdlabel variable_to_label, lookup("lookup_name") location("lookup_path")
```
### Example
```stata
cprdlabel gender, lookup("Gender") location("Z:\Aurum_Lookups_Feb_2022")
```

## Notes
- Use `cprdlabel` individually for each variable that needs labelling. `cprdlabel` only works for one variable at a time.
- Use the [CPRD data dictionary](https://cprd.com/primary-care-data-public-health-research) to find the relevant lookup for each variable.
- Stata has a limit of 65,536 individual labels within each defined label. `cprdlabel` therefore does not work with the "ConsSource" lookup.
- Store lookup location in a local macro for tidier code.
