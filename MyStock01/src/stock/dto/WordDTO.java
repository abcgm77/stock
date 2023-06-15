package stock.dto;

import java.util.ArrayList;

import stock.dao.DBManager;
import stock.vo.WordVO;

public class WordDTO extends DBManager
{
	//형태소 배열 불러오기
	public String[] GetWordList(String etype, String code)
	{
		//타입별로 해당 코드의 전날 기사만 불러오기
		//불러온 해당기사의 일련번호로 wordlist에서 단어배열 불러오기
		ArrayList<WordVO> list = new ArrayList<WordVO>();
		
		this.DBOpen();
		
		String sql = "select w.words from wordlist w join newslist n on w.newsID = n.newsID ";
		sql += "where date(n.date) = date(now() - interval 1 day) and n.stockcode = '" + code + "' ";
		sql += "and etype = '" + etype + "'";

		
		this.RunQuery(sql);
		while( this.GetNext() == true)
		{
			WordVO vo = new WordVO();
			vo.setWords(GetObject("w.words"));
			list.add(vo);
		}
		
		this.DBClose();
		
		String sum_value = "";
		for(WordVO vo : list)
		{
			Object obj = vo.getWords();
			
			String value = (String)obj; // String으로 받아옴
			sum_value += value;
			sum_value += ",";
		}
		
		//String new_value = sum_value.replaceAll("[\\[\\]\"\\s]+", "");
		String new_value = sum_value.replaceAll("[\\[\\]\\s]+", "");
		String[] new_array = new_value.split(",");
				
		return new_array;
	}
}
