
* ECONP-2 * Q2 * 

********************************************************************************
********************************************************************************
*** ADVANCED TOPICS IN INTERNATIONAL ECONOMICS with Pr. Mathieu PARENTI ***
********************************************************************************
		*** TRADE & THE ENVIRONMENT ***
*** IMPACT OF CETA ON TRADE VOLUMES OF POLLUTANT GOODS ***
********************************************************************************
********************************************************************************



********************************************************************************
** 1. Import the database
********************************************************************************

cd 
"C:\Users\franc\OneDrive - Université Libre de Bruxelles\Desktop\ULB\Courses\4 - Advanced Topics in International Economics\Data"

use "Gravity_V202211.dta", clear 

update all



********************************************************************************
** 2. CLEAR THE DATA
********************************************************************************

* Get rid of the years of non-interest
keep if year >= 2013
keep if year <= 2019

* Removing East Germany
drop if country_exists_o==0
drop if country_exists_d==0
replace country_id_o="DEU" if country_id_o=="DEU.2"
replace country_id_d="DEU" if country_id_d=="DEU.2"
* Removing national trade
drop if iso3_o==iso3_d


* Generate a CETA dummy
gen ceta_o=0
replace ceta_o=1 if eu_o==1
replace ceta_o=1 if iso3_o=="CAN"
gen ceta_d=0
replace ceta_d=1 if eu_d==1
replace ceta_d=1 if iso3_o=="CAN"

replace ceta_o=0 if year < 2017
replace ceta_d=0 if year < 2017

* Generate a dummy taking the value {1} if a portion of a countries' boarder touches water (ocean or sea) 
gen watertouch_o=0
replace watertouch_o=1 if iso3_o == "AUS" | iso3_o == "BEL" | iso3_o == "BGR" | iso3_o == "CAN" | iso3_o == "CHL" | iso3_o == "COL" | iso3_o == "CRI" | iso3_o == "HRV" | iso3_o == "CYP" | iso3_o == "DNK" | iso3_o == "EST" | iso3_o == "FIN" | iso3_o == "FRA" | iso3_o == "DEU" | iso3_o == "GRC" | iso3_o == "ISL" | iso3_o == "IRL" | iso3_o == "ISR" | iso3_o == "ITA" | iso3_o == "JPN" | iso3_o == "KOR" | iso3_o == "PRK" | iso3_o == "LVA" | iso3_o == "LTU" | iso3_o == "MLT" | iso3_o == "MEX" | iso3_o == "NLD" | iso3_o == "NZL" | iso3_o == "NOR" | iso3_o == "POL" | iso3_o == "PRT" | iso3_o == "SVN" | iso3_o == "ESP" | iso3_o == "SWE" | iso3_o == "TUR" | iso3_o == "GBR" | iso3_o == "USA" | iso3_o == "ROU"


gen watertouch_d=0
replace watertouch_d=1 if iso3_d == "AUS" | iso3_d == "BEL" | iso3_d == "BGR" | iso3_d == "CAN" | iso3_d == "CHL" | iso3_d == "COL" | iso3_d == "CRI" | iso3_d == "HRV" | iso3_d == "CYP" | iso3_d == "DNK" | iso3_d == "EST" | iso3_d == "FIN" | iso3_d == "FRA" | iso3_d == "DEU" | iso3_d == "GRC" | iso3_d == "ISL" | iso3_d == "IRL" | iso3_d == "ISR" | iso3_d == "ITA" | iso3_d == "JPN" | iso3_d == "KOR" | iso3_d == "PRK" | iso3_d == "LVA" | iso3_d == "LTU" | iso3_d == "MLT" | iso3_d == "MEX" | iso3_d == "NLD" | iso3_d == "NZL" | iso3_d == "NOR" | iso3_d == "POL" | iso3_d == "PRT" | iso3_d == "SVN" | iso3_d == "ESP" | iso3_d == "SWE" | iso3_d == "TUR" | iso3_d == "GBR" | iso3_d == "USA" | iso3_d == "ROU"


merge 1:m iso3_o iso3_d year using "C:\Users\adech\OneDrive - Université Libre de Bruxelles\ULB cours 2022-2023 backup\International Economics\HS_all_new.dta"


