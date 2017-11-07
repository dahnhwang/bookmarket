package util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class NaverApi {

	private static String clientId = "gI6kVX6iQIwugQqKWFRz";
	private static String clientSecret = "39waYl4FGS";

	public List<HashMap<String, Object>> getJson(String isbn) {

		List<HashMap<String, Object>> items = null;

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

			Map<String, Object> map = new HashMap<String, Object>();
			ObjectMapper mapper = new ObjectMapper();
			map = mapper.readValue(response.toString(), new TypeReference<HashMap<String, Object>>() {
			});
			items = (ArrayList<HashMap<String, Object>>) map.get("items");

		} catch (Exception e) {
			System.out.println(e);
		}

		return items;

	}

}
