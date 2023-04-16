import FinanceDataReader as fdr
import pandas as pd
import numpy as np
import ta

def fetch_stock_data(ticker, start, end):
    stock_data = fdr.DataReader(ticker, start=start, end=end)
    if stock_data.empty:
        print(f"No data found for ticker {ticker} between {start} and {end}")
        return None
    return stock_data

def calculate_indicators(stock_data):
    stock_data['RSI'] = ta.momentum.RSIIndicator(stock_data['Close']).rsi()
    stock_data['MACD'] = ta.trend.MACD(stock_data['Close']).macd()
    stock_data['Signal Line'] = ta.trend.MACD(stock_data['Close']).macd_signal()

    adi = ta.trend.ADXIndicator(stock_data['High'], stock_data['Low'], stock_data['Close'])
    stock_data['+DI'] = adi.adx_pos()
    stock_data['-DI'] = adi.adx_neg()

    stock_data.dropna(inplace=True)

    return stock_data

def buy_recommendation(stock_data, rsi_threshold=60, macd_threshold=0, di_threshold=25):
    buy_signals = []

    for index, row in stock_data.iterrows():
        if row['RSI'] < rsi_threshold and row['MACD'] > row['Signal Line'] and row['MACD'] > macd_threshold and row['+DI'] > row['-DI'] and row['+DI'] > di_threshold:
            reasons = [
                f"RSI: {row['RSI']:.2f}",
                f"MACD: {row['MACD']:.2f}, Signal Line: {row['Signal Line']:.2f}",
                f"+DI: {row['+DI']:.2f}, -DI: {row['-DI']:.2f}"
            ]
            buy_signals.append((row, reasons))

    return buy_signals

def sell_recommendation(stock_data, rsi_threshold=70, macd_threshold=0, di_threshold=25):
    sell_signals = []

    for index, row in stock_data.iterrows():
        dead_cross_count = 0

        if row['RSI'] > rsi_threshold:
            dead_cross_count += 1
        if row['MACD'] < row['Signal Line'] and row['MACD'] < macd_threshold:
            dead_cross_count += 1
        if row['+DI'] < row['-DI'] and row['+DI'] < di_threshold:
            dead_cross_count += 1

        if dead_cross_count >= 2:
            reasons = [
                f"RSI: {row['RSI']:.2f}",
                f"MACD: {row['MACD']:.2f}, Signal Line: {row['Signal Line']:.2f}",
                f"+DI: {row['+DI']:.2f}, -DI: {row['-DI']:.2f}"
            ]
            sell_signals.append((row, reasons))

    return sell_signals



def estimate_buy_window(stock_data, buy_signals, window=5):
    buy_windows = []
    for signal, reasons in buy_signals:
        start_date = signal.name
        end_date = start_date + pd.DateOffset(days=window)
        buy_windows.append((start_date, end_date, reasons))

    return buy_windows

if __name__ == '__main__':
    ticker = '005930'
    start_date = '2023-01-01'
    end_date = '2023-04-10'

    stock_data = fetch_stock_data(ticker, start_date, end_date)
    if stock_data is not None:
        stock_data = calculate_indicators(stock_data)
        buy_signals = buy_recommendation(stock_data)
        sell_signals = sell_recommendation(stock_data)

    print(f"Buy recommendations for {ticker} between {start_date} and {end_date}:")
    for signal, reasons in buy_signals:
        print(f"Date: {signal.name}, Reasons: {', '.join(reasons)}")

    print(f"\nSell recommendations for {ticker} between {start_date} and {end_date}:")
    for signal, reasons in sell_signals:
        print(f"Date: {signal.name}, Reasons: {', '.join(reasons)}")

    buy_windows = estimate_buy_window(stock_data, buy_signals)
    sell_windows = estimate_buy_window(stock_data, sell_signals)

    print("\nEstimated 사는 windows:")
    for start, end, reasons in buy_windows:
        print(f"사라. From {start} to {end}, Reasons: {', '.join(reasons)}")

    print("\nEstimated 파는 windows:")
    for start, end, reasons in sell_windows:
        print(f"팔아라. From {start} to {end}, Reasons: {', '.join(reasons)}")
