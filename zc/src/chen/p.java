package chen;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.eclipse.jdt.internal.compiler.lookup.VariableBinding;

import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
public class p {
	   //智能匹配模版发送接口的http地址
 private static String URI_SEND_SMS = "https://sms.yunpian.com/v2/sms/single_send.json";
 //编码格式。发送编码格式统一用UTF-8
 private static String ENCODING = "UTF-8";
 public static  String main(String f , String boo) throws IOException, URISyntaxException {
	 
     //修改为您的apikey.apikey可在官网（http://www.yuanpian.com)登录后获取
     String apikey = "842e2141fe090b94e33b0b0d5fc5d2d1";
     //修改为您要发送的手机号
//     String m=p.code();
     int n=Integer.parseInt(boo);
//     13622360785
     String mobile = URLEncoder.encode(f,ENCODING);   
     String text = "【前海运通众测平台】您的验证码是"+n+"请妥善保管，切勿泄露给他人。(十分钟内有效)";
     //发短信调用示例
     return p.sendSms(apikey, text, mobile);
 }
// 生成随机数
 public static String code() {
	 int max=10;
	 String num="";
     Random random = new Random();
     for(int i=0; i<6;i++){
    	 int s = random.nextInt(max);
    	 num+=s;
     }
     return num;
}


 public static   String sendSms(String apikey, String text, String mobile) throws IOException {
     Map<String, String> params = new HashMap<String, String>();
     params.put("apikey", apikey);
     params.put("text", text);
     params.put("mobile", mobile);
     return post(URI_SEND_SMS, params);
 }

 public static  String post(String url, Map<String, String> paramsMap) {
     CloseableHttpClient client = HttpClients.createDefault();
     String responseText = "";
     CloseableHttpResponse response = null;
     try {
         HttpPost method = new HttpPost(url);
         if (paramsMap != null) {
             List<NameValuePair> paramList = new ArrayList<NameValuePair>();
             for (Map.Entry<String, String> param : paramsMap.entrySet()) {
                 NameValuePair pair = new BasicNameValuePair(param.getKey(), param.getValue());
                 paramList.add(pair);
             }
             method.setEntity(new UrlEncodedFormEntity(paramList, ENCODING));
         }
         response = client.execute(method);
         HttpEntity entity = response.getEntity();
         if (entity != null) {
             responseText = EntityUtils.toString(entity);
         }
     } catch (Exception e) {
         e.printStackTrace();
     } finally {
         try {
             response.close();
         } catch (Exception e) {
             e.printStackTrace();
         }
     }
     return responseText;
 }
}
