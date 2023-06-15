package stock.dto;

import java.util.ArrayList;

import stock.dao.DBManager;
import stock.vo.WordVO;

public class WordDTO extends DBManager
{
	//���¼� �迭 �ҷ�����
	public String[] GetWordList(String etype, String code)
	{
		//Ÿ�Ժ��� �ش� �ڵ��� ���� ��縸 �ҷ�����
		//�ҷ��� �ش����� �Ϸù�ȣ�� wordlist���� �ܾ�迭 �ҷ�����
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
			
			String value = (String)obj; // String���� �޾ƿ�
			sum_value += value;
			sum_value += ",";
		}
		
		//String new_value = sum_value.replaceAll("[\\[\\]\"\\s]+", "");
		String new_value = sum_value.replaceAll("[\\[\\]\\s]+", "");
		String[] new_array = new_value.split(",");
				
		return new_array;
	}
}
