package org.zerock.user.service;

import java.util.HashMap;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.product.domain.OrderVO;
import org.zerock.product.domain.ProductVO;
import org.zerock.user.domain.Criteria;
import org.zerock.user.domain.UserVO;
import org.zerock.user.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
@AllArgsConstructor
@Log4j
public class UserServiceImpl implements UserService {
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;

	@Override
	public void register(UserVO user) {
		mapper.insert(user);
	}

	@Override
	public List<UserVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public boolean update(UserVO user) {
		return mapper.update(user) == 1;
	}

	@Override
	public boolean delete(int seq) {
		return mapper.delete(seq) > 0;
	}

	@Override
	public int idCheck(String user_id) {
		return mapper.idCheck(user_id);
	}

	@Override
	public UserVO getUser(String user_id) {
		return mapper.getUser(user_id);
	}

	@Override
	public int nickCheck(String user_nickname) {
		return mapper.nickCheck(user_nickname);
	}

	@Override
	public void gradeUpdate(UserVO user) {
		mapper.gradeUpdate(user);
	}

	@Override
	public void smsService(String user_phone, String cerNum) {
		String api_key = "NCS33JDKV3KUVIJW";
    String api_secret = "BRAV2PTBLGUH8RFPDC2KSYQZU9JJQPE3";
    Message coolsms = new Message(api_key, api_secret);

    // 4 params(to, from, type, text) are mandatory. must be filled
    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", user_phone);    // 수신전화번호
    params.put("from", "010-6463-1824");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
    params.put("type", "SMS");
    params.put("text", "인증번호는" + "["+cerNum+"]" + "입니다.");
    params.put("app_version", "test app 1.2"); // application name and version

    try {
      JSONObject obj = (JSONObject) coolsms.send(params);
      System.out.println(obj.toString());
    } catch (CoolsmsException e) {
      System.out.println(e.getMessage());
      System.out.println(e.getCode());
    }
	}
	
	@Override
	public void smsSubmit(String user_phone, String smsContent) { 
		String api_key = "NCS33JDKV3KUVIJW";
    String api_secret = "BRAV2PTBLGUH8RFPDC2KSYQZU9JJQPE3";
    Message coolsms = new Message(api_key, api_secret);
		
    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", user_phone);    // 수신전화번호
    params.put("from", "010-6463-1824");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
    params.put("type", "LMS");
    params.put("text", smsContent);
    params.put("app_version", "test app 1.2"); // application name and version

    try {
      JSONObject obj = (JSONObject) coolsms.send(params);
      System.out.println(obj.toString());
    } catch (CoolsmsException e) {
      System.out.println(e.getMessage());
      System.out.println(e.getCode());
    }
	}
	
	@Override
	public UserVO findUser(String user_phone) {
		return mapper.findUser(user_phone);
	}

	@Override
	public void userRemove(String user_id) {
		mapper.userRemove(user_id);
	}

	@Override
	public UserVO getUserSeq(int user_seq) {
		return mapper.getUserSeq(user_seq);
	}

	@Override
	public int modifyPw(UserVO user) {
		return mapper.modifyPw(user);
	}

	@Override
	public List<OrderVO> orderList(int order_userseq, Criteria cri) {
		return mapper.orderList(order_userseq, cri);
	}

	@Override
	public List<OrderVO> cartList(int order_userseq, Criteria cri) {
		return mapper.cartList(order_userseq, cri);
	}

	@Override
	public List<ProductVO> productList(String user_nickname, Criteria cri) {
		return mapper.productList(user_nickname, cri);
	}

	@Override
	public List<OrderVO> orderInfo(int order_productseq, Criteria cri) {
		return mapper.orderInfo(order_productseq, cri);
	}

	@Override
	public int getTotalOrderList(int order_userseq, Criteria cri) {
		return mapper.getTotalOrderList(order_userseq, cri);
	}
	
	@Override
	public int getTotalCartList(int order_userseq, Criteria cri) {
		return mapper.getTotalCartList(order_userseq, cri);
	}
	
	@Override
	public int getTotalProductList(String user_nickname, Criteria cri) {
		return mapper.getTotalProductList(user_nickname, cri);
	}

	@Override
	public int getTotalOrderInfoList(int order_productseq, Criteria cri) {
		return mapper.getTotalOrderInfoList(order_productseq, cri);
	}

	@Override
	public void productSend(int order_seq, Criteria cri) {
		mapper.productSend(order_seq, cri);
	}

	@Override
	public List<OrderVO> sendList(int order_productseq, Criteria cri) {
		return mapper.sendList(order_productseq, cri);
	}

	@Override
	public OrderVO getOrderInfo(int order_seq) {
		return mapper.getOrderInfo(order_seq);
	}

	@Override
	public ProductVO getProductInfo(int product_seq) {
		return mapper.getProductInfo(product_seq);
	}

	@Override
	public void orderDel(int order_seq) {
		mapper.orderDel(order_seq);
	}

	@Override
	public void deleteGoodCheck(int user_seq) {
		mapper.deleteGoodCheck(user_seq);
	}

	@Override
	public void deleteHateCheck(int user_seq) {
		mapper.deleteHateCheck(user_seq);
	}

}