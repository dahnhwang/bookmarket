package util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class WebPageParser {
	private static URL url;
	private static BufferedReader br;
	private static HttpURLConnection conn;
	private static String protocol = "GET";

	public int getBookGenre(String address) {
		// 특정 url을 받으면 해당 웹페이지의 특정 위치의 단어를 int 타입으로 가져옴
		int genre = 0;
		try {
			url = new URL(address);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod(protocol);

			br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

			String line;
			while ((line = br.readLine()) != null) {
				if (line.contains("<li><a href=\"/category/index.nhn?cate_code=") && !line.contains("r:2")) {
					int startNum = line.indexOf("_");
					String subStr = line.substring(startNum + 6, startNum + 9);
					genre = Integer.parseInt(subStr);
				}
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return genre;
	}

}
