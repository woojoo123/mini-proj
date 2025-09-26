<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<footer
  class="w-full py-16 px-4 sm:px-6 lg:px-8 relative bg-foreground text-background"
>
  <div
    class="absolute inset-0 opacity-5"
    style="
      background-image: url('data:image/svg+xml,%3Csvg width=\'60\' height=\'60\' viewBox=\'0 0 60 60\' xmlns=\'http://www.w3.org/2000/svg\'%3E%3Cg fill=\'none\' fill-rule=\'evenodd\'%3E%3Cg fill=\'%23A4907C\' fill-opacity=\'0.3\'%3E%3Ccircle cx=\'7\' cy=\'7\' r=\'1\'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E');
    "
  ></div>
  <div class="max-w-7xl mx-auto relative">
    <div class="grid grid-cols-1 md:grid-cols-4 gap-12">
      <div class="md:col-span-2">
        <div class="flex items-center gap-4 mb-6">
          <div
            class="w-12 h-12 rounded-full flex items-center justify-center bg-primary/20 border-2 border-primary/30"
          >
            <div class="lucide lucide-heart h-6 w-6 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
          </div>
          <div>
            <h3 class="text-2xl text-background">동반자</h3>
            <p class="text-sm text-muted-foreground">
              유기견 보호소 통합 플랫폼
            </p>
          </div>
        </div>
        <p
          class="text-base mb-8 max-w-md leading-relaxed text-muted-foreground"
        >
          전국의 유기동물보호소를 통합하여 입양, 후원, 봉사, 커뮤니티 기능을
          한곳에서 제공하는 종합 플랫폼입니다. 더 많은 생명을 구하는 일에
          함께해주세요.
        </p>
        <div class="space-y-4 text-sm">
          <div class="flex items-center gap-4">
            <div class="lucide lucide-phone h-5 w-5 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/phone.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
            <span class="text-muted-foreground"
              >1588-0000 (평일 9:00-18:00)</span
            >
          </div>
          <div class="flex items-center gap-4">
            <div class="lucide lucide-mail h-5 w-5 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/email.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
            <span class="text-muted-foreground">help@dongbanja.kr</span>
          </div>
          <div class="flex items-center gap-4">
            <div class="lucide lucide-map-pin h-5 w-5 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/location.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
            <span class="text-muted-foreground"
              >서울시 강남구 테헤란로 123, 동반자빌딩</span
            >
          </div>
        </div>
        <div class="flex items-center gap-6 mt-8">
          <span class="text-sm text-muted-foreground">Follow us:</span
          ><a
            href="#"
            class="w-10 h-10 rounded-full flex items-center justify-center hover:scale-110 transition-all duration-200 bg-primary/20 border border-primary/30 hover:bg-primary/30"
            title="Instagram"
            ><div class="lucide lucide-instagram h-5 w-5 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/instagram.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div></a
          ><a
            href="#"
            class="w-10 h-10 rounded-full flex items-center justify-center hover:scale-110 transition-all duration-200 bg-primary/20 border border-primary/30 hover:bg-primary/30"
            title="Facebook"
            ><div class="lucide lucide-facebook h-5 w-5 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/facebook.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
          </a>
          <a
            href="#"
            class="w-10 h-10 rounded-full flex items-center justify-center hover:scale-110 transition-all duration-200 bg-primary/20 border border-primary/30 hover:bg-primary/30"
            title="YouTube"
            ><div class="lucide lucide-youtube h-5 w-5 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/youtube.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
          </a>
        </div>
      </div>
      <div>
        <h4 class="text-lg mb-6 text-background flex items-center gap-2">
          <div class="lucide lucide-award h-5 w-5 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/certification-badge.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
          빠른 메뉴
        </h4>
        <ul class="space-y-4 text-sm">
          <li>
            <a
              href="#"
              class="flex items-center justify-between hover:text-primary transition-all duration-200 hover:translate-x-1 text-muted-foreground group"
            >
              <span>최근구조</span>
              <span
                class="text-xs px-2 py-1 rounded-full bg-primary/10 text-primary group-hover:bg-primary/20"
                >19마리</span
              >
            </a>
          </li>
          <li>
            <a
              href="#"
              class="flex items-center justify-between hover:text-primary transition-all duration-200 hover:translate-x-1 text-muted-foreground group"
              ><span>입양하기</span
              ><span
                class="text-xs px-2 py-1 rounded-full bg-primary/10 text-primary group-hover:bg-primary/20"
                >143마리</span
              ></a
            >
          </li>
          <li>
            <a
              href="#"
              class="flex items-center justify-between hover:text-primary transition-all duration-200 hover:translate-x-1 text-muted-foreground group"
              ><span>실종신고</span
              ><span
                class="text-xs px-2 py-1 rounded-full bg-primary/10 text-primary group-hover:bg-primary/20"
                >78마리</span
              ></a
            >
          </li>
          <li>
            <a
              href="#"
              class="flex items-center justify-between hover:text-primary transition-all duration-200 hover:translate-x-1 text-muted-foreground group"
              ><span>후원하기</span
              ><span
                class="text-xs px-2 py-1 rounded-full bg-primary/10 text-primary group-hover:bg-primary/20"
                >₩2.1억</span
              ></a
            >
          </li>
          <li>
            <a
              href="#"
              class="flex items-center justify-between hover:text-primary transition-all duration-200 hover:translate-x-1 text-muted-foreground group"
              ><span>봉사하기</span
              ><span
                class="text-xs px-2 py-1 rounded-full bg-primary/10 text-primary group-hover:bg-primary/20"
                >1,240명</span
              ></a
            >
          </li>
          <li>
            <a
              href="#"
              class="flex items-center justify-between hover:text-primary transition-all duration-200 hover:translate-x-1 text-muted-foreground group"
              ><span>커뮤니티</span
              ><span
                class="text-xs px-2 py-1 rounded-full bg-primary/10 text-primary group-hover:bg-primary/20"
                >2.8K글</span
              ></a
            >
          </li>
          <li>
            <a
              href="#"
              class="flex items-center justify-between hover:text-primary transition-all duration-200 hover:translate-x-1 text-muted-foreground group"
              ><span>공지사항</span></a
            >
          </li>
        </ul>
      </div>
      <div>
        <h4 class="text-lg mb-6 text-background">지원 정보</h4>
        <ul class="space-y-4 text-sm">
          <li>
            <a
              href="#"
              class="hover:text-primary transition-all duration-200 hover:translate-x-1 text-muted-foreground"
              >이용약관</a
            >
          </li>
          <li>
            <a
              href="#"
              class="hover:text-primary transition-all duration-200 hover:translate-x-1 text-muted-foreground"
              >개인정보처리방침</a
            >
          </li>
          <li>
            <a
              href="#"
              class="hover:text-primary transition-all duration-200 hover:translate-x-1 text-muted-foreground"
              >FAQ</a
            >
          </li>
          <li>
            <a
              href="#"
              class="hover:text-primary transition-all duration-200 hover:translate-x-1 text-muted-foreground"
              >고객센터</a
            >
          </li>
          <li>
            <a
              href="#"
              class="hover:text-primary transition-all duration-200 hover:translate-x-1 text-muted-foreground"
              >파트너 등록</a
            >
          </li>
        </ul>
        <div class="mt-8 p-4 rounded-xl bg-primary/10 border border-primary/20">
          <div class="flex items-center gap-3 mb-2">
            <div class="lucide lucide-award h-5 w-5 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/certification-badge.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
            <span class="text-sm text-primary">통합 인증</span>
          </div>
          <p class="text-xs text-muted-foreground">
            농림축산식품부 · 동물보호단체 공식 인증
          </p>
        </div>
      </div>
    </div>
    <div
      class="border-t border-primary/20 mt-16 pt-8 flex flex-col md:flex-row items-center justify-between text-sm"
    >
      <p class="text-muted-foreground">© 2024 동반자. All rights reserved.</p>
      <div class="flex items-center gap-2 mt-4 md:mt-0">
        <span class="text-muted-foreground">Made with</span
        ><div class="lucide lucide-heart h-4 w-4 mx-1 animate-pulse text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
        <span class="text-muted-foreground">for all animals</span>
      </div>
    </div>
  </div>
</footer>