* We only keep countries of  interest = OECD + CETA countries
keep if iso3_o == "AUS" | iso3_o == "AUT" | iso3_o == "BEL" | iso3_o == "BGR" | iso3_o == "CAN" | iso3_o == "CHL" | iso3_o == "COL" | iso3_o == "CRI" | iso3_o == "HRV" | iso3_o == "CYP" | iso3_o == "CZE" | iso3_o == "DNK" | iso3_o == "EST" | iso3_o == "FIN" | iso3_o == "FRA" | iso3_o == "DEU" | iso3_o == "GRC" | iso3_o == "HUN" | iso3_o == "ISL" | iso3_o == "IRL" | iso3_o == "ISR" | iso3_o == "ITA" | iso3_o == "JPN" | iso3_o == "KOR" | iso3_o == "LVA" | iso3_o == "LTU" | iso3_o == "LUX" | iso3_o == "MLT" | iso3_o == "MEX" | iso3_o == "NLD" | iso3_o == "NZL" | iso3_o == "NOR" | iso3_o == "POL" | iso3_o == "PRT" | iso3_o == "SVK" | iso3_o == "SVN" | iso3_o == "ESP" | iso3_o == "SWE" | iso3_o == "CHE" | iso3_o == "TUR" | iso3_o == "GBR" | iso3_o == "USA" | iso3_o == "ROU"


keep if iso3_d == "AUS" | iso3_d == "AUT" | iso3_d == "BEL" | iso3_d == "BGR" | iso3_d == "CAN" | iso3_d == "CHL" | iso3_d == "COL" | iso3_d == "CRI" | iso3_d == "HRV" | iso3_d == "CYP" | iso3_d == "CZE" | iso3_d == "DNK" | iso3_d == "EST" | iso3_d == "FIN" | iso3_d == "FRA" | iso3_d == "DEU" | iso3_d == "GRC" | iso3_d == "HUN" | iso3_d == "ISL" | iso3_d == "IRL" | iso3_d == "ISR" | iso3_d == "ITA" | iso3_d == "JPN" | iso3_d == "KOR" | iso3_d == "LVA" | iso3_d == "LTU" | iso3_d == "LUX" | iso3_d == "MLT" | iso3_d == "MEX" | iso3_d == "NLD" | iso3_d == "NZL" | iso3_d == "NOR" | iso3_d == "POL" | iso3_d == "PRT" | iso3_d == "SVK" | iso3_d == "SVN" | iso3_d == "ESP" | iso3_d == "SWE" | iso3_d == "CHE" | iso3_d == "TUR" | iso3_d == "GBR" | iso3_d == "USA" | iso3_d == "ROU"




bys Product: egen Total2013=sum(TradeValuein1000USD) if year==2013
bys Product: egen Total2014=sum(TradeValuein1000USD) if year==2014
bys Product: egen Total2015=sum(TradeValuein1000USD) if year==2015
bys Product: egen Total2016=sum(TradeValuein1000USD) if year==2016
bys Product: egen Total2017=sum(TradeValuein1000USD) if year==2017
bys Product: egen Total2018=sum(TradeValuein1000USD) if year==2018
bys Product: egen Total2019=sum(TradeValuein1000USD) if year==2019
bys Product: egen Total2020=sum(TradeValuein1000USD) if year==2020
bys Product: egen Total2021=sum(TradeValuein1000USD) if year==2021

generate TotalProductYear=0

replace TotalProductYear=Total2013 if year==2013
replace TotalProductYear=Total2014 if year==2014
replace TotalProductYear=Total2015 if year==2015
replace TotalProductYear=Total2016 if year==2016
replace TotalProductYear=Total2017 if year==2017
replace TotalProductYear=Total2018 if year==2018
replace TotalProductYear=Total2019 if year==2019
replace TotalProductYear=Total2020 if year==2020
replace TotalProductYear=Total2021 if year==2021


table ( Product ) ( year ) ( TotalProductYear )


*******************************************
** NEW CETA DUMMIES **
*******************************************

gen ceta_both = 0
replace ceta_both = 1 if ceta_o == 1 & ceta_d == 1 & year >= 2017
gen ceta_one = 0
replace ceta_one = 1 if year >= 2017 & (ceta_o == 1 | ceta_d == 1)


*****************************************
** Trade variables **
*****************************************

*Generate log variables
gen ltrade=ln(TradeValuein1000USD)
gen lgdp_o=ln(gdp_o)
gen lgdp_d=ln(gdp_d)
gen ldist=ln(distcap)

*Generate o, d, t
egen o = group(iso3_o)
egen d = group(iso3_d)
egen od = group(iso3_o iso3_d)
egen ot = group(iso3_o year)
egen dt = group(iso3_d year)


*******************************************************************************
*3. TESTS
*******************************************************************************

** Collinearity
reg TradeValuein1000USD ceta_both ceta_one fta_wto
estat vif // mean < 10 => no colinerarity
reg ltrade ceta_both ceta_one fta_wto
estat vif // mean < 10 => no colinerarity


reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol
estat vif 

** Heteroscedasticity 

reg TradeValuein1000USD ceta_both ceta_one fta_wto
estat hettest // RHO => hetero => robust SE
reg ltrade ceta_both ceta_one fta_wto
estat hettest // RHO => hetero => robust SE

reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol
estat imtest

*******************************************************************************
*4. REGRESSIONS
*******************************************************************************


// TESTS REG => Don't take it into account
tab ot, gen (ot_FE)
tab dt, gen (dt_FE)
tab od, gen (od_FE)

preserve
keep if Product==1
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol ln_REM_EXP ln_REM_IMP, cluster (od)
estimates store a1
restore

preserve
keep if Product==1
reg ltrade ceta_one ceta_both fta_wto ldist comlang_off contig comcol ot_FE* dt_FE* od_FE*, cluster (od)
estimates store a1
restore

preserve
keep if Product==1
reghdfe ltrade ceta_one ceta_both fta_wto, a (ot dt od) cluster (ot dt od)
estimates store a1
restore

preserve
keep if Product==1
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (ot dt od) cluster (ot dt od)
estimates store a1
restore

sort Product
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
egen b_ceta_one = mean(_b[ceta_one]), by(Product)
egen b_ceta_both = mean(_b[ceta_both]), by(Product)


/// reg (pooled OLS)


reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)




/* List of product categories */
levelsof Product, local(categories)

 

