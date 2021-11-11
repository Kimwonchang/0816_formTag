<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 
	 myinfoOK.jsp 입니다.<br>

<%
//	form에 입력된 한글 데이터가 post 방식으로 전송될 때 깨지는 현상을 방지한다.
//	한글 깨짐을 방지하려면 최초의 request.getParameter()메소드가 실행되기 전(맨처음)에 아래 내용을 코딩하면 된다.
	request.setCharacterEncoding("UTF-8");

//	get 방식도 한글이 깨졌었었다. => tomcat server 7.0 부터 한글을 사용할 때 한글이 깨지지 않고 처리된다.
//	get 방식에서 한글이 깨지면 서버 환경 선절에서 한글이 꺠지지 않도록 설정해야 한다. => server.xml 파일을 수정해야한다.
//  Server 폴더의 server.xml 파일을 열고 Connector 태그에 URIEncoding="UTF-8" 속성을 추가하면 get 방식에서도 한글이 깨지지 않는다.

// 	request.getParameter() 메소드로 이전 페이지에서 submit 버튼이 클릭되면 넘어오는 데이터를 받는다. => 무조건 문자열로 받는다.
	String name = request.getParameter("name");
	out.println(name + "님 안녕하세요<br>");
	String ID = request.getParameter("ID");
	out.println(name + "님의 아이디는 " + ID + "입니다.<br>");
	String password = request.getParameter("password");
	out.println(name + "님의 비밀번호는 " + password + "입니다.<br>");
	
	try {
	int age = Integer.parseInt(request.getParameter("age"));
	out.println(name + "님은" + age + "살 입니다.<br> ");
	out.println(name + "님은 내년 에는 " + (age + 1) + "살 입니다.<br> ");
		
	} catch(NumberFormatException e) {
//		out.println("잘못된 나이가 입력되었습니다<br>");
		out.println("<script>");
		out.println("alert('잘못된 나이가 입력되었습니다. ')");
		out.println("</script>");	
	}
	
	boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
	out.println(name + "님의 성별은" + (gender ? "남자" : "여자") + "입니다.<br>");
	
//	checkbox는 여러항목을 선택할 수 있는데 아래와 같이 getParameter() 메소드를 이용해서 받으면 맨 처음에 선택한 값 1개만 받을 수 있다.
//	String hobbies = request.getParameter("hobbies");
//	out.println(name + "님의 취미는" + hobbies + "입니다<br>");
	
//	checkbox에서 넘어오는 데이터를 받을 때 넘어오는 항목이 여러개일 수 있기 때문에 getParameterValues()메소드로 받아서 배열에 저장해
//	처리해야 한다.
	String[] hobbies = request.getParameterValues("hobbies");
	out.println(name + "님의 취미는 ");
	try {
		for (int i = 0; i< hobbies.length; i++) {
			out.println(hobbies[i] + " ");
		}
	} catch (NullPointerException e) {
			out.println("없어요... 저는 .. . 아무것도 안해여<br>");
	}
	out.println("입니다.<br> ");
	
	String trip = request.getParameter("trip");
	out.println(name +"님이 가고싶은 여행지는" + trip + "입니다.<br>");
	
	String[] travel = request.getParameterValues("travel");
	out.println(name + "님이 가고싶은 여행지 목록은");
	try {
		for (int i =0; i<travel.length; i++) {
			out.println(travel[i] + " ");
		}
		out.println("입니다.<br>");
	} catch (NullPointerException e) {
		out.println("없습니다..");
	}
	
	String content = request.getParameter("content");
//	태그 사용가능, 줄바꿈 불가능
//	out.println(name + "님이 남긴글" + content + "<br>" );
//	태그 사용 불가능, 줄바꿈 불가능
//	out.println(name + "님이 남긴글" + content.replace("<", "&lt;").replace(">", "&gt;") + "<br>" );
//	태그 사용 가능, 줄바꿈 가능
//	out.println(name + "님이 남긴글" + content.replace("\r\n", "<br>")+ "<br>" );
//	태그 사용 불가능, 줄바꿈 가능
//  반드시 replace("<", "&lt;").replace(">","&gt;") 보다 replace("\r\n", "<br>")를 뒤에 써야한다.
	out.println(name + "님이 남긴글" + content.replace("<", "&le;").replace(">", "&gt;").replace("\r\n", "<br>")+ "<br>" );

	
%>
<br/>	 
</body>
</html>
