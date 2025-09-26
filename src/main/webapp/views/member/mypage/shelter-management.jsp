<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>보호소 관리</title>
</head>
<body>
  <main>
    <div>
      <aside>
        <ul>
          <li><a href="dashboard.jsp">한눈에 보기</a></li>
          <li><a href="notification-list.jsp">알림 <span>12</span></a></li>
          <li><a href="adopt-list.jsp">입양 신청 내역</a></li>
          <li><a href="volunteer-list.jsp">봉사 신청 내역</a></li>
          <li><a href="donation-history.jsp">후원 내역</a></li>
          <li><a href="follow-animals.jsp">팔로우 관리</a></li>
          <li>
            <a href="shelter-management.jsp">보호소 관리</a>
            <ul>
              <li><a href="shelter-notice-create.jsp">공지사항 등록</a></li>
              <li><a href="shelter-timeline-create.jsp">타임라인 작성</a></li>
              <li><a href="shelter-diary-create.jsp">보호일지 작성</a></li>
              <li><a href="shelter-volunteer-schedule.jsp">봉사일정 등록</a></li>
            </ul>
          </li>
          <li><a href="inquiry-list.jsp">1:1 문의</a></li>
          <li><a href="#">설정</a></li>
        </ul>
      </aside>

      <section>
        <h1>보호소 관리</h1>

    <div>
      <div>
        <input placeholder="보호소 이름 검색" />
        <button>검색</button>
      </div>
      <a href="shelter-registration.jsp">보호소 등록</a>
    </div>

    <div>
      <div>
        <div>
          <div>
            <img src="shelter1.jpg" alt="해피동물보호소 로고">
          </div>
          <div>
            <h3>해피동물보호소</h3>
            <p>서울시 강남구 역삼동 123-45</p>
            <p>02-1234-5678</p>
            <div>
              <span>입양 공고 12개</span>
              <span>봉사 일정 5개</span>
              <span>등록일: 2023.01.15</span>
            </div>
          </div>
        </div>
        <div>
          <a href="shelter-detail.html?id=1">상세보기</a>
          <a href="shelter-edit.html?id=1">수정</a>
          <button>삭제</button>
        </div>
      </div>

      <div>
        <div>
          <div>
            <img src="shelter2.jpg" alt="사랑동물보호소 로고">
          </div>
          <div>
            <h3>사랑동물보호소</h3>
            <p>서울시 서초구 서초동 456-78</p>
            <p>02-2345-6789</p>
            <div>
              <span>입양 공고 8개</span>
              <span>봉사 일정 3개</span>
              <span>등록일: 2023.03.20</span>
            </div>
          </div>
        </div>
        <div>
          <a href="shelter-detail.html?id=2">상세보기</a>
          <a href="shelter-edit.html?id=2">수정</a>
          <button>삭제</button>
        </div>
      </div>

      <div>
        <div>
          <div>
            <img src="shelter3.jpg" alt="포근한보호소 로고">
          </div>
          <div>
            <h3>포근한보호소</h3>
            <p>서울시 마포구 홍대입구역 근처</p>
            <p>02-3456-7890</p>
            <div>
              <span>입양 공고 15개</span>
              <span>봉사 일정 7개</span>
              <span>등록일: 2023.05.10</span>
            </div>
          </div>
        </div>
        <div>
          <a href="shelter-detail.html?id=3">상세보기</a>
          <a href="shelter-edit.html?id=3">수정</a>
          <button>삭제</button>
        </div>
      </div>
    </div>

    <div>
      <p>등록된 보호소가 없습니다.</p>
      <a href="shelter-registration.jsp">보호소 등록하기</a>
    </div>

        <div>
          <button>더보기</button>
        </div>
      </section>
    </div>
  </main>
</body>
</html>