/* Loop over product categories */
foreach category of local categories {

 

  /* Run ppmlhdfe for current category */
  ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) if product_category == `category'

 

  /* Store coefficients in new variables */
  egen ceta_one_coef_`category' = rowtag(coef, "ceta_one")
  egen ceta_both_coef_`category' = rowtag(coef, "ceta_both")

}

 

/* Display the results */
list Product ceta_one_coef_* ceta_both_coef_*


preserve
keep if Product==1
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estat vif
estimates store a1
restore

preserve
keep if Product==2
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a2
restore

preserve
keep if Product==3
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
estimates store a3
restore

preserve
keep if Product==4
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a4
restore

preserve
keep if Product==5
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a5
restore

preserve
keep if Product==6
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a6
restore

preserve
keep if Product==7
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a7
restore

preserve
keep if Product==8
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a8
restore

preserve
keep if Product==9
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a9
restore

preserve
keep if Product==10
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a10
restore

preserve
keep if Product==11
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a11
restore

preserve
keep if Product==12
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a12
restore

preserve
keep if Product==13
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a13
restore

preserve
keep if Product==14
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a14
restore

preserve
keep if Product==15
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a15
restore

preserve
keep if Product==16
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a16
restore

preserve
keep if Product==17
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a17
restore

preserve
keep if Product==18
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a18
restore

preserve
keep if Product==19
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a19
restore

preserve
keep if Product==20
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a20
restore

preserve
keep if Product==21
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a21
restore

preserve
keep if Product==22
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a22
restore

preserve
keep if Product==23
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a23
restore

preserve
keep if Product==24
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a24
restore

preserve
keep if Product==25
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a25
restore

preserve
keep if Product==26
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a26
restore

preserve
keep if Product==27
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a27
restore

preserve
keep if Product==28
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a28
restore

preserve
keep if Product==29
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a29
restore

preserve
keep if Product==30
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a30
restore

preserve
keep if Product==31
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a31
restore

preserve
keep if Product==32
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a32
restore

preserve
keep if Product==33
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a33
restore

preserve
keep if Product==34
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a34
restore

preserve
keep if Product==35
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a35
restore

preserve
keep if Product==36
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a36
restore

preserve
keep if Product==37
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a37
restore

preserve
keep if Product==38
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a38
restore

preserve
keep if Product==39
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a39
restore

preserve
keep if Product==40
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a40
restore

preserve
keep if Product==41
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a41
restore

preserve
keep if Product==42
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a42
restore

preserve
keep if Product==43
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a43
restore

preserve
keep if Product==44
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a44
restore

preserve
keep if Product==45
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a45
restore

preserve
keep if Product==46
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a46
restore

preserve
keep if Product==47
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a47
restore

preserve
keep if Product==48
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a48
restore

preserve
keep if Product==49
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a49
restore

preserve
keep if Product==50
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a50
restore

preserve
keep if Product==51
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a51
restore

preserve
keep if Product==52
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a52
restore

preserve
keep if Product==53
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a53
restore

preserve
keep if Product==54
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a54
restore

preserve
keep if Product==55
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a55
restore

preserve
keep if Product==56
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a56
restore

preserve
keep if Product==57
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a57
restore

preserve
keep if Product==58
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a58
restore

preserve
keep if Product==59
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a59
restore

preserve
keep if Product==60
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a60
restore

preserve
keep if Product==61
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a61
restore

preserve
keep if Product==62
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a62
restore

preserve
keep if Product==63
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a63
restore

preserve
keep if Product==64
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a64
restore

preserve
keep if Product==65
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a65
restore

preserve
keep if Product==66
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a66
restore

preserve
keep if Product==67
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a67
restore

preserve
keep if Product==68
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a68
restore

preserve
keep if Product==69
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a69
restore

preserve
keep if Product==70
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a70
restore

preserve
keep if Product==71
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a71
restore

preserve
keep if Product==72
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a72
restore

preserve
keep if Product==73
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a73
restore

preserve
keep if Product==74
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a74
restore

preserve
keep if Product==75
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a75
restore

preserve
keep if Product==76
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a76
restore

//preserve // insufficient observations
//keep if Product==77
//reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
//estimates store a77
//restore

preserve
keep if Product==78
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a78
restore

preserve
keep if Product==79
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a79
restore

preserve
keep if Product==80
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a80
restore

preserve
keep if Product==81
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a81
restore

preserve
keep if Product==82
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a82
restore

preserve
keep if Product==83
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a83
restore

preserve
keep if Product==84
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a84
restore

preserve
keep if Product==85
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a85
restore

preserve
keep if Product==86
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a86
restore

preserve
keep if Product==87
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a87
restore

preserve
keep if Product==88
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a88
restore

preserve
keep if Product==89
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a89
restore


preserve
keep if Product==90
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a90
restore

preserve
keep if Product==91
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a91
restore

preserve
keep if Product==92
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a92
restore

preserve
keep if Product==93
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a93
restore

preserve
keep if Product==94
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a94
restore

preserve
keep if Product==95
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a95
restore

preserve
keep if Product==96
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a96
restore

preserve
keep if Product==97
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a97
restore

preserve // insufficient observations
keep if Product==98
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a98
restore

preserve // insufficient observations
keep if Product==99 
reg ltrade ceta_one ceta_both fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od)
estimates store a99
restore


estimates table a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 a32 a33 a34 a35 a36 a37 a38 a39 a40 a41 a42 a43 a44 a45 a46 a47 a48 a49 a50 a51 a52 a53 a54 a55 a56 a57 a58 a59 a60 a61 a62 a63 a64 a65 a66 a67 a68 a69 a70 a71 a72 a73 a74 a75 a76 a78 a79 a80 a81 a82 a83 a84 a85 a86 a87 a88 a89 a90 a91 a92 a93 a94 a95 a96 a97, keep (ceta_both ceta_one fta_wto _cons) varlabel


/// reg with year FE => NO!!!

preserve
keep if Product==1
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b1
restore

preserve
keep if Product==2
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust  
estimates store b2
restore

preserve
keep if Product==3
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust  
estimates store b3
restore

preserve
keep if Product==4
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b4
restore

preserve
keep if Product==5
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b5
restore

preserve
keep if Product==6
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b6
restore

preserve
keep if Product==7
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b7
restore

preserve
keep if Product==8
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b8
restore

preserve
keep if Product==9
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b9
restore

preserve
keep if Product==10
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b10
restore

preserve
keep if Product==11
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b11
restore

preserve
keep if Product==12
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b12
restore

preserve
keep if Product==13
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b13
restore

preserve
keep if Product==14
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b14
restore

preserve
keep if Product==15
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b15
restore

preserve
keep if Product==16
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b16
restore

preserve
keep if Product==17
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b17
restore

preserve
keep if Product==18
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b18
restore

preserve
keep if Product==19
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b19
restore

preserve
keep if Product==20
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b20
restore

preserve
keep if Product==21
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b21
restore

preserve
keep if Product==22
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b22
restore

preserve
keep if Product==23
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b23
restore

preserve
keep if Product==24
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b24
restore

preserve
keep if Product==25
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b25
restore

preserve
keep if Product==26
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b26
restore

preserve
keep if Product==27
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b27
restore

preserve
keep if Product==28
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b28
restore

preserve
keep if Product==29
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b29
restore

preserve
keep if Product==30
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b30
restore

preserve
keep if Product==31
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b31
restore

preserve
keep if Product==32
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b32
restore

preserve
keep if Product==33
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b33
restore

preserve
keep if Product==34
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b34
restore

preserve
keep if Product==35
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b35
restore

preserve
keep if Product==36
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b36
restore

preserve
keep if Product==37
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b37
restore

preserve
keep if Product==38
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b38
restore

preserve
keep if Product==39
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b39
restore

preserve
keep if Product==40
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b40
restore

preserve
keep if Product==41
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b41
restore

preserve
keep if Product==42
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b42
restore

preserve
keep if Product==43
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b43
restore

preserve
keep if Product==44
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b44
restore

preserve
keep if Product==45
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b45
restore

preserve
keep if Product==46
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b46
restore

preserve
keep if Product==47
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b47
restore

preserve
keep if Product==48
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b48
restore

preserve
keep if Product==49
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b49
restore

preserve
keep if Product==50
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b50
restore

preserve
keep if Product==51
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b51
restore

preserve
keep if Product==52
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b52
restore

preserve
keep if Product==53
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b53
restore

preserve
keep if Product==54
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b54
restore

preserve
keep if Product==55
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b55
restore

preserve
keep if Product==56
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b56
restore

preserve
keep if Product==57
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b57
restore

preserve
keep if Product==58
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b58
restore

preserve
keep if Product==59
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b59
restore

preserve
keep if Product==60
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b60
restore

preserve
keep if Product==61
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b61
restore

preserve
keep if Product==62
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b62
restore

preserve
keep if Product==63
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b63
restore

preserve
keep if Product==64
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b64
restore

preserve
keep if Product==65
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b65
restore

preserve
keep if Product==66
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b66
restore

preserve
keep if Product==67
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b67
restore

preserve
keep if Product==68
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b68
restore

preserve
keep if Product==69
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b69
restore

preserve
keep if Product==70
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b70
restore

preserve
keep if Product==71
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b71
restore

preserve
keep if Product==72
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b72
restore

preserve
keep if Product==73
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b73
restore

preserve
keep if Product==74
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b74
restore

preserve
keep if Product==75
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b75
restore

preserve
keep if Product==76
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b76

restore

//preserve // insufficient observations
//keep if Product==77
//reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
//estimates store b77
//restore

preserve
keep if Product==78
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b78
restore

preserve
keep if Product==79
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b79
restore

preserve
keep if Product==80
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b80
restore

preserve
keep if Product==81
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b81
restore

preserve
keep if Product==82
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b82
restore

preserve
keep if Product==83
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b83
restore

preserve
keep if Product==84
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b84
restore

preserve
keep if Product==85
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b85
restore

preserve
keep if Product==86
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b86
restore

preserve
keep if Product==87
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b87
restore

preserve
keep if Product==88
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b88
restore

preserve
keep if Product==89
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b89
restore


preserve
keep if Product==90
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b90
restore

preserve
keep if Product==91
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b91
restore

preserve
keep if Product==92
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b92
restore

preserve
keep if Product==93
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b93
restore

preserve
keep if Product==94
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b94
restore

preserve
keep if Product==95
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b95
restore

preserve
keep if Product==96
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b96
restore

preserve
keep if Product==97
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b97
restore

preserve // insufficient observations
keep if Product==98
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b98
restore

preserve // insufficient observations
keep if Product==99 
reg ltrade ceta_one ceta_both fta_wto ot_FE* dt_FE* od_FE*, robust 
estimates store b99
restore




/// reghdfe

preserve
keep if Product==1
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r1
restore

preserve
keep if Product==2
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt)  
estimates store r2
restore

preserve
keep if Product==3
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt)  
estimates store r3
restore

preserve
keep if Product==4
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r4
restore

preserve
keep if Product==5
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r5
restore

preserve
keep if Product==6
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r6
restore

preserve
keep if Product==7
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r7
restore

preserve
keep if Product==8
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r8
restore

preserve
keep if Product==9
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r9
restore

preserve
keep if Product==10
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r10
restore

preserve
keep if Product==11
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r11
restore

preserve
keep if Product==12
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r12
restore

preserve
keep if Product==13
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r13
restore

preserve
keep if Product==14
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r14
restore

preserve
keep if Product==15
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r15
restore

preserve
keep if Product==16
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r16
restore

preserve
keep if Product==17
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r17
restore

preserve
keep if Product==18
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r18
restore

preserve
keep if Product==19
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r19
restore

preserve
keep if Product==20
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r20
restore

preserve
keep if Product==21
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r21
restore

preserve
keep if Product==22
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r22
restore

preserve
keep if Product==23
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r23
restore

preserve
keep if Product==24
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r24
restore

preserve
keep if Product==25
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r25
restore

preserve
keep if Product==26
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r26
restore

preserve
keep if Product==27
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r27
restore

preserve
keep if Product==28
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r28
restore

preserve
keep if Product==29
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r29
restore

preserve
keep if Product==30
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r30
restore

preserve
keep if Product==31
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r31
restore

preserve
keep if Product==32
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r32
restore

preserve
keep if Product==33
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r33
restore

preserve
keep if Product==34
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r34
restore

preserve
keep if Product==35
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r35
restore

preserve
keep if Product==36
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r36
restore

preserve
keep if Product==37
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r37
restore

preserve
keep if Product==38
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r38
restore

preserve
keep if Product==39
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r39
restore

preserve
keep if Product==40
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r40
restore

preserve
keep if Product==41
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r41
restore

preserve
keep if Product==42
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r42
restore

preserve
keep if Product==43
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r43
restore

preserve
keep if Product==44
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r44
restore

preserve
keep if Product==45
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r45
restore

preserve
keep if Product==46
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r46
restore

preserve
keep if Product==47
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r47
restore

preserve
keep if Product==48
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r48
restore

preserve
keep if Product==49
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r49
restore

preserve
keep if Product==50
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r50
restore

preserve
keep if Product==51
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r51
restore

preserve
keep if Product==52
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r52
restore

preserve
keep if Product==53
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r53
restore

preserve
keep if Product==54
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r54
restore

preserve
keep if Product==55
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r55
restore

preserve
keep if Product==56
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r56
restore

preserve
keep if Product==57
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r57
restore

preserve
keep if Product==58
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r58
restore

preserve
keep if Product==59
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r59
restore

preserve
keep if Product==60
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r60
restore

preserve
keep if Product==61
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r61
restore

preserve
keep if Product==62
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r62
restore

preserve
keep if Product==63
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r63
restore

preserve
keep if Product==64
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r64
restore

preserve
keep if Product==65
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r65
restore

preserve
keep if Product==66
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r66
restore

preserve
keep if Product==67
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r67
restore

preserve
keep if Product==68
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r68
restore

preserve
keep if Product==69
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r69
restore

preserve
keep if Product==70
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r70
restore

preserve
keep if Product==71
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r71
restore

preserve
keep if Product==72
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r72
restore

preserve
keep if Product==73
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r73
restore

preserve
keep if Product==74
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r74
restore

preserve
keep if Product==75
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r75
restore

preserve
keep if Product==76
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r76
restore

//preserve // insufficient observations
//keep if Product==77
//reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
//estimates store r77
//restore

preserve
keep if Product==78
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r78
restore

preserve
keep if Product==79
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r79
restore

preserve
keep if Product==80
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r80
restore

preserve
keep if Product==81
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r81
restore

preserve
keep if Product==82
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r82
restore

preserve
keep if Product==83
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r83
restore

preserve
keep if Product==84
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r84
restore

preserve
keep if Product==85
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r85
restore

preserve
keep if Product==86
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r86
restore

preserve
keep if Product==87
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r87
restore

preserve
keep if Product==88
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r88
restore

preserve
keep if Product==89
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r89
restore


preserve
keep if Product==90
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r90
restore

preserve
keep if Product==91
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r91
restore

preserve
keep if Product==92
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r92
restore

preserve
keep if Product==93
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r93
restore

preserve
keep if Product==94
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r94
restore

preserve
keep if Product==95
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r95
restore

preserve
keep if Product==96
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r96
restore

preserve
keep if Product==97
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r97
restore

preserve // insufficient observations
keep if Product==98
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r98
restore

preserve // insufficient observations
keep if Product==99 
reghdfe ltrade ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store r99
restore


estimates table r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31 r32 r33 r34 r35 r36 r37 r38 r39 r40 r41 r42 r43 r44 r45 r46 r47 r48 r49 r50 r51 r52 r53 r54 r55 r56 r57 r58 r59 r60 r61 r62 r63 r64 r65 r66 r67 r68 r69 r70 r71 r72 r73 r74 r75 r76 r78 r79 r80 r81 r82 r83 r84 r85 r86 r87 r88 r89 r90 r91 r92 r93 r94 r95 r96 r97, keep (ceta_both ceta_one fta_wto _cons) varlabel


/// ppmlhdfe

preserve
keep if Product==1
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt)
estimates store p1
restore

preserve
keep if Product==2
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt)  
estimates store p2
restore

preserve
keep if Product==3
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt)  
estimates store p3
restore

preserve
keep if Product==4
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p4
restore

preserve
keep if Product==5
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p5
restore

preserve
keep if Product==6
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p6
restore

preserve
keep if Product==7
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p7
restore

preserve
keep if Product==8
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p8
restore

preserve
keep if Product==9
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p9
restore

preserve
keep if Product==10
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p10
restore

preserve
keep if Product==11
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p11
restore

preserve
keep if Product==12
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p12
restore

preserve
keep if Product==13
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p13
restore

preserve
keep if Product==14
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p14
restore

preserve
keep if Product==15
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p15
restore

preserve
keep if Product==16
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p16
restore

preserve
keep if Product==17
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p17
restore

preserve
keep if Product==18
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p18
restore

preserve
keep if Product==19
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p19
restore

preserve
keep if Product==20
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p20
restore

preserve
keep if Product==21
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p21
restore

preserve
keep if Product==22
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p22
restore

preserve
keep if Product==23
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p23
restore

preserve
keep if Product==24
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p24
restore

preserve
keep if Product==25
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p25
restore

preserve
keep if Product==26
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p26
restore

preserve
keep if Product==27
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p27
restore


preserve
keep if Product==28
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p28
restore

preserve
keep if Product==29
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p29
restore

preserve
keep if Product==30
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p30
restore

preserve
keep if Product==31
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p31
restore

preserve
keep if Product==32
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p32
restore

preserve
keep if Product==33
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p33
restore

preserve
keep if Product==34
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p34
restore

preserve
keep if Product==35
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p35
restore

preserve
keep if Product==36
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p36
restore

preserve
keep if Product==37
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p37
restore

preserve
keep if Product==38
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p38
restore

preserve
keep if Product==39
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p39
restore

preserve
keep if Product==40
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p40
restore

preserve
keep if Product==41
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p41
restore

preserve
keep if Product==42
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p42
restore

preserve
keep if Product==43
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p43
restore

preserve
keep if Product==44
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p44
restore

preserve
keep if Product==45
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p45
restore

preserve
keep if Product==46
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p46
restore

preserve
keep if Product==47
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p47
restore

preserve
keep if Product==48
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p48
restore

preserve
keep if Product==49
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p49
restore

preserve
keep if Product==50
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p50
restore

preserve
keep if Product==51
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p51
restore

preserve
keep if Product==52
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p52
restore

preserve
keep if Product==53
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p53
restore

preserve
keep if Product==54
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p54
restore

preserve
keep if Product==55
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p55
restore

preserve
keep if Product==56
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p56
restore

preserve
keep if Product==57
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p57
restore

preserve
keep if Product==58
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p58
restore

preserve
keep if Product==59
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p59
restore

preserve
keep if Product==60
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p60
restore

preserve
keep if Product==61
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p61
restore

preserve
keep if Product==62
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p62
restore

preserve
keep if Product==63
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p63
restore

preserve
keep if Product==64
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p64
restore

preserve
keep if Product==65
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p65
restore

preserve
keep if Product==66
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p66
restore

preserve
keep if Product==67
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p67
restore

preserve
keep if Product==68
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p68
restore

preserve
keep if Product==69
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p69
restore

preserve
keep if Product==70
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p70
restore

preserve
keep if Product==71
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p71
restore

preserve
keep if Product==72
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p72
restore

preserve
keep if Product==73
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p73
restore

preserve
keep if Product==74
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p74
restore

preserve
keep if Product==75
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p75
restore

preserve
keep if Product==76
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p76
restore

//preserve
//keep if Product==77 // error: insufficient observations
// 
//ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
//estimates store p77
//restore

preserve
keep if Product==78
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p78
restore

preserve
keep if Product==79
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p79
restore

preserve
keep if Product==80
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p80
restore

preserve
keep if Product==81
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p81
restore

preserve
keep if Product==82
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p82
restore

preserve
keep if Product==83
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p83
restore

preserve
keep if Product==84
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p84
restore

preserve
keep if Product==85
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p85
restore

preserve
keep if Product==86
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p86
restore

preserve
keep if Product==87
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p87
restore

preserve
keep if Product==88
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p88
restore

preserve
keep if Product==89
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p89
restore

preserve
keep if Product==90
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p90
restore

preserve
keep if Product==91
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p91
restore

preserve
keep if Product==92
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p92
restore

preserve
keep if Product==93
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p93
restore

preserve
keep if Product==94
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p94
restore

preserve
keep if Product==95
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p95
restore

preserve
keep if Product==96
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p96
restore

preserve
keep if Product==97
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p97
restore

preserve
keep if Product==98 // insufficient observations
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p98
restore

preserve
keep if Product==99 // insufficient observations
 
ppmlhdfe TradeValuein1000USD ceta_one ceta_both fta_wto, a (od ot dt) cluster (od ot dt) 
estimates store p99
restore


estimates table p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40 p41 p42 p43 p44 p45 p46 p47 p48 p49 p50 p51 p52 p53 p54 p55 p56 p57 p58 p59 p60 p61 p62 p63 p64 p65 p66 p67 p68 p69 p70 p71 p72 p73 p74 p75 p76 p78 p79 p80 p81 p82 p83 p84 p85 p86 p87 p88 p89 p90 p91 p92 p93 p94 p95 p96 p97, keep (ceta_both ceta_one fta_wto _cons) varlabel



*******************************************
*Put estimates in a table to compare them => similar to the excel output here above
*******************************************
estimates table a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 a32 a33 a34 a35 a36 a37 a38 a39 a40 a41 a42 a43 a44 a45 a46 a47 a48 a49 a50 a51 a52 a53 a54 a55 a56 a57 a58 a59 a60 a61 a62 a63 a64 a65 a66 a67 a68 a69 a70 a71 a72 a73 a74 a75 a76 a78 a79 a80 a81 a82 a83 a84 a85 a86 a87 a88 a89 a90 a91 a92 a93 a94 a95 a96 a97, keep (ceta_both ceta_one fta_wto _cons) varlabel

estimates table pp27 pp30 pp39 pp44 pp48 pp71 pp72 pp73 pp76 pp84 pp85 pp87 pp88 pp90, keep (ceta_one fta_wto _cons) varlabel


///////////////////////////////////////////////////////////////////////////////////////

****************
**reg, reg FE, reghdfe, ppmlhdfe
****************

// Most exported - OLS

preserve
keep if Product==26
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_26, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_26, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_26, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_26, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore



preserve
keep if Product==27
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_27, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_27, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_27, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_27, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore


preserve
keep if Product==30
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_30, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_30, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_30, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_30, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore




preserve
keep if Product==71
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_71, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_71, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_71, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_71, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore



preserve
keep if Product==84
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_84, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_84, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_84, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_84, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore

preserve
keep if Product==85
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_85, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_85, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_85, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_85, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore


preserve
keep if Product==87
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_87, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_87, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_87, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_87, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore


preserve
keep if Product==88
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore


preserve
keep if Product==88
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore

preserve
keep if Product==31
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_31, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_31, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_31, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore

preserve
keep if Product==72
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_72, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_72, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_72, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore

preserve
keep if Product==68
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_68, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_68, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_68, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore


preserve
keep if Product==17
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_17, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_17, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_17, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore

preserve
keep if Product==26
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_26, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_26, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_26, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore

preserve
keep if Product==22
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_22, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_22, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_22, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore


preserve
keep if Product==71
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_71, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_71, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_71, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore

preserve
keep if Product==30
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_30, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_30, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_30, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore



preserve
keep if Product==46
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_46, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_46, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_46, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore


preserve
keep if Product==14
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_14, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_14, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_14, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore


preserve
keep if Product==66
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_66, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
//reg ltrade ceta_both ceta_one fta_wto ot_FE* dt_FE* od_FE*, robust 
//outreg2 using TABLE_CETA_4MODELS_88, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_66, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_66, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
restore




// all
reg ltrade ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol, cluster (od) 
outreg2 using TABLE_CETA_4MODELS_ALL, keep(ceta_both ceta_one fta_wto ldist lgdp_d lgdp_o watertouch_d watertouch_o comlang_off contig comcol) title(Table FOURMODELS) replace word dec(3)
reghdfe ltrade ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt) 
outreg2 using TABLE_CETA_4MODELS_ALL, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)
ppmlhdfe TradeValuein1000USD ceta_both ceta_one fta_wto, a (od ot dt) cluster (od ot dt)
outreg2 using TABLE_CETA_4MODELS_ALL, keep(ceta_both ceta_one fta_wto) title(Table FOURMODELS) append word dec(3)




///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
** PART 2 - CO2 INTENSITY
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////



merge m:1 Product using  "C:\Users\adech\OneDrive - Université Libre de Bruxelles\ULB cours 2022-2023 backup\International Economics\Datasets\CO2 rates.dta", nogenerate

// ceta_both

reg co2_rate_total_1000 x // from reg
reg y co2_rate_total_1000 x // from reghdfe
reg y co2_rate_total_1000 x // from ppmlhdfe


// ceta_one

reg y co2_rate_total_1000 x // from reg
reg y co2_rate_total_1000 x // from reghdfe
reg y co2_rate_total_1000 x // from ppmlhdfe














