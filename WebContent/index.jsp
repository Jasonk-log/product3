<%@ page import = "common.CallService" %>
<%@ page import = "org.json.simple.JSONArray" %>
<%@ page import = "org.json.simple.JSONObject" %>
<%@ page import = "org.json.simple.parser.JSONParser" %>
<%@ page import = "org.json.simple.parser.ParseException" %>
<%
	//String product3 = null;

	CallService cs = new CallService();
	String part1 = cs.getJSON("http://part1:8080/part1.jsp");
	String part3 = cs.getJSON("http://part3:8080/part3.jsp");

	JSONParser parser = new JSONParser();
	Object obj1 = parser.parse(part1);
	Object obj3 = parser.parse(part3);
	
	JSONObject jsonObj1 = (JSONObject) obj1;
	String nm_part1 = (String) jsonObj1.get("name");
	String up_part1_tmp = (String) jsonObj1.get("unitprice");
	Long up_part1 = Long.parseLong(up_part1_tmp);
	
	JSONObject jsonObj3 = (JSONObject) obj3;
	String nm_part3 = (String) jsonObj3.get("name");
	String up_part3_tmp = (String) jsonObj3.get("unitprice");
	Long up_part3 = Long.parseLong(up_part3_tmp);
	
	Integer quantity = 10;
	Long tuprice = up_part1 + up_part3;
	Integer expense = 20;
	Long price = tuprice + expense;	
	
	JSONObject product3 = new JSONObject();
	product3.put("name", "product3");
	product3.put("quantity", quantity);
	product3.put("unitprice", tuprice);
	product3.put("expense", expense);
	product3.put("price", price);
				
	out.print(product3.toString());
	
%>
