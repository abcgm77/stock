package stock.vo;

public class newslistVO
{
	private String stockCode; //종목코드
	private int newID;        //기사일련번호
	private String url;       //url
	private String title;     //제목
	private String content;   //본문
	private String date;      //작성일
	private String etype;     //긍부정타입
	private double score;     //긍부정점수
	
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
