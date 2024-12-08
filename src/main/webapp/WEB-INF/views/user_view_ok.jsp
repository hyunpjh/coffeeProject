<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.coffeeproject.domain.Coffee" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    // 이메일, 주소, 우편번호 받기
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    String postcode = request.getParameter("zipcode");

    // 커피 이름과 수량을 배열로 받기
    String[] coffeeNames = request.getParameterValues("coffee_names[]");
    String[] coffeeQuantities = request.getParameterValues("coffee_quantities[]");

    // 받은 데이터 출력
    System.out.println("이메일: " + email);
    System.out.println("주소: " + address);
    System.out.println("우편번호: " + postcode);

    // 커피 정보 출력
    /*if (coffeeNames != null && coffeeQuantities != null) {
        for (int i = 0; i < coffeeNames.length; i++) {
            System.out.println("커피 이름: " + coffeeNames[i] + ", 수량: " + coffeeQuantities[i]);
        }
    } else {
        System.out.println("장바구니가 비었습니다.");
    }*/


    // 결제 처리 여부를 체크
    if (email != null && !email.isEmpty() && address != null && !address.isEmpty() && postcode != null && !postcode.isEmpty()
            && coffeeNames != null && coffeeQuantities != null) {
        // 모든 값이 유효하면 결제 성공
        out.println("<script>");
        out.println("alert('결제가 성공적으로 완료되었습니다.');");
        out.println("window.location.href='user_view.do';");
        out.println("</script>");
    } else {
        // 값이 유효하지 않으면 결제 실패
        out.println("<script>");
        out.println("alert('오류. 다시 시도해주세요.');");
        out.println("window.location.href='user_view.do';");
        out.println("</script>");
    }

%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 확인</title>
</head>
<body>
user_view_ok.jsp
</body>
</html>