# `cprdlabel`: a Stata command to automate the labelling of categorical variables provided by CPRD

## Installation
`cprdlabel` can be installed by copying and pasting the following command in to Stata:
```stata
net install cprdlabel, from("https://raw.githubusercontent.com/pstone22/cprdlabel/main") replace
```

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
