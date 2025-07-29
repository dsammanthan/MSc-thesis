* This file runs the regressions for the model in equation (5) and produces the results shown in table (8)

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
* regress AvgDelay_factor_Max /// 
	NumUniqueSystem_IDs ///
    UsesCapitalLink
	
* Regression (2)	
* regress AvgDelay_factor_Max /// 
	NumUniqueSystem_IDs ///
    UsesCapitalLink ///
	Numberofoutages
	
* Regression (3)	
* regress AvgDelay_factor_Max /// 
	NumUniqueSystem_IDs ///
    UsesCapitalLink ///
	Numberofoutages ///
	NumCapitalLinksUsed
	
* Regression (4)	
* regress AvgDelay_factor_Max /// 
	NumUniqueSystem_IDs ///
	NumCapitalLinksUsed ///
	Numberofoutages ///
	i.origin_country ///
	NumLinksUsed
	
* Regression (5)	
regress AvgDelay_factor_Max /// 
	NumUniqueSystem_IDs ///
    UsesCapitalLink ///
	NumCapitalLinksUsed ///
	NumLinksUsed ///
	i.origin_country
