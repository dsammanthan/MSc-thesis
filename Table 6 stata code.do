* This file runs the summary of statistics and produces the results shown in table (6)

* Import excel file containing all results of TAs run
import excel "combined_TA_results_all_scenarios.xlsx", sheet("Sheet1") firstrow clear

* Filter to global-level observations
keep if Granularity == "Country"

* Comment out for the desired country as required
keep if OriginCountry == "United States"
* keep if OriginCountry == "China"
* keep if OriginCountry == "Germany"
* keep if OriginCountry == "Japan"
* keep if OriginCountry == "India"

summarize
