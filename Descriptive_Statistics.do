***********************

generate TradeValuein1M = TradeValuein1000USD/1000
format TradeValuein1000USD TradeValuein1M %20.0fc
set dp comma
egen TradeFlow = concat(iso3_o iso3_d), punct("->")

order year iso3_o iso3_d ceta_o ceta_d eu_o eu_d TradeFlow Product Product_Description TradeValuein1M TradeValuein1000USD


***********************
* Ten most and less traded products  *

preserve

drop if eu_d==1 & eu_o==1
collapse (sum) TradeValuein1000USD TradeValuein1M  if year==2013 , by(Product Product_Description)

gsort - TradeValuein1000USD
list Product Product_Description TradeValuein1M  in 1/10, abbreviate(25) separator(10) noobs
list Product Product_Description TradeValuein1M  in -11/-2 , abbreviate(25) separator(10) noobs

restore

***********************
* Ten main export destination for Canada *
preserve

keep if year==2013
keep if iso3_o == "CAN"

collapse (sum) TradeValuein1000USD TradeValuein1M , by(TradeFlow)
gsort - TradeValuein1M
list TradeFlow TradeValuein1M in 1/10 , abbreviate(25) separator(10) noobs

restore

***********************
* Ten main import origins for Canada *
preserve

keep if year==2013
keep if iso3_d == "CAN"
collapse (sum) TradeValuein1000USD TradeValuein1M, by(TradeFlow)
gsort - TradeValuein1M
list TradeFlow TradeValuein1M in 1/10 , abbreviate(25) separator(10) noobs

restore

***********************
*Top ten exported Products  Canada => top 5  trade partners *

preserve

keep if year==2013
keep if iso3_o == "CAN"
keep if iso3_d == "USA" | iso3_d == "GBR" |iso3_d == "MEX"| iso3_d == "JPN" |iso3_d == "DEU"


collapse (sum) TradeValuein1000USD TradeValuein1M, by(Product Product_Description)
gsort - TradeValuein1M
list  Product Product_Description TradeValuein1M in 1/10 , abbreviate(25) separator(10) noobs


restore

***********************
*10 most exported HS2 products CAN => all partners + value in USD *
	
preserve

keep if year==2013
keep if iso3_o == "CAN"
collapse (sum) TradeValuein1000USD TradeValuein1M, by(Product Product_Description)

gsort - TradeValuein1M
list  Product Product_Description TradeValuein1M in 1/10 , abbreviate(25) separator(10) noobs

restore

***********************
*10 most imported HS2 products  CAN <= all partners + value in USD *

preserve

keep if year==2013
keep if iso3_d == "CAN"
collapse (sum) TradeValuein1000USD TradeValuein1M, by(Product Product_Description)

gsort - TradeValuein1M
list  Product Product_Description TradeValuein1M in 1/10 , abbreviate(25) separator(10) noobs

restore
***********************
* 10 most exported HS2 products CAN => partners without EU-27 + value in USD *

preserve

keep if year==2013
keep if iso3_o == "CAN"
drop if eu_d == 1
collapse (sum) TradeValuein1000USD TradeValuein1M, by(Product Product_Description)

gsort - TradeValuein1M
list  Product Product_Description TradeValuein1M in 1/10 , abbreviate(25) separator(10) noobs


restore

***********************
* 10 most imported HS2 products CAN < = partners without EU-27 + value in USD *

preserve

keep if year==2013
keep if iso3_d == "CAN"
drop if eu_o == 1
collapse (sum) TradeValuein1000USD TradeValuein1M, by(Product Product_Description)

gsort - TradeValuein1M
list  Product Product_Description TradeValuein1M in 1/10 , abbreviate(25) separator(10) noobs


restore

***********************
* 10 most exported HS2 products CAN => EU (EU-28 aggregated) + value USD *

preserve

keep if year==2013
keep if iso3_o == "CAN"
drop if eu_d == 0
collapse (sum) TradeValuein1000USD TradeValuein1M, by(Product Product_Description)

gsort - TradeValuein1M
list  Product Product_Description TradeValuein1M in 1/10 , abbreviate(25) separator(10) noobs


restore

***********************
* 10 most imported HS2 products CAN <= EU (EU-28 aggregated) + value USD * 

preserve

keep if year==2013
keep if iso3_d == "CAN"
drop if eu_o == 0
collapse (sum) TradeValuein1000USD TradeValuein1M, by(Product Product_Description)

gsort - TradeValuein1M
list  Product Product_Description TradeValuein1M in 1/10 , abbreviate(25) separator(10) noobs

restore

***********************
* 10 most exported  HS2 products EU (EU-28) = > all partners + value USD 

preserve

keep if year==2013
keep if eu_o==1
drop if eu_d==1

collapse (sum) TradeValuein1000USD TradeValuein1M, by(Product Product_Description)

gsort - TradeValuein1M
list  Product Product_Description TradeValuein1M in 1/10 , abbreviate(25) separator(10) noobs

restore

***********************
* 10 most  imported HS2 products EU (EU-28) < =  all partners + value USD *

preserve

keep if year==2013
keep if eu_d==1
drop if eu_o==1

collapse (sum) TradeValuein1000USD TradeValuein1M, by(Product Product_Description)

gsort - TradeValuein1M
list  Product Product_Description TradeValuein1M in 1/10 , abbreviate(25) separator(10) noobs

restore

***********************
* 10 most exported  HS2 products EU (EU-28) = > partners without CAN + value USD

preserve

keep if year==2013
keep if eu_o==1
drop if eu_d==1
drop if iso3_d=="CAN"

collapse (sum) TradeValuein1000USD TradeValuein1M, by(Product Product_Description)

gsort - TradeValuein1M
list  Product Product_Description TradeValuein1M in 1/10 , abbreviate(25) separator(10) noobs

restore

***********************
* 10 most  imported HS2 products EU (EU-28) < = partners without CAN + value USD

preserve

keep if year==2013
keep if eu_d==1
drop if eu_o==1
drop if iso3_o=="CAN"

collapse (sum) TradeValuein1000USD TradeValuein1M, by(Product Product_Description)

gsort - TradeValuein1M
list  Product Product_Description TradeValuein1M in 1/10 , abbreviate(25) separator(10) noobs

restore

***********************
* Ten main export destination for EU27 *

preserve

keep if year==2013
keep if eu_o == 1
drop if eu_d == 1

collapse (sum) TradeValuein1000USD TradeValuein1M , by(iso3_d)
gsort - TradeValuein1M
list iso3_d TradeValuein1M in 1/10 , abbreviate(25) separator(10) noobs

restore

***********************
* Ten main import origins for EU27 *
preserve

keep if year==2013
keep if eu_d == 1
drop if eu_o == 1

collapse (sum) TradeValuein1000USD TradeValuein1M, by(iso3_o)
gsort - TradeValuein1M
list  iso3_o TradeValuein1M in 1/10 , abbreviate(25) separator(10) noobs

restore

***********************
*Top ten exported Products  EU27 => top 5  trade partners *

preserve

keep if year==2013
keep if eu_o == 1
drop if eu_d == 1
keep if iso3_d == "USA" | iso3_d == "CHE" |iso3_d == "NOR"| iso3_d == "JPN" |iso3_d == "TUR"


collapse (sum) TradeValuein1000USD TradeValuein1M, by(Product Product_Description)
gsort - TradeValuein1M
list  Product Product_Description TradeValuein1M in 1/10 , abbreviate(25) separator(10) noobs


restore

***********************