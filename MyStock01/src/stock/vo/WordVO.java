package stock.vo;

import java.sql.Array;

public class WordVO {
	private int newsID; //����Ϸù�ȣ
	private int wordID; //�ܾ��Ϸù�ȣ
	private Object words;  //�ܾ��Ʈ
	
	//getter
	public int      getNewsID() { return newsID;	}
	public int      getWordID() { return wordID;	}
	public Object getWords()  { return words;     }
	
	//setter
	public void setNewsID(int newsID)    { this.newsID = newsID; }
	public void setWordID(int wordID)    { this.wordID = wordID; }
	public void setWords(Object words)   { this.words  = words;  }
		
}
