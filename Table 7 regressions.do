* This file runs the regressions for the model in equation (4) and produces the results shown in table (7)

* Import excel file containing all results of TAs run
import excel "combined_TA_results_all_scenarios.xlsx", sheet("Sheet1") firstrow clear

* Filter to global-level observations
keep if Granularity == "Global"

* Encode scenario types with baseline as reference
encode Scenario, gen(scenario_code)
char scenario_code[omit] "baseline"

* Comment out as desired

* Regression (1)
* regress AvgDelay_factor_Max ///
NumUniqueSystem_IDs ///
UsesCapitalLink

* Regression (2)
* regress AvgDelay_factor_Max ///
NumUniqueSystem_IDs ///
UsesCapitalLink ///
NumCapitalLinksUsed

* Regression (3)
* regress AvgDelay_factor_Max ///
NumUniqueSystem_IDs ///
UsesCapitalLink ///
NumCapitalLinksUsed ///
Numberofoutages

* Regression (4)
* regress AvgDelay_factor_Max ///
NumUniqueSystem_IDs ///
NumCapitalLinksUsed ///
NumLinksUsed ///
Numberofoutages

* Regression (5)
regress AvgDelay_factor_Max ///
NumUniqueSystem_IDs ///
NumCapitalLinksUsed ///
Numberofoutages 
