package pms.a01_mvc.a02_service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import pms.a02_vo.Mail;

@Service
public class MailService {
	// 컨테이너에 있는  객체 호출.
	@Autowired
	private JavaMailSender sender;	
	public String sendMail(Mail email) {
		String msg = "메일 발송 성공";
		// 1. 멀티미디어형 메일 데이터 전송.
		MimeMessage mmsg = sender.createMimeMessage();
		// 2. 제목 설정.
		try {
			// mmsg.setXXXX(전달할 정보) :  기타 정보에 대한 할당 처리..
			mmsg.setSubject(email.getTitle());
			// 3. 수신자 설정.
			mmsg.setRecipient(RecipientType.TO, new InternetAddress(email.getReciever()));
			// 4. 내용 설정.
			//    ex) 계정 비밀번호 입력 처리..
			mmsg.setText(email.getContent());
			System.out.println("#메일발송2");
			// 5. 발송 처리.
			sender.send(mmsg);
			System.out.println("#메일발송3");
					
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			msg="메일 발송 에러:"+e.getMessage();
			System.out.println("에러1"+msg);
		} catch (Exception e) {
			msg = "일반 에러 발생:"+e.getMessage();
			System.out.println("에러2"+msg);
		}
		
		return msg;
	}
}
