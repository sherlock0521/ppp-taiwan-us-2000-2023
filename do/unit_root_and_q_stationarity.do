******************************************************
* unit_root_and_q_stationarity.do
* 功能：檢定三個對數變數是否為 I(1)，並檢定 q 是否為 I(0)
* 使用 ADF 測試，檢查是否存在購買力平價的共整合關係
******************************************************

clear

* 設定路徑
global workdata "D:\中山學院\113-2\Time series analysis\Term paper\workdata"
global fig "D:\中山學院\113-2\Time series analysis\Term paper\output\figures"

* 讀入清理後的資料
use "$workdata\ppp_dataset.dta", clear
tsset ym

* ==========================================
* STEP 1：三個對數變數 ADF 檢定（是否為 I(1)）
* ==========================================

* 台灣 CPI
display "-------------------------------------------------"
display "ADF Test：台灣 CPI（ln_tw_cpi）"
dfuller ln_tw_cpi, lags(12)

* 美國 CPI
display "-------------------------------------------------"
display "ADF Test：美國 CPI（ln_us_cpi）"
dfuller ln_us_cpi, lags(12)

* 匯率
display "-------------------------------------------------"
display "ADF Test：匯率（ln_fx）"
dfuller ln_fx, lags(12)

* ==========================================
* STEP 2：檢定實質匯率誤差項 q 是否為定態（I(0)）
* ==========================================

* 實質匯率誤差項 q
display "-------------------------------------------------"
display "ADF Test：實質匯率誤差項 q_t"
dfuller q, lags(12)

* 畫出 q_t 時序圖
tsline q, title("實質匯率誤差項 q_t") ///
       ytitle("q_t") xtitle("月份") ///
       note("若 q 為定態，則支持購買力平價")

graph export "$fig\q_ts_plot.png", replace width(2000) height(1200)
