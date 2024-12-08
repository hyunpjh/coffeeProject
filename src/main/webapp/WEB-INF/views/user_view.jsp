<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.coffeeproject.domain.Coffee" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    ArrayList<Coffee> coffees = (ArrayList<Coffee>) request.getAttribute("coffees");

    StringBuilder sbHtml = new StringBuilder();
    for (Coffee coffee : coffees) {
        int coffee_id = coffee.getCoffee_id();
        String coffee_name = coffee.getCoffee_name();
        int coffee_price = coffee.getCoffee_price();

        if (coffee_id == 5){
            sbHtml.append( "<li class=\"list-group-item d-flex mt-3\">" );
        } else {
            sbHtml.append( "<li class=\"list-group-item d-flex mt-2\">" );
        }
        sbHtml.append("<div class=\"col-2\"><img class=\"img-fluid\" src=\"https://i.imgur.com/HKOFQYa.jpeg\" alt=\"\"></div>");
        sbHtml.append("<div class=\"col\"><div class=\"row text-muted\">커피콩</div>");
        sbHtml.append("<div class=\"row\">"+ coffee_name +"</div>");
        sbHtml.append("</div>");

        sbHtml.append("<div class=\"col text-center price\">"+ coffee_price +"원</div>");

        // "추가" 버튼과 JavaScript 함수 연결
        sbHtml.append("<div class=\"col text-end action\">");
        sbHtml.append("<button class=\"btn btn-small btn-outline-dark\" onclick=\"addToCart('"+ coffee_name +"', "+ coffee_price +")\">추가</button>");
        sbHtml.append("</div>");

        sbHtml.append("</li>");

    }

%>
<!doctype html>
<html lang="ko">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <style>
        body {
            background: #ddd;
        }

        .card {
            margin: auto;
            max-width: 950px;
            width: 90%;
            box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border-radius: 1rem;
            border: transparent
        }

        .summary {
            background-color: #ddd;
            border-top-right-radius: 1rem;
            border-bottom-right-radius: 1rem;
            padding: 4vh;
            color: rgb(65, 65, 65)
        }

        @media (max-width: 767px) {
            .summary {
                border-top-right-radius: unset;
                border-bottom-left-radius: 1rem
            }
        }

        .row {
            margin: 0
        }

        .title b {
            font-size: 1.5rem
        }

        .col-2,
        .col {
            padding: 0 1vh
        }

        img {
            width: 3.5rem
        }

        hr {
            margin-top: 1.25rem
        }
        .products {
            width: 100%;
        }
        .products .price, .products .action {
            line-height: 38px;
        }
        .products .action {
            line-height: 38px;
        }

    </style>
    <title>Hello, world!</title>
    <script type="text/javascript">
        let cart = {}; // 장바구니 객체

        // 장바구니에 커피 추가하는 함수
        function addToCart(coffeeName, coffeePrice) {
            // 커피를 장바구니에 추가 (수량 증가)
            if (cart[coffeeName]) {
                cart[coffeeName].quantity++;
            } else {
                cart[coffeeName] = { quantity: 1, price: coffeePrice };
            }

            // 장바구니 출력 업데이트
            updateCartDisplay();
            updateTotalAmount();
            //console.log(cart);
        }

        // 장바구니 내용 업데이트 함수
        function updateCartDisplay() {
            let cartDisplay = document.getElementById("cartDisplay");
            cartDisplay.innerHTML = ""; // 기존 내용 지우기

            if (Object.keys(cart).length === 0) {
                cartDisplay.innerHTML = "<p>장바구니에 아무것도 없습니다.</p>";
            } else {
                for (let coffeeName in cart) {
                    let coffee = cart[coffeeName];
                    //console.log(coffee);
                    cartDisplay.innerHTML += '<div class="row"><h6 class="p-0">'+ coffeeName + '<span class="badge bg-dark">'+ coffee.quantity +'개</span></h6></div>';
                }
            }
            console.log(cart);
        }


        // 총 금액 업데이트 함수
        function updateTotalAmount() {
            let totalAmount = 0;
            for (let coffeeName in cart) {
                totalAmount += cart[coffeeName].quantity * cart[coffeeName].price;
            }
            document.getElementById("totalAmount").innerText = totalAmount + "원";

            // 폼에 total_price 추가
            let form = document.wfrm;  // 폼 참조

            // 기존에 있는 total_price input을 삭제
            form.querySelectorAll("input[name='total_price']").forEach(input => input.remove());

            // 새로운 total_price input 추가
            let totalPriceInput = document.createElement("input");
            totalPriceInput.type = "hidden";
            totalPriceInput.name = "total_price";  // 폼에 보낼 이름
            totalPriceInput.value = totalAmount;  // 계산된 총 금액
            form.appendChild(totalPriceInput);
        }

    </script>
</head>
<body class="container-fluid">
<div class="row justify-content-center m-4">
    <h1 class="text-center">Grids & Circle</h1>
