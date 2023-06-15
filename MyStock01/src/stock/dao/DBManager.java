package stock.dao;
import java.sql.Array;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBManager 
{

	private String host;   //DB ��������
	private String userid; //DB �����
	private String userpw; //DB ��ȣ
	
	private Connection conn = null; //DB���ᰴü
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

	//DB����
	//���� �� : true=����,false=����
	public boolean DBOpen()
	{
		try
		{
			//1. jdbc ���̺귯�� �ε�
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//2. �����ͺ��̽��� �����Ѵ�.
			conn = DriverManager.getConnection(this.host, this.userid, this.userpw);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//DB��������
	public void DBClose()
	{
		try 
		{
			//4.������ �ݴ´�.
			conn.close();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	//Insert,Update,Delete ���� ����
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
	
	//Select ���� ����
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
	
	//���� �����Ͱ� �ִ��� �Ǵ�
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
	
	//�����͸� �����´�.
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
	
	
	//���� ����ǥ ��ȯ(SQL������ �������)
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
