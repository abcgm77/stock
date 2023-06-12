package stock.dto;

import java.util.ArrayList;

import stock.dao.DBManager;
import stock.vo.StockVO;

public class StockDTO extends DBManager
{
	//종목 추가하기
	public boolean AddStock(String code, String name)
	{
		DBOpen();
		String sql = ""; 
		sql  = "insert into stock(stockcode, stockname)";
		sql += "values('" + _R(code) + "', '" + _R(name) + "')";
		
		RunCommand(sql);
		DBClose();
		return true;
	}
	
	//종목 삭제하기
	public boolean DelStock(String code)
	{
		DBOpen();
		String sql = "delete from stock where stockcode='" + _R(code) +"'";
		RunCommand(sql);
		
		DBClose();
		return true;
	}
	
	//종목 보여주기
	public ArrayList<StockVO> ShowStock()
	{
		DBOpen();
		ArrayList<StockVO> list = new ArrayList<StockVO>();
		String sql = "";
		sql = "select * from stock";
		try
		{
			RunQuery(sql);
			while(GetNext())
			{
				StockVO vo = new StockVO();
				
				vo.setStockCode(GetString("stockcode"));
				vo.setStockName(GetString("stockname"));
				vo.setStatus(GetString("status"));
				
				list.add(vo);
			}
		}
		catch(Exception e)
		{
			DBClose();
			return null;
		}
		DBClose();
		return list;
	}
	
	//종목 중복 검사
	public boolean QueryStock(String code)
	{
		DBOpen();
		
		String sql = "select * from stock where stockcode='"+ _R(code) + "'";
		RunQuery(sql);
		
		boolean check = GetNext();
		
		DBClose();
		return check;
	}
	
	//종목 상세보기
	public StockVO StockInfo(String code)
	{
		DBOpen();
		
		String sql = "select * from stock where stockcode='" + code + "'";
		StockVO vo = new StockVO();
		RunQuery(sql);
		GetNext();
		vo.setStockName(GetString("stockname"));
		vo.setStatus(GetString("status"));
		
		DBClose();
		
		return vo;
	}
	
	public String NowPrice(String code)
	{
		DBOpen();
		
		String price = "";
		
		String sql = "select nowprice from stock where stockcode='" + code + "'";
		RunQuery(sql);
		if(GetNext() == true)
		{
			price = GetString("nowprice");
		}
		
		DBClose();
		return price;
	}
}
