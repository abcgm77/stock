package stock.dao;
import java.sql.Array;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBManager 
{

	private String host;   //DB 연결정보
	private String userid; //DB 사용자
	private String userpw; //DB 암호
	
	private Connection conn = null; //DB연결객체
	private ResultSet  rs   = null;
	
	public DBManager()
	{
		this.host   = "jdbc:mysql://192.168.0.48:3306/stock";
		this.host  += "?useUnicode=true&characterEncoding=utf-8";
		this.host  += "&serverTimezone=UTC";
		
		this.userid = "root";
		this.userpw = "ezen";
	}
	
	public void setUserid(String userid) { this.userid = userid; }
	public void setUserpw(String userpw) { this.userpw = userpw; }

	//DB연결
	//리턴 값 : true=성공,false=실패
	public boolean DBOpen()
	{
		try
		{
			//1. jdbc 라이브러리 로딩
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//2. 데이터베이스에 연결한다.
			conn = DriverManager.getConnection(this.host, this.userid, this.userpw);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//DB연결종료
	public void DBClose()
	{
		try 
		{
			//4.연결을 닫는다.
			conn.close();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	//Insert,Update,Delete 구문 실행
	public boolean RunCommand(String sql)
	{
		System.out.println(sql);
		try
		{
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	//Select 구문 실행
	public boolean RunQuery(String sql)
	{
		System.out.println(sql);
		try 
		{
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//다음 데이터가 있는지 판단
	public boolean GetNext()
	{
		try 
		{
			return rs.next();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return false;
		}	
	}
	
	//데이터를 가져온다.
	public String GetString(String colname)
	{
		try
		{
			return rs.getString(colname);
		}catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
	public int GetInt(String colname)
	{
		try
		{
			return rs.getInt(colname);
		}catch(SQLException e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	
	
	//작은 따옴표 변환(SQL인젝션 대응방안)
	public String _R(String value)
	{
		return value.replace("'", "''");
	}
	
	//
	public Array GetArray(String colname)
	{
		try
		{
			return rs.getArray(colname); 
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}	
	}
	
	public Object GetObject(String colname)
	{
		try
		{
			return rs.getObject(colname); 
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}	
	}
	
}
