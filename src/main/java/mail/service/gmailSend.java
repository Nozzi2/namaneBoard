package mail.service;


public class gmailSend {
	public static void main(String[] args) {
		MailSend mailSend = new MailSend();
		mailSend.setEmailAddr("zdsa43@gmail.com");
		mailSend.setCode("1234");
		mailSend.send();
	}

}