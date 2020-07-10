package kook;
import java.sql.Timestamp;

public class FaqDTO {
		private int num;
		private String question;
		private String answer;
		private int readcount;
		private Timestamp reg;
	
		
		public void setNum(int num)
		{
			this.num = num;
		}
		public int getNum()
		{
			return num;
		}	
		public void setQuestion(String question)
		{
			this.question = question;
		}
		public String getQuestion()
		{
			return question;
		}
		public void setAnswer(String answer)
		{
			this.answer = answer;
		}
		public String getAnswer() 
		{
			return answer;	
		}
		public void setReadcount(int readcount)
		{
			this.readcount = readcount;
		}
		public int getReadcount()
		{
			return readcount;
		}
		public void setReg(Timestamp reg)
		{
			this.reg = reg;
		}
		public Timestamp getReg()
		{
			return reg;
		}
}
