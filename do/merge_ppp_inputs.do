******************************************************
* 檔案名稱：merge_ppp_inputs.do
* 功能：合併三筆資料，並建構實質匯率變數 q_t
* 資料：台灣 CPI、美國 CPI、台幣匯率（月平均）
******************************************************

clear

* 設定資料夾
global workdata "D:\中山學院\113-2\Time series analysis\Term paper\workdata"
global fig "D:\中山學院\113-2\Time series analysis\Term paper\output\figures"

* 讀入台灣 CPI 資料
use "$workdata\cpi_tw.dta", clear

* 合併美國 CPI（many-to-1）
merge 1:1 ym using "$workdata\cpi_us.dta"
drop if _merge != 3
drop _merge

* 合併台幣匯率（many-to-1）
merge 1:1 ym using "$workdata\fx_twdusd.dta"
drop if _merge != 3
drop _merge

* 建構 log 變數
gen ln_fx     = ln(fx_twdusd)
gen ln_tw_cpi = ln(tai_cpi)
gen ln_us_cpi = ln(us_cpi)

* 建構實質匯率 q_t（PPP 誤差）
gen q = ln_fx + ln_us_cpi - ln_tw_cpi
summarize q

* 儲存資料
save "$workdata\ppp_dataset.dta", replace
export delimited using "$workdata\ppp_dataset.csv", replace
