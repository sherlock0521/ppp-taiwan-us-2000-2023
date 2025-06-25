# Purchasing Power Parity: Taiwan vs. US (2000–2023)

This project empirically tests the Purchasing Power Parity (PPP) hypothesis between Taiwan and the United States using monthly data from 2000 to 2023. The analysis is conducted using Stata and documented in a LaTeX-written term paper.

## 📌 Research Question

Does the real exchange rate between Taiwan and the United States exhibit mean reversion in the long run?  
That is, does the PPP hypothesis hold under monthly CPI and exchange rate data?

## 📊 Data Sources

- **Taiwan CPI**: Directorate-General of Budget, Accounting and Statistics (DGBAS)
- **US CPI**: FRED (CPIAUCNS)
- **TWD/USD Exchange Rate**: FRED (DEXTAUS, monthly average)

## 🔧 Methodology

1. Construct log-transformed variables:
   - \( p_t = \log P_t \) (Taiwan CPI)
   - \( p_t^* = \log P_t^* \) (US CPI)
   - \( s_t = \log S_t \) (Exchange rate)

2. Define real exchange rate deviation:
   \[
   q_t = s_t + p_t^* - p_t
   \]

3. Perform ADF unit root tests:
   - Test if \( p_t \), \( p_t^* \), and \( s_t \) are I(1)
   - Test if \( q_t \) is I(0) (mean reverting)

## 📈 Key Findings

- All three core variables (\( \log P_t \), \( \log P_t^* \), and \( \log S_t \)) are I(1).
- The real exchange rate deviation \( q_t \) is not stationary.
- Thus, **PPP does not hold** between Taiwan and the US over this period.

## 🛠 Tools Used

- **Stata**: For data cleaning, time series analysis, and plotting
- **LaTeX**: For writing the final report
- **Excel**: For initial preprocessing of raw CPI files

## 📂 do

| File Name | Description |
|-----------|-------------|
| `taiwan_cpi_cleaning.do` | Clean and transform Taiwan CPI Excel data into analysis-ready format with monthly `ym` variable. |
| `us_cpi_cleaning.do` | Clean US CPI data downloaded from FRED (CPIAUCNS), create `ym`, and save to Stata format. |
| `twd_usd_clearing.do` | Process daily TWD/USD exchange rates, compute monthly averages. |
| `merge_ppp_inputs.do` | Merge CPI and FX data, compute PPP deviation: \( q_t = s_t + p_t^* - p_t \). |
| `unit_root_and_q_stationarity.do` | Run ADF tests on log CPI and FX; test stationarity of \( q_t \). |
| `plot.do` | Plot time series of log CPI and FX, export to PNG figures. |

## 📄 Term Paper

The final term paper is available under `/paper/time_series_term_paper.pdf`. It contains full model derivation, test results, plots, and conclusion.
