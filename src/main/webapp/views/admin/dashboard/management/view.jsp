<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 관리 상세 페이지</title>
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
            max-width: 900px;
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

        .info-group {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 15px;
        }

        .info-item {
            display: flex;
            flex-direction: column;
            padding: 10px;
            background-color: #F9F9F9;
            border-radius: 8px;
        }

        .info-label {
            font-weight: bold;
            color: #666666;
            margin-bottom: 5px;
            font-size: 0.9rem;
        }

        .info-value {
            color: #000000;
            word-break: break-word;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        .list-container {
            margin-top: 15px;
            background-color: #F9F9F9;
            border-radius: 8px;
            padding: 15px;
        }

        .list-item {
            border-bottom: 1px solid #F1DEC9;
            padding: 10px 0;
        }

        .list-item:last-child {
            border-bottom: none;
        }

        .no-data {
            color: #777777;
            font-style: italic;
        }

        a {
            color: #8D7B68;
            text-decoration: none;
        }
        
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>회원 관리 상세 페이지</h1>

        <!-- JSP 태그를 사용하여 데이터를 동적으로 표시할 수 있습니다. -->
        <!-- 예시를 위해 더미 데이터를 사용했습니다. -->
        <%
            String userId = "user1234";
            String nickname = "펫사랑이";
            String email = "user1234@example.com";
            String joinDate = "2023-01-15";
            String accountStatus = "활성";
            String authority = "일반";

            String petInfo = "이름: 보리 (말티즈), 나이: 3살";
            String bio = "안녕하세요, 반려동물 보리와 함께 행복한 하루하루를 보내는 집사입니다. 유기동물 보호소 봉사 활동에 관심이 많습니다.";

            String lastLogin = "2024-05-20 14:30:00";
            String lastIp = "192.168.0.1";
            String lastDevice = "Chrome (Windows)";
            int loginCount = 154;
            String profileLink = "/profile/user1234";
            int postCount = 25;
            int commentCount = 48;

            String[] postHistory = {"반려동물 사료 추천", "우리집 강아지 자랑", "유기동물 봉사활동 후기"};
            String[] commentHistory = {"좋은 정보 감사합니다!", "저도 같은 사료 먹이고 있어요.", "봉사활동 후기 잘 봤습니다."};
            String[] adoptionHistory = {"강아지 입양 신청 (2024-03-10)"};
            String[] volunteerHistory = {"봉사활동 신청 (2024-04-05)"};
            String[] donationHistory = {"유기동물 보호소 후원 (2024-02-28)"};
            String[] followHistory = {"user_a", "shelter_b", "admin_c"};

            String[] reportedHistory = {"욕설 사용 (2024-01-05)", "게시글 도배 (2024-03-12)"};
            String[] reportingHistory = {"광고성 댓글 신고 (2024-02-20)", "불쾌한 게시글 신고 (2024-04-18)"};

            int reportedCount = 2;
            String[] sanctionHistory = {"경고: 욕설 사용 (2024-01-05)", "게시글 삭제 및 경고: 게시글 도배 (2024-03-12)"};

            boolean isVerified = true;
            boolean isSocialLinked = true;
            boolean isShelterAccount = false;
        %>

        <!-- 계정 기본 정보 -->
        <div class="section">
            <h2>계정 기본 정보</h2>
            <div class="info-group">
                <div class="info-item">
                    <span class="info-label">아이디</span>
                    <span class="info-value"><%= userId %></span>
                </div>
                <div class="info-item">
                    <span class="info-label">닉네임</span>
                    <span class="info-value"><%= nickname %></span>
                </div>
                <div class="info-item">
                    <span class="info-label">이메일</span>
                    <span class="info-value"><%= email %></span>
                </div>
                <div class="info-item">
                    <span class="info-label">가입일</span>
                    <span class="info-value"><%= joinDate %></span>
                </div>
                <div class="info-item">
                    <span class="info-label">계정 상태</span>
                    <span class="info-value"><%= accountStatus %></span>
                </div>
                <div class="info-item">
                    <span class="info-label">권한</span>
                    <span class="info-value"><%= authority %></span>
                </div>
            </div>
        </div>

        <!-- 프로필 정보 -->
        <div class="section">
            <h2>프로필 정보</h2>
            <div class="info-group">
                <div class="info-item full-width">
                    <span class="info-label">반려동물 정보</span>
                    <span class="info-value"><%= petInfo %></span>
                </div>
                <div class="info-item full-width">
                    <span class="info-label">자기소개</span>
                    <span class="info-value"><%= bio %></span>
                </div>
            </div>
        </div>

        <!-- 활동 내역 -->
        <div class="section">
            <h2>활동 내역</h2>
            <div class="info-group">
                <div class="info-item">
                    <span class="info-label">최근 로그인 일시</span>
                    <span class="info-value"><%= lastLogin %></span>
                </div>
                <div class="info-item">
                    <span class="info-label">IP</span>
                    <span class="info-value"><%= lastIp %></span>
                </div>
                <div class="info-item">
                    <span class="info-label">디바이스</span>
                    <span class="info-value"><%= lastDevice %></span>
                </div>
                <div class="info-item">
                    <span class="info-label">로그인 횟수</span>
                    <span class="info-value"><%= loginCount %>회</span>
                </div>
                <div class="info-item">
                    <span class="info-label">작성 프로필</span>
                    <span class="info-value"><a href="<%= profileLink %>">프로필 보기</a></span>
                </div>
                <div class="info-item">
                    <span class="info-label">작성 글 수</span>
                    <span class="info-value"><%= postCount %>개</span>
                </div>
                <div class="info-item">
                    <span class="info-label">작성 댓글 수</span>
                    <span class="info-value"><%= commentCount %>개</span>
                </div>
                <div class="info-item full-width">
                    <span class="info-label">작성 글 내역</span>
                    <div class="list-container">
                        <% if (postHistory.length > 0) {
                            for (String post : postHistory) { %>
                                <div class="list-item"><%= post %></div>
                            <% }
                        } else { %>
                            <div class="no-data">작성된 글이 없습니다.</div>
                        <% } %>
                    </div>
                </div>
                <div class="info-item full-width">
                    <span class="info-label">작성 댓글 내역</span>
                    <div class="list-container">
                        <% if (commentHistory.length > 0) {
                            for (String comment : commentHistory) { %>
                                <div class="list-item"><%= comment %></div>
                            <% }
                        } else { %>
                            <div class="no-data">작성된 댓글이 없습니다.</div>
                        <% } %>
                    </div>
                </div>
                <div class="info-item full-width">
                    <span class="info-label">입양 신청 내역</span>
                    <div class="list-container">
                        <% if (adoptionHistory.length > 0) {
                            for (String item : adoptionHistory) { %>
                                <div class="list-item"><%= item %></div>
                            <% }
                        } else { %>
                            <div class="no-data">입양 신청 내역이 없습니다.</div>
                        <% } %>
                    </div>
                </div>
                <div class="info-item full-width">
                    <span class="info-label">봉사 신청 내역</span>
                    <div class="list-container">
                        <% if (volunteerHistory.length > 0) {
                            for (String item : volunteerHistory) { %>
                                <div class="list-item"><%= item %></div>
                            <% }
                        } else { %>
                            <div class="no-data">봉사 신청 내역이 없습니다.</div>
                        <% } %>
                    </div>
                </div>
                <div class="info-item full-width">
                    <span class="info-label">후원 내역</span>
                    <div class="list-container">
                        <% if (donationHistory.length > 0) {
                            for (String item : donationHistory) { %>
                                <div class="list-item"><%= item %></div>
                            <% }
                        } else { %>
                            <div class="no-data">후원 내역이 없습니다.</div>
                        <% } %>
                    </div>
                </div>
                <div class="info-item full-width">
                    <span class="info-label">팔로우 내역</span>
                    <div class="list-container">
                        <% if (followHistory.length > 0) {
                            for (String item : followHistory) { %>
                                <div class="list-item"><%= item %></div>
                            <% }
                        } else { %>
                            <div class="no-data">팔로우 내역이 없습니다.</div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <!-- 신고 내역 -->
        <div class="section">
            <h2>신고 내역</h2>
            <div class="info-group">
                <div class="info-item full-width">
                    <span class="info-label">신고한 내역</span>
                    <div class="list-container">
                        <% if (reportingHistory.length > 0) {
                            for (String item : reportingHistory) { %>
                                <div class="list-item"><%= item %></div>
                            <% }
                        } else { %>
                            <div class="no-data">신고한 내역이 없습니다.</div>
                        <% } %>
                    </div>
                </div>
                <div class="info-item full-width">
                    <span class="info-label">신고받은 내역</span>
                    <div class="list-container">
                        <% if (reportedHistory.length > 0) {
                            for (String item : reportedHistory) { %>
                                <div class="list-item"><%= item %></div>
                            <% }
                        } else { %>
                            <div class="no-data">신고받은 내역이 없습니다.</div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <!-- 제재 내역 -->
        <div class="section">
            <h2>제재 내역</h2>
            <div class="info-group">
                <div class="info-item">
                    <span class="info-label">신고된 횟수</span>
                    <span class="info-value"><%= reportedCount %>회</span>
                </div>
                <div class="info-item full-width">
                    <span class="info-label">제재 내역 목록</span>
                    <div class="list-container">
                        <% if (sanctionHistory.length > 0) {
                            for (String item : sanctionHistory) { %>
                                <div class="list-item"><%= item %></div>
                            <% }
                        } else { %>
                            <div class="no-data">제재 내역이 없습니다.</div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <!-- 인증 여부 -->
        <div class="section">
            <h2>인증 여부</h2>
            <div class="info-group">
                <div class="info-item">
                    <span class="info-label">본인 인증 여부</span>
                    <span class="info-value"><%= isVerified ? "인증됨" : "미인증" %></span>
                </div>
                <div class="info-item">
                    <span class="info-label">소셜 로그인 연동 여부</span>
                    <span class="info-value"><%= isSocialLinked ? "연동됨" : "미연동" %></span>
                </div>
                <div class="info-item">
                    <span class="info-label">보호소 연동 계정 여부</span>
                    <span class="info-value"><%= isShelterAccount ? "연동됨" : "미연동" %></span>
                </div>
            </div>
        </div>

    </div>

</body>
</html>
