package stock.vo;

public class newslistVO
{
	private String stockCode; //�����ڵ�
	private int newID;        //����Ϸù�ȣ
	private String url;       //url
	private String title;     //����
	private String content;   //����
	private String date;      //�ۼ���
	private String etype;     //�����Ÿ��
	private double score;     //���������
	
	//getter
	public String getStockCode() { return stockCode; }
	public int    getNewID()     { return newID;     }
	public String getUrl()       { return url;       }
	public String getTitle()     { return title;     }
	public String getContent()   { return content;   }
	public String getDate()      { return date;      }
	public String getEtype()     { return etype;     }
	public double getScore()     { return score;     }
	//setter
	public void setStockCode(String stockCode) { this.stockCode = stockCode; }
	public void setNewID(int newID)            { this.newID = newID;         }
	public void setUrl(String url)             { this.url = url;             }
	public void setTitle(String title)         { this.title = title;         }
	public void setContent(String content)     { this.content = content;     }
	public void setDate(String date)           { this.date = date;           }
	public void setEtype(String etype)         { this.etype = etype;         }
	public void setScore(double score)         { this.score = score;}
	
	
}