</div>
<div class="card">
    <div class="row">
        <div class="col-md-8 mt-4 d-flex flex-column align-items-start p-3 pt-0">
            <h5 class="flex-grow-0"><b>상품 목록</b></h5>
            <ul class="list-group products">
                <!--<li class="list-group-item d-flex mt-3">
                    <div class="col-2"><img class="img-fluid" src="https://i.imgur.com/HKOFQYa.jpeg" alt=""></div>
                    <div class="col">
                        <div class="row text-muted">커피콩</div>
                        <div class="row">Columbia Nariñó</div>
                    </div>
                    <div class="col text-center price">5000원</div>
                    <div class="col text-end action"><a class="btn btn-small btn-outline-dark" href="">추가</a></div>
                </li>
                <li class="list-group-item d-flex mt-2">
                    <div class="col-2"><img class="img-fluid" src="https://i.imgur.com/HKOFQYa.jpeg" alt=""></div>
                    <div class="col">
                        <div class="row text-muted">커피콩</div>
                        <div class="row">Columbia Nariñó</div>
                    </div>
                    <div class="col text-center price">5000원</div>
                    <div class="col text-end action"><a class="btn btn-small btn-outline-dark" href="">추가</a></div>
                </li>
                <li class="list-group-item d-flex mt-2">
                    <div class="col-2"><img class="img-fluid" src="https://i.imgur.com/HKOFQYa.jpeg" alt=""></div>
                    <div class="col">
                        <div class="row text-muted">커피콩</div>
                        <div class="row">Columbia Nariñó</div>
                    </div>
                    <div class="col text-center price">5000원</div>
                    <div class="col text-end action"><a class="btn btn-small btn-outline-dark" href="">추가</a></div>
                </li>-->
                <%= sbHtml.toString() %>
            </ul>
        </div>
        <div class="col-md-4 summary p-4">
            <div>
                <h5 class="m-0 p-0"><b>Summary</b></h5>
            </div>
            <hr>
            <div id="cartDisplay">
                <p>장바구니가 비었습니다.</p>
            </div>
            <!--<div class="row">
                <h6 class="p-0">Columbia Nariñó <span class="badge bg-dark text-">2개</span></h6>
            </div>
            <div class="row">
                <h6 class="p-0">Brazil Serra Do Caparaó <span class="badge bg-dark">2개</span></h6>
            </div>
            <div class="row">
                <h6 class="p-0">Columbia Nariñó <span class="badge bg-dark">2개</span></h6>
            </div>-->
            <form action="/user_view_ok.do" method="post" name="wfrm" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="email" class="form-label">이메일</label>
                    <input type="email" name="email" class="form-control mb-1" id="email">
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">주소</label>
                    <input type="text" name="address" class="form-control mb-1" id="address">
                </div>
                <div class="mb-3">
                    <label for="postcode" class="form-label">우편번호</label>
                    <input type="text" name="zipcode" class="form-control" id="postcode">
                </div>
                <div>당일 오후 2시 이후의 주문은 다음날 배송을 시작합니다.</div>
            </form>
            <div class="row pt-2 pb-2 border-top">
                <h5 class="col">총금액</h5>
                <h5 class="col text-end" id="totalAmount">0원</h5>
            </div>
            <button class="btn btn-dark col-12" id="wbtn" type="submit">결제하기</button>
            <script>
                // 결제하기 버튼 클릭 시 폼 전송
                document.getElementById("wbtn").addEventListener("click", function(e) {
                    // 이메일, 주소, 우편번호 입력 값 가져오기
                    let email = document.getElementById("email").value;
                    let address = document.getElementById("address").value;
                    let postcode = document.getElementById("postcode").value;

                    // 필드 중 하나라도 비어 있으면 경고 메시지 출력하고 폼 제출 막기
                    if (!email || !address || !postcode) {
                        alert("이메일, 주소, 우편번호를 모두 입력해주세요.");
                        return false;
                    } else {
                        // 커피 목록과 수량을 hidden 필드로 추가하는 부분
                        let form = document.wfrm;

                        // 장바구니 내용 배열로 변환
                        let coffeeNames = [];
                        let coffeeQuantities = [];

                        // cart 객체가 비어 있는지 확인
                        if (Object.keys(cart).length === 0) {
                            alert("장바구니에 커피가 없습니다.");
                            return false;  // 커피가 없으면 폼을 제출하지 않음
                        }

                        for (let coffeeName in cart) {
                            coffeeNames.push(coffeeName);
                            coffeeQuantities.push(cart[coffeeName].quantity);
                        }

                        // 기존 hidden 필드를 삭제
                        form.querySelectorAll("input[name='coffee_names[]']").forEach(input => input.remove());
                        form.querySelectorAll("input[name='coffee_quantities[]']").forEach(input => input.remove());

                        // 커피 이름과 수량을 한 번에 추가
                        coffeeNames.forEach(function(name, index) {
                            let nameInput = document.createElement("input");
                            nameInput.type = "hidden";
                            nameInput.name = "coffee_names[]";  // 배열 형식으로 받기
                            nameInput.value = name;
                            form.appendChild(nameInput);

                            let quantityInput = document.createElement("input");
                            quantityInput.type = "hidden";
                            quantityInput.name = "coffee_quantities[]";  // 배열 형식으로 받기
                            quantityInput.value = coffeeQuantities[index];
                            form.appendChild(quantityInput);
                        });

                        // 총 금액 hidden 필드 추가
                        let totalPriceInput = document.createElement("input");
                        totalPriceInput.type = "hidden";
                        totalPriceInput.name = "total_price";  // 총 금액 필드 추가
                        totalPriceInput.value = totalAmount;
                        form.appendChild(totalPriceInput);

                        updateTotalAmount();

                        // 폼 제출
                        form.submit();
                    }
                });
            </script>
        </div>
    </div>
</div>
</body>
</html>