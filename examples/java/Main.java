import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

public class Main {
	public static void main( String[] args ) {
		try {
      // Lamp ID and color/period parameters
			String lampId = "my-test-lamp";
			String urlParameters = "color=#FFFFFF&period=500";

      // Send POST request to CILamp API
      String url = "https://api.cilamp.se/v1/"+ lampId +"/";
			System.out.println("\nSending 'POST' request to URL : " + url);
			System.out.println("Post parameters : " + urlParameters);
			URL obj = new URL(url);
			HttpsURLConnection connection = (HttpsURLConnection) obj.openConnection();
			connection.setRequestMethod("POST");
			connection.setDoOutput(true);
      connection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
      connection.connect();
			DataOutputStream wr = new DataOutputStream(connection.getOutputStream());
			wr.writeBytes(urlParameters);
			wr.flush();
			wr.close();

			int responseCode = connection.getResponseCode();
			System.out.println("Response Code : " + responseCode);

			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			System.out.println(response.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
}
	
