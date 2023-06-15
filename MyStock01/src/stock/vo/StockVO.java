package stock.vo;

public class StockVO 
{
	private String stockCode; //종목코드
	private String stockName; //종목명
	private String status;    //상태 W:대기 R:실행 C:완료 E:없는종목
	private String nowPrice;  //현재가
	
	public StockVO()
	{
		stockCode = "";
		stockName = "";
		status    = "w";
		nowPrice  = "0";
	}

	public String getStockCode() { return stockCode; }
	public String getStockName() { return stockName; }
	public String getStatus()    { return status;    }
	public String getNowPrice()  { return nowPrice;  }
	
	public void setStockCode(String stockCode) { this.stockCode = stockCode; }
	public void setStockName(String stockName) { this.stockName = stockName; }
	public void setStatus(String status)       { this.status = status;       }
	public void setNowPrice(String nowPrice)   { this.nowPrice = nowPrice;   }
	
}
