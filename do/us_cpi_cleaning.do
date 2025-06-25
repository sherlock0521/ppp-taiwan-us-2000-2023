******************************************************
* 檔案名稱：clean_us_cpi.do
* 功能：清理 FRED 的美國 CPI（CPIAUCNS）
* 輸入檔案：us_cpi.csv
* 輸出檔案：cpi_us.dta（含 year, month, ym, us_cpi）
******************************************************

clear

* 📁 設定資料夾（請依你電腦實際位置修改）
global rawdata "D:\中山學院\113-2\Time series analysis\Term paper\rawdata"
global workdata "D:\中山學院\113-2\Time series analysis\Term paper\workdata"

* 📥 匯入美國 CPI（FRED 格式）
import delimited "$rawdata\us_cpi.csv", clear

* 轉換日期格式為 date 變數
gen date = date(observation_date, "YMD")
format date %td

* 擷取年月與建立 ym
gen year = year(date)
gen month = month(date)
gen ym = ym(year, month)
format ym %tm

* 重新命名 CPI 欄位
rename cpiaucns us_cpi

* 重新排序欄位
order ym year month us_cpi observation_date date

* 儲存清理後資料
save "$workdata\cpi_us.dta", replace
export delimited using "$workdata\cpi_us.csv", replace
