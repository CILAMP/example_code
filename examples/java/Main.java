import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

public class Main {
    public static void main(String[] args) {
        try {
            // System ID and color/period parameters
            String systemId = "my-test-system";
            String urlParameters = "color=#FFFFFF&period=500"; // Color and period
            //String urlParameters = "color=#00FF00"; // Only color

            // Send POST request to CILamp API
            String url = "https://api.cilamp.se/v1/" + systemId + "/";
            System.out.println("Sending 'POST' request to URL: " + url);
            System.out.println("Post parameters: " + urlParameters);
            URL obj = new URL(url);
            HttpsURLConnection connection = (HttpsURLConnection) obj.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.connect();
            DataOutputStream wr = new DataOutputStream(connection.getOutputStream());
            wr.writeBytes(urlParameters);
            wr.flush();
            wr.close();

            // Read response code and string
            int responseCode = connection.getResponseCode();
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in .readLine()) != null) {
                response.append(inputLine);
            } in .close();

            // Print result
            System.out.println("Response code: " + responseCode);
            System.out.println("Response string: " + response.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
