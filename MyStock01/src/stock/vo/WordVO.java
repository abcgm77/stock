package stock.vo;

import java.sql.Array;

public class WordVO {
	private int newsID; //기사일련번호
	private int wordID; //단어일련번호
	private Object words;  //단어리스트
	
	//getter
	public int      getNewsID() { return newsID;	}
	public int      getWordID() { return wordID;	}
	public Object getWords()  { return words;     }
	
	//setter
	public void setNewsID(int newsID)    { this.newsID = newsID; }
	public void setWordID(int wordID)    { this.wordID = wordID; }
	public void setWords(Object words)   { this.words  = words;  }
		
}
