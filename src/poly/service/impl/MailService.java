package poly.service.impl;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.MailDTO;
import poly.service.IMailService;
import poly.util.CmmUtil;

@Service("MailService") // 컨트롤러에서 찾을 이름
public class MailService implements IMailService {

   // 로그 파일 생성 및 로그 출력을 위한 log4h 프레임워크의 자바 객체
   private Logger log = Logger.getLogger(this.getClass());

   final String host = "smtp.naver.com";
   final String user = "ji_yeun15";
   final String password = "jiyoun023";

   @Override
   public int doSendMail(MailDTO pDTO) {

      // 로그 찍기
      log.info(this.getClass().getName() + ".doSendMail start!");
      log.info("아이디 : "+user);
      log.info("비밀번호 : "+password);

      // 메일 발송 성공여부 확인
      int res = 1;

      // 전달 받은 DTO로부터 데이터 받기
      if (pDTO == null) {
         pDTO = new MailDTO();
      }

      String toMail = CmmUtil.nvl(pDTO.getToMail()); // 받는사람

      Properties props = new Properties();
      props.put("mail.smtp.host", host); // javax 외부 라이브러리에 메일 보내는 사람의 정보 설정
      props.put("mail.smtp.auth", "true"); // javax 외부 라이브러리에 메일 보내는 사람 인증 여부 설정

      // 네이버 SMTP서버 인증 처리 로직
      Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(user, password);
         }
      });

      try {
         MimeMessage message = new MimeMessage(session);
         message.setFrom(new InternetAddress(user));
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail));

         // 메일 제목
         message.setSubject(CmmUtil.nvl(pDTO.getTitle()));

         // 메일 내용
         message.setText(CmmUtil.nvl(pDTO.getContents()));

         // 메일 발송
         Transport.send(message);

      } catch (MessagingException e) {
         res = 0; // 메일 발송이 실패해기 때문에 0으로 변경
         log.info("[ERROR]" + this.getClass().getName() + ".doSendMail : " + e);
      } catch (Exception e) {
         res = 0;
         log.info("[ERROR]" + this.getClass().getName() + ".doSendMail : " + e);
      }

      // 로그 찍기
      log.info(this.getClass().getName() + ".doSendMail end!");
      return res;
   }

}