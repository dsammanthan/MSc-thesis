* This file runs the regressions for the model in equation (6) and produces the results shown in table (21)

* Import excel file containing all results of TAs run
import excel "combined_TA_results_all_scenarios.xlsx", sheet("Sheet1") firstrow clear

* Filter to global-level observations
keep if Granularity == "Country"

* Encode scenario types with baseline as reference
encode Scenario, gen(scenario_code)
char scenario_code[omit] "baseline"

* Encode countries 
encode OriginCountry, gen(origin_country)

* Comment out as desired

* Regression (1)	
* logit UsesCapitalLink ///
    NumUniqueSystem_IDs /// 
	Numberofoutages /// 
	NumLinksUsed 
	
* Regression (2)	
* logit UsesCapitalLink ///
    NumUniqueSystem_IDs /// 
	NumLinksUsed /// 
	i.origin_country
	
* Regression (3)	
logit UsesCapitalLink ///
    NumUniqueSystem_IDs /// 
	Numberofoutages /// 
	NumLinksUsed /// 
	i.origin_country
