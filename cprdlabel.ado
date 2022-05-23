/* Program for labelling values in CPRD files using CPRD lookups - PWS 2021

Syntax:
	cprdlabel var_to_label, lookup("3_letter_CPRD_lookup") location("path_to_CPRD_lookups")
	e.g. cprdlabel data1, lookup("OPR") location("D:\Data\Lookups\CPRD GOLD\TXTFILES")

*/

capture program drop cprdlabel
program define cprdlabel
	version 16.0
	syntax varlist(max=1), LOOKUP(string) LOCation(string)
	
	quietly {
	    
		//Save current dataset
		preserve
		
		//Generate labels
		import delimited "`location'/`lookup'.txt", ///
		varnames(nonames) rowrange(2) clear

		//Define the labels
		quietly count
		local n = `r(N)'
		
		//Check size of label list
		if `n' > 65536 {
			
			display as error "Label lookup too large. Stata can only handle 65,536 labels."
			error
		}
		
		//Variable to count backticks (`)
		local backtick = 0
		
		forvalues i = 1/`n' {
			
			//Check for backticks (these break the script)
			if  strpos(v2[`i'], "`") {
				
				if `backtick' == 0 {
					
					noisily display "The backtick character (\`) causes problems with this script, therefore all instances will be replaced with an apostrophe (')..."
				}
				
				local backtick = `backtick'+1
				
				local old_desc = v2[`i']
				
				replace v2 = subinstr(v2[`i'], "`", "'", .) if _n == `i'
				
				noisily display "`old_desc'" " changed to " v2[`i']
			}
			
			label define `lookup' `=v1[`i']' "`=v2[`i']'", add
		}
		
		//Save value labels in a temporary do-file with the -label- command
		tempfile `lookup'lbl
		label save using ``lookup'lbl', replace
		
		//Restore dataset
		restore
		
		//Apply labels
		do ``lookup'lbl'
		label values `varlist' `lookup'
		
	} //End of quietly block

end // End program
	
