******************************************************
* 檔案名稱：clean_twdusd.do
* 功能：清理每日台幣兌美元匯率，計算月平均
* 輸入：twd_usd.csv（每日匯率）
* 輸出：fx_twdusd.dta（含月平均匯率）
******************************************************

clear

* 📁 設定資料夾
global rawdata "D:\中山學院\113-2\Time series analysis\Term paper\rawdata"
global workdata "D:\中山學院\113-2\Time series analysis\Term paper\workdata"

* 📥 匯入每日匯率資料
import delimited "$rawdata\twd_usd.csv", clear

* ⏱️ 建立 date 與年月
gen date = date(observation_date, "YMD")
format date %td
gen year = year(date)
gen month = month(date)
gen ym = ym(year, month)
format ym %tm

* 📊 計算每月平均匯率
collapse (mean) fx_twdusd = dextaus, by(ym year month)

* ✅ 儲存清理後資料
save "$workdata\fx_twdusd.dta", replace
export delimited using "$workdata\fx_twdusd.csv", replace
