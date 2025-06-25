******************************************************
* clean_cpi_tw_excel.do
* 功能：將整理好的 Excel CPI 轉為分析用格式
******************************************************
clear

* 設定路徑
global rawdata "D:\中山學院\113-2\Time series analysis\Term paper\rawdata"
global workdata "D:\中山學院\113-2\Time series analysis\Term paper\workdata"

* 匯入 Excel
import excel using "$rawdata\taiwan_cpi_cleaning.xlsx", firstrow clear

* 建立 Stata 時間變數 ym
gen ym = ym(year, month)
format ym %tm

* 排序欄位
order ym year month tai_cpi

* 儲存為分析用資料
save "$workdata\cpi_tw.dta", replace
export delimited using "$workdata\cpi_tw.csv", replace

