package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;
import org.apache.commons.codec.digest.DigestUtils;

import entity.Park;
import entity.Reservation;
import entity.User;
import service.ParkService;
import service.ReserveService;

public class ReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReserveServlet() {
		super();
	}
	public void destroy() {
		super.destroy();
	}
	
	public String md5(String origin) {
		String hash = null;
		try {
			hash = DigestUtils.md5Hex(origin.getBytes("UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hash;
	}

	public String aes128_encrypt(String src, String key128) throws UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
		SecretKeySpec keySpec = new SecretKeySpec(key128.getBytes("UTF-8"),"AES");
		Cipher cphr = Cipher.getInstance("AES");
		cphr.init(Cipher.ENCRYPT_MODE, keySpec);
		byte[] encrypted = cphr.doFinal(src.getBytes("UTF-8"));
		return Hex.encodeHexString(encrypted);
	}
	
	public String aes128_decrypt(String src, String key128) throws UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException, DecoderException {
		SecretKeySpec keySpec = new SecretKeySpec(key128.getBytes("UTF-8"),"AES");
		Cipher cphr = Cipher.getInstance("AES");
		cphr.init(Cipher.DECRYPT_MODE, keySpec);
		byte[] original = cphr.doFinal(Hex.decodeHex(src));
		String oriStr = new String(original,"UTF-8");
		return oriStr;
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Park pk = new Park();
		if(request.getSession().getAttribute("park_selected")!=null){
			pk = (Park)request.getSession().getAttribute("park_selected");
		}
		User usr = new User();
		if(request.getSession().getAttribute("user_info")!=null){
			usr = (User)request.getSession().getAttribute("user_info");
		}
		String userKey = usr.getPassword().substring(0, 32);
		
		//同行人数量
		int member_num = Integer.parseInt(request.getParameter("member_num"));
		//预订日期
		int dateDiff = Integer.parseInt(request.getParameter("schedule_date"));
		
		ParkService pksvc = new ParkService();
		boolean checkNum = pksvc.parkReserved(pk.getPark_id(), member_num+1, dateDiff);
		if(checkNum == false) {
			response.sendRedirect("reserve.jsp?rsv_err=too_many_people");
			return;
		}
		
		//用户填写的手机号
		String tourist_phoneno = request.getParameter("tourist_phoneno");
		
		//入园时间
		String enterTime = " " + request.getParameter("schedule_time") + "时";
		
		//订单时间戳
		Date nowdate=new Date();
		SimpleDateFormat datef=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time_stamp = datef.format(nowdate);
		
		//入园日期
		Calendar calendar=new GregorianCalendar();
		calendar.setTime(nowdate);
		calendar.add(Calendar.DATE, dateDiff);
		SimpleDateFormat dateG=new SimpleDateFormat("yyyy-MM-dd");
		String enterDate = dateG.format(calendar.getTime());
		
		//入园日期和时间
		String schedule = enterDate + enterTime;
		
		for(int i=0;i<=member_num;i++) {
			Reservation r = new Reservation();
			ReserveService rssv = new ReserveService();
			int thisReserveID = rssv.getNextIdno();
			
			String id_cipher = null;
			try {
				id_cipher = aes128_encrypt(String.valueOf(thisReserveID), md5("HippoY315"));
			} catch (Exception e) {
				e.printStackTrace();
			}
			r.setId_cipher(id_cipher);
			
			r.setUser_phoneno(usr.getPhoneno());
			r.setPark_selected(pk.getPark_name());
			r.setReserve_id(thisReserveID);
			
			r.setMember_num(member_num);
			r.setTourist_phoneno(tourist_phoneno);
			r.setSchedule(schedule);
			
			boolean isHealthy = false;
			if(request.getParameter("is_healthy_"+i).equals("true")) isHealthy = true;
			r.setHealthy(isHealthy);
			if(isHealthy == false) {
				boolean declareCovidRiskResult = pksvc.declareCovidRisk(pk.getPark_id());
				if(! declareCovidRiskResult) System.out.println("▲ 出现疫情风险，写入数据库失败！");
				else System.out.println("▲ 出现疫情风险！已记录");
			}
			
			try {
				String name_cipher = aes128_encrypt(request.getParameter("tourist_name_"+i).toString(), userKey);
				r.setTourist_name(name_cipher);
				String idcard_cipher = aes128_encrypt(request.getParameter("tourist_idcard_"+i).toString(), userKey);
				r.setTourist_idcard(idcard_cipher);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			r.setWhere_from(request.getParameter("where_from_"+i).toString());
			r.setTime_stamp(time_stamp);
				
			r.setPayed(true); //TODO Payment
			
			rssv.newReservation(r);
		}
		
		response.sendRedirect("tickets.jsp");
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	public void init() throws ServletException {
		
	}

}
