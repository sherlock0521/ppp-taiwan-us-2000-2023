************************************************
*** 畫台灣 CPI、 美國 CPI、匯率（對數）變數時序圖 ***
************************************************
clear 

set more off

global workdata = "D:\中山學院\113-2\Time series analysis\Term paper\workdata"
global fig = "D:\中山學院\113-2\Time series analysis\Term paper\output\figures"

* 載入清理後的資料
use "$workdata\ppp_dataset.dta", clear

* 設定時間變數（以 ym 為時間軸）
tsset ym

* 畫圖：台灣 CPI、美國 CPI、匯率（對數）變數
tsline ln_tw_cpi ln_us_cpi ln_fx, ///
    legend(label(1 "台灣 CPI") label(2 "美國 CPI") label(3 "匯率")) ///
    ytitle("對數值（log）") xtitle("月份") ///
    graphregion(color(white))

* 輸出圖檔
graph export "$fig\log_variables_trend.png", replace width(2000) height(1200)

* 台灣 CPI（log）
tsline ln_tw_cpi, ///
    ytitle("ln_tw_cpi") xtitle("月份") ///
    graphregion(color(white))
graph export "$fig\ln_tw_cpi_ts.png", replace width(2000) height(1200)

* 美國 CPI（log）
tsline ln_us_cpi, ///
    ytitle("ln_us_cpi") xtitle("月份") ///
    graphregion(color(white))
graph export "$fig\ln_us_cpi_ts.png", replace width(2000) height(1200)

* 台幣兌美元匯率（log）
tsline ln_fx, ///
    ytitle("ln_fx") xtitle("月份") ///
    graphregion(color(white))
graph export "$fig\ln_fx_ts.png", replace width(2000) height(1200)

tsset ym
tsline q ///
       ytitle("q_t") xtitle("月份") ///
       graphregion(color(white))
graph export "$fig\q_ts_plot.png", replace width(2000) height(1200)

