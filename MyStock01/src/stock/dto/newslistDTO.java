package stock.dto;

import java.util.ArrayList;

import stock.dao.DBManager;
import stock.vo.StockVO;
import stock.vo.newslistVO;

public class newslistDTO extends DBManager
{
	//����� Ÿ�Ժ� ��ü �Խù��� ������ ��´�.
	public int GetTotal(String etype,String code,int day)
	{
		DBOpen();
		
		String sql = "";
		
		sql  = "select count(*) as total  ";
		sql += "from newslist ";
		sql += "where etype = '" + etype + "' and stockcode = '" + code + "' and date(date) = date(now() - interval " + day + " day)";
		
		RunQuery(sql);
		GetNext();
		int total = GetInt("total"); //��ü ������ ����
		
		DBClose();
		return total;
	}
	//�Խù��� ����� ��´�.
	public ArrayList<newslistVO> GetList(int pageNo,String etype,String code,int limitPage)
	{
		ArrayList<newslistVO> list = new ArrayList<newslistVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select stockcode,url,title,date,score from newslist ";
		sql += "where etype = '" + etype + "' and stockcode = '" + code + "' and date(date) = date(now() - interval 1 day) ";
		sql += "order by date(date) desc , score asc ";
		int startno = 10 * (pageNo - 1);
		sql += "limit " + startno + ", " + limitPage + " ";	
		
		this.RunQuery(sql);
		while( this.GetNext() == true)
		{
			newslistVO vo = new newslistVO();
			vo.setStockCode(GetString("stockcode"));
			vo.setUrl(GetString("url"));
			vo.setTitle(GetString("title"));
			vo.setDate(GetString("date"));
			vo.setScore(Double.parseDouble(GetString("score")));
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;
	}

}
