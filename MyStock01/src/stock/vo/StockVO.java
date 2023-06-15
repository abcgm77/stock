package stock.vo;

public class StockVO 
{
	private String stockCode; //�����ڵ�
	private String stockName; //�����
	private String status;    //���� W:��� R:���� C:�Ϸ� E:��������
	private String nowPrice;  //���簡
	
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
