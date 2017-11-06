package util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class NaverApi {

	private static String clientId = "gI6kVX6iQIwugQqKWFRz";
	private static String clientSecret = "39waYl4FGS";

	public Map<String, Object> getJson(String isbn) {
		Map<String, Object> item = null;

		// 네이버API에 isbn에 대한 데이터 요청을 보내고 응답을 파싱해서 결과를 리턴해주는 메소드
		try {
			String apiURL = "https://openapi.naver.com/v1/search/book?query=" + isbn; // json 결과
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			// json에서 파싱하기!
			
			item = new HashMap<String, Object>();
			ObjectMapper mapper = new ObjectMapper(); // Json Parser
			mapper.readValue(response.toString(), new TypeReference<HashMap<String, String>>() {
			});
			item = (Map<String, Object>)item.get("items");
			System.out.println(item);
//			
//			System.out.println(response.toString());
			// response <- 요놈아가 내가 받을 api데이터임
			// 여기서 map으로 얻어진 items는 어레이리스트로 자동으로 변환되어서 옴
			// 따라서 arrayList에 넣어줘야 함~~

		} catch (Exception e) {
			System.out.println(e);
		}

		return item;

	}

}
