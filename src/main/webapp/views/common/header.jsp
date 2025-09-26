<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<header class="w-full bg-card border-b border-border shadow-sm">
  <div class="container mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex items-center justify-between h-20">
      <div class="flex items-center gap-4">
        <div
          class="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center border-2 border-primary/20"
        >
        <div class="lucide lucide-heart h-6 w-6 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
        </div>
        <div>
          <h1 class="text-2xl text-foreground tracking-tight">동반자</h1>
          <p class="text-sm text-muted-foreground mt-0.5">
            유기견 보호소 통합 플랫폼
          </p>
        </div>
      </div>
      <div class="flex-1"></div>
      <div class="flex items-center gap-6">
        <div class="hidden md:flex items-center relative">
          <input
            type="search"
            data-slot="input"
            class="file:text-foreground placeholder:text-muted-foreground selection:bg-primary selection:text-primary-foreground dark:bg-input/30 flex min-w-0 border px-3 py-1 text-base transition-[color,box-shadow] outline-none file:inline-flex file:h-7 file:border-0 file:bg-transparent file:text-sm file:font-medium disabled:pointer-events-none disabled:cursor-not-allowed disabled:opacity-50 md:text-sm focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive w-80 pr-12 bg-input-background border-border focus:border-primary h-11 rounded-lg"
            placeholder="통합검색..."
          /><div class="lucide lucide-search absolute right-4 h-5 w-5 text-muted-foreground" style="mask: url('${contextPath}/assets/images/icons/ui/search.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
        </div>
        <div class="flex items-center gap-3">
          <button
            data-slot="button"
            class="inline-flex items-center justify-center whitespace-nowrap font-medium transition-all disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive border bg-background hover:text-accent-foreground dark:bg-input/30 dark:border-input dark:hover:bg-input/50 rounded-md gap-1.5 has-[&gt;svg]:px-2.5 text-sm px-4 py-2 h-9 border-border text-foreground hover:bg-primary/5 hover:border-primary/30"
          >
            <div class="lucide lucide-log-in h-4 w-4 mr-2" style="mask: url('${contextPath}/assets/images/icons/ui/login.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
            로그인
          </button>
          <button
            data-slot="button"
            class="inline-flex items-center justify-center whitespace-nowrap font-medium transition-all disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive rounded-md gap-1.5 has-[&gt;svg]:px-2.5 text-sm px-4 py-2 h-9 bg-primary text-primary-foreground hover:bg-primary/90"
          >
            <div class="lucide lucide-user h-4 w-4 mr-2" style="mask: url('${contextPath}/assets/images/icons/ui/signup.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
            회원가입
          </button>
        </div>
      </div>
    </div>
    <nav class="border-t border-border">
      <div class="flex items-center justify-center h-14 relative">
        <div class="hidden lg:flex items-center space-x-12">
        <a
            href="#"
            class="relative text-sm text-foreground hover:text-primary transition-colors duration-200 group py-2"
            ><a href="${contextPath}/home">Home</a>
            <div
              class="absolute bottom-0 left-0 w-0 h-0.5 bg-primary group-hover:w-full transition-all duration-200"
            ></div>
          </a>
          <a
            href="#"
            class="relative text-sm text-foreground hover:text-primary transition-colors duration-200 group py-2"
            ><a href="${contextPath}/board">커뮤니티</a>
            <div
              class="absolute bottom-0 left-0 w-0 h-0.5 bg-primary group-hover:w-full transition-all duration-200"
            ></div>
          </a>
          <a
            href="#"
            class="relative text-sm text-foreground hover:text-primary transition-colors duration-200 group py-2"
            ><a href="${contextPath}/daily">보호소 일상</a>
            <div
              class="absolute bottom-0 left-0 w-0 h-0.5 bg-primary group-hover:w-full transition-all duration-200"
            ></div>
          </a>
          <a
            href="#"
            class="relative text-sm text-foreground hover:text-primary transition-colors duration-200 group py-2"
            ><a href="${contextPath}/animals">입양하기</a>
            <div
              class="absolute bottom-0 left-0 w-0 h-0.5 bg-primary group-hover:w-full transition-all duration-200"
            ></div>
          </a>
          <a
            href="#"
            class="relative text-sm text-foreground hover:text-primary transition-colors duration-200 group py-2"
            ><a href="${contextPath}/volunteer">봉사하기</a>
            <div
              class="absolute bottom-0 left-0 w-0 h-0.5 bg-primary group-hover:w-full transition-all duration-200"
            ></div>
          </a>
          <a
            href="#"
            class="relative text-sm text-foreground hover:text-primary transition-colors duration-200 group py-2"
            ><a href="${contextPath}/notice">공지사항</a>
            <div
              class="absolute bottom-0 left-0 w-0 h-0.5 bg-primary group-hover:w-full transition-all duration-200"
            ></div>
          </a>
        </div>
        <div class="lg:hidden">
          <button
            data-slot="sheet-trigger"
            class="inline-flex items-center justify-center whitespace-nowrap font-medium transition-all disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive border bg-background text-foreground hover:bg-accent hover:text-accent-foreground dark:bg-input/30 dark:border-input dark:hover:bg-input/50 rounded-md gap-1.5 has-[&gt;svg]:px-2.5 text-sm px-3 py-2 h-8"
            type="button"
            aria-haspopup="dialog"
            aria-expanded="false"
            aria-controls="radix-:r0:"
            data-state="closed"
          >
            <div class="lucide lucide-menu h-4 w-4" style="mask: url('${contextPath}/assets/images/icons/ui/hamburger.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
          </button>
        </div>
      </div>
    </nav>
  </div>
</header>
