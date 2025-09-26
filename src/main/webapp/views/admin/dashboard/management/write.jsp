<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 제재 등록</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #F9F9F9;
            color: #3C2A21;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background-color: #FFF8EA;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #3C2A21;
            text-align: center;
            margin-bottom: 20px;
            font-size: 2.5rem;
            border-bottom: 2px solid #8D7B68;
            padding-bottom: 10px;
        }

        .section {
            background-color: #FFFFFF;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 25px;
            border: 1px solid #F1DEC9;
        }

        h2 {
            color: #A4907C;
            border-bottom: 2px solid #F1DEC9;
            padding-bottom: 8px;
            margin-bottom: 20px;
        }

        .info-item, .form-group {
            margin-bottom: 15px;
        }

        .info-label, label {
            display: block;
            font-weight: bold;
            color: #666666;
            margin-bottom: 8px;
        }

        .info-value {
            color: #000000;
        }

        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #A4907C;
            border-radius: 8px;
            box-sizing: border-box;
            background-color: #F9F9F9;
            color: #000000;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }
        
        .radio-group label {
            display: inline-block;
            margin-right: 15px;
            font-weight: normal;
        }

        .button-group {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 25px;
        }

        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.2s;
        }

        .btn-primary {
            background-color: #8D7B68;
            color: #FFFFFF;
        }

        .btn-primary:hover {
            background-color: #A4907C;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background-color: #F1DEC9;
            color: #3C2A21;
        }

        .btn-secondary:hover {
            background-color: #E6D2B2;
            transform: translateY(-2px);
        }

        .tooltip {
            position: relative;
            display: inline-block;
            cursor: pointer;
            color: #8D7B68;
            margin-left: 5px;
        }

        .tooltip .tooltiptext {
            visibility: hidden;
            width: 200px;
            background-color: #3C2A21;
            color: #F9F9F9;
            text-align: center;
            border-radius: 6px;
            padding: 5px;
            position: absolute;
            z-index: 1;
            bottom: 125%;
            left: 50%;
            margin-left: -100px;
            opacity: 0;
            transition: opacity 0.3s;
        }

        .tooltip:hover .tooltiptext {
            visibility: visible;
            opacity: 1;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>회원 제재 등록</h1>
        
        <!-- JSP 태그를 사용하여 선택된 회원 정보를 표시합니다. -->
        <%
            // 상세 페이지에서 전달받았다고 가정하는 더미 데이터
            String userId = "user1234";
            String nickname = "펫사랑이";
        %>

        <div class="section">
            <h2>제재 대상 회원</h2>
            <div class="info-item">
                <span class="info-label">아이디</span>
                <span class="info-value"><%= userId %></span>
            </div>
            <div class="info-item">
                <span class="info-label">닉네임</span>
                <span class="info-value"><%= nickname %></span>
            </div>
        </div>

        <div class="section">
            <h2>제재 정보 입력</h2>
            <form action="#" method="post">
                <input type="hidden" name="userId" value="<%= userId %>">
                
                <div class="form-group">
                    <label for="sanctionType">제재 유형</label>
                    <select id="sanctionType" name="sanctionType" required>
                        <option value="">선택하세요</option>
                        <option value="게시글 제한">게시글 제한</option>
                        <option value="댓글 제한">댓글 제한</option>
                        <option value="계정 정지">계정 정지</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label>제재 기간</label>
                    <div class="radio-group">
                        <label><input type="radio" name="sanctionPeriod" value="1일" required> 1일</label>
                        <label><input type="radio" name="sanctionPeriod" value="3일"> 3일</label>
                        <label><input type="radio" name="sanctionPeriod" value="7일"> 7일</label>
                        <label><input type="radio" name="sanctionPeriod" value="14일"> 14일</label>
                        <label><input type="radio" name="sanctionPeriod" value="30일"> 30일</label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="sanctionReasonCategory">제재 사유</label>
                    <select id="sanctionReasonCategory" name="sanctionReasonCategory">
                        <option value="기타">기타</option>
                        <option value="욕설 및 비방">욕설 및 비방</option>
                        <option value="분란 조장">분란 조장</option>
                        <option value="광고/도배">광고/도배</option>
                        
                    </select>
                </div>

                <div class="form-group">
                    <label for="sanctionReason">제재 상세 사유 </label>
                    <textarea id="sanctionReason" name="sanctionReason" placeholder="구체적인 사유를 입력하세요."></textarea>
                </div>

                <div class="button-group">
                    <button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
                    <button type="submit" class="btn btn-primary">등록</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
