<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<section class="relative w-full h-[650px] overflow-hidden">
  <div class="absolute inset-0">
    <img
      src="https://images.unsplash.com/photo-1627014450098-8e7ed1084606?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxoYXBweSUyMGZhbWlseSUyMHdpdGglMjByZXNjdWUlMjBkb2clMjBhZG9wdGlvbnxlbnwxfHx8fDE3NTY4Nzk3MTV8MA&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080&amp;utm_source=figma&amp;utm_medium=referral"
      alt="Happy family with rescue dog"
      class="w-full h-full object-cover"
    />
    <div class="absolute inset-0 bg-black/40"></div>
    <div
      class="absolute inset-0 bg-gradient-to-b from-black/20 via-black/40 to-black/60"
    ></div>
  </div>
  <div class="relative z-10 container mx-auto px-4 sm:px-6 lg:px-8 h-full">
    <div
      class="flex flex-col justify-center items-center text-center h-full space-y-8"
    >
      <div class="space-y-6">
        <h1
          class="text-4xl md:text-5xl lg:text-6xl text-white leading-tight max-w-4xl mx-auto"
        >
          지금, <span class="text-secondary">동반자</span>와 함께 해주세요.
        </h1>
        <p
          class="text-xl md:text-2xl text-white/90 max-w-2xl mx-auto leading-relaxed"
        >
          당신의 참여가 더 많은 생명을 구합니다.
        </p>
      </div>
      <div class="space-y-6">
        <button
          data-slot="button"
          class="inline-flex items-center justify-center gap-2 whitespace-nowrap font-medium disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive rounded-md has-[&gt;svg]:px-4 text-lg px-8 py-4 h-14 bg-white/90 text-foreground hover:bg-white border-0 shadow-lg hover:shadow-xl transition-all duration-300 hover:scale-105"
        >
          <div class="lucide lucide-eye h-5 w-5 mr-3" style="mask: url('${contextPath}/assets/images/icons/ui/eye.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>내 주변 보호소 찾기<div class="lucide lucide-arrow-right h-5 w-5 ml-3" style="mask: url('${contextPath}/assets/images/icons/ui/arrow-right.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
        </button>
        <div
          class="grid grid-cols-1 sm:grid-cols-3 lg:grid-cols-5 gap-4 mt-8 max-w-5xl mx-auto"
        >
          <button
            data-slot="button"
            class="justify-center whitespace-nowrap text-sm font-medium disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive rounded-md px-6 has-[&gt;svg]:px-4 flex flex-col items-center gap-3 py-8 h-24 bg-primary/90 text-primary-foreground hover:bg-primary border-0 shadow-lg hover:shadow-xl transition-all duration-300 hover:scale-105 backdrop-blur-sm"
          >
            <div class="lucide lucide-heart h-7 w-7" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-base">최근구조</span></button
          ><button
            data-slot="button"
            class="justify-center whitespace-nowrap text-sm font-medium disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive border hover:text-accent-foreground dark:bg-input/30 dark:border-input dark:hover:bg-input/50 rounded-md px-6 has-[&gt;svg]:px-4 flex flex-col items-center gap-3 py-8 h-24 bg-white/10 text-white border-white/30 hover:bg-white/20 shadow-lg hover:shadow-xl transition-all duration-300 hover:scale-105 backdrop-blur-sm"
          >
            <div class="lucide lucide-search h-7 w-7" style="mask: url('${contextPath}/assets/images/icons/ui/search.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-base">실종신고</span></button
          ><button
            data-slot="button"
            class="justify-center whitespace-nowrap text-sm font-medium disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive border hover:text-accent-foreground dark:bg-input/30 dark:border-input dark:hover:bg-input/50 rounded-md px-6 has-[&gt;svg]:px-4 flex flex-col items-center gap-3 py-8 h-24 bg-white/10 text-white border-white/30 hover:bg-white/20 shadow-lg hover:shadow-xl transition-all duration-300 hover:scale-105 backdrop-blur-sm"
          >
            <div class="lucide lucide-house h-7 w-7" style="mask: url('${contextPath}/assets/images/icons/ui/house.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-base">입양하기</span></button
          ><button
            data-slot="button"
            class="justify-center whitespace-nowrap text-sm font-medium disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive border hover:text-accent-foreground dark:bg-input/30 dark:border-input dark:hover:bg-input/50 rounded-md px-6 has-[&gt;svg]:px-4 flex flex-col items-center gap-3 py-8 h-24 bg-white/10 text-white border-white/30 hover:bg-white/20 shadow-lg hover:shadow-xl transition-all duration-300 hover:scale-105 backdrop-blur-sm"
          >
            <div class="lucide lucide-dollar-sign h-7 w-7" style="mask: url('${contextPath}/assets/images/icons/ui/dollar-sign.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-base">후원하기</span></button
          ><button
            data-slot="button"
            class="justify-center whitespace-nowrap text-sm font-medium disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive border hover:text-accent-foreground dark:bg-input/30 dark:border-input dark:hover:bg-input/50 rounded-md px-6 has-[&gt;svg]:px-4 flex flex-col items-center gap-3 py-8 h-24 bg-white/10 text-white border-white/30 hover:bg-white/20 shadow-lg hover:shadow-xl transition-all duration-300 hover:scale-105 backdrop-blur-sm"
          >
            <div class="lucide lucide-users h-7 w-7" style="mask: url('${contextPath}/assets/images/icons/ui/users.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-base">봉사하기</span>
          </button>
        </div>
      </div>
    </div>
  </div>
  <div
    class="absolute bottom-0 left-0 right-0 h-20 bg-gradient-to-t from-background to-transparent"
  ></div>
</section>
<section class="w-full py-20 px-4 sm:px-6 lg:px-8 relative bg-secondary/20">
  <div
    class="absolute inset-0 opacity-5"
    style="
      background-image: url('data:image/svg+xml,%3Csvg width=\'60\' height=\'60\' viewBox=\'0 0 60 60\' xmlns=\'http://www.w3.org/2000/svg\'%3E%3Cg fill=\'none\' fill-rule=\'evenodd\'%3E%3Cg fill=\'%238D7B68\' fill-opacity=\'0.4\'%3E%3Ccircle cx=\'7\' cy=\'7\' r=\'1\'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E');
    "
  ></div>
  <div class="container mx-auto relative">
    <div
      class="flex flex-col lg:flex-row justify-between items-start lg:items-center mb-16 gap-6"
    >
      <div class="text-left flex-1">
        <div class="flex flex-col xl:flex-row xl:items-center gap-4 mb-4">
          <h2 class="text-4xl lg:text-5xl text-foreground">
            최근 구조된 아이들
          </h2>
          <div
            class="flex flex-wrap items-center gap-4 text-lg text-muted-foreground"
          >
            <span
              class="bg-primary/10 px-4 py-2 rounded-lg text-primary whitespace-nowrap"
              >현재 20마리</span
            ><span
              class="bg-green-100 px-4 py-2 rounded-lg text-green-700 whitespace-nowrap"
              >지금까지 1,247마리 구조</span
            >
            <div class="ml-8">
              <button
                data-slot="button"
                class="justify-center whitespace-nowrap text-sm font-medium transition-all disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive border bg-background hover:text-accent-foreground dark:bg-input/30 dark:border-input dark:hover:bg-input/50 rounded-md has-[&gt;svg]:px-4 flex items-center gap-2 px-6 py-3 h-12 border-primary text-primary hover:bg-primary/5"
              >
                <div class="lucide lucide-plus h-5 w-5" style="mask: url('${contextPath}/assets/images/icons/ui/plus.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>더보기
              </button>
            </div>
          </div>
        </div>
        <p class="text-xl text-muted-foreground leading-relaxed max-w-2xl">
          길에서 구조되어 보호받고 있는 아이들입니다
        </p>
      </div>
    </div>
    <div class="relative">
      <button
        data-slot="button"
        class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive border hover:text-accent-foreground dark:bg-input/30 dark:border-input dark:hover:bg-input/50 size-9 rounded-md absolute left-0 top-1/2 -translate-y-1/2 z-20 w-12 h-12 shadow-lg border-border backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/95 text-primary hover:bg-primary/10"
        disabled=""
      >
        <div class="lucide lucide-chevron-left h-5 w-5" style="mask: url('${contextPath}/assets/images/icons/ui/chevron-left.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div></button
      ><button
        data-slot="button"
        class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive border hover:text-accent-foreground dark:bg-input/30 dark:border-input dark:hover:bg-input/50 size-9 rounded-md absolute right-0 top-1/2 -translate-y-1/2 z-20 w-12 h-12 shadow-lg border-border backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/95 text-primary hover:bg-primary/10"
      >
        <div class="lucide lucide-chevron-right h-5 w-5" style="mask: url('${contextPath}/assets/images/icons/ui/chevron-right.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
      </button>
      <div class="overflow-hidden mx-8">
        <div class="grid grid-cols-5 gap-6">
          <div
            class="group rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex-shrink-0 w-[280px] cursor-pointer transform hover:-translate-y-2 bg-card border border-border"
          >
            <div class="relative h-72">
              <img
                src="https://images.unsplash.com/photo-1536862413209-7f2485243f1e?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZXNjdWUlMjBkb2clMjBzaGVsdGVyfGVufDF8fHx8MTc1Njc5NDMxMXww&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080&amp;utm_source=figma&amp;utm_medium=referral"
                alt="초코 - 믹스견"
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-transparent"
              ></div>
              <div
                class="absolute top-4 left-4 px-3 py-1.5 rounded-full text-xs backdrop-blur-sm border bg-secondary/95 text-secondary-foreground border-secondary/20"
              >
                최근 구조
              </div>
              <button
                class="absolute top-4 right-4 p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
              >
                <div class="lucide lucide-heart h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
              </button>
              <div
                class="absolute bottom-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <button
                  class="p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
                >
                  <div class="lucide lucide-eye h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/eye.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
                </button>
              </div>
              <div
                class="absolute bottom-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div
                  class="flex items-center gap-1 px-2 py-1 rounded-full bg-accent/90 backdrop-blur-sm"
                >
                  <div class="lucide lucide-star h-3 w-3 text-accent-foreground" style="mask: url('${contextPath}/assets/images/icons/ui/star.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-xs text-accent-foreground">추천</span>
                </div>
              </div>
            </div>
            <div class="p-6">
              <div class="flex items-center justify-between mb-3">
                <h3
                  class="text-xl group-hover:text-primary transition-colors text-foreground"
                >
                  초코
                </h3>
                <span
                  class="text-sm px-3 py-1 rounded-full bg-muted text-muted-foreground border border-border"
                  >3살</span
                >
              </div>
              <p class="text-sm mb-4 text-primary">믹스견</p>
              <p
                class="text-sm mb-4 line-clamp-2 leading-relaxed text-muted-foreground"
              >
                길에서 발견되어 구조된 사랑스러운 아이입니다. 현재 건강검진
                중이에요.
              </p>
              <div
                class="flex items-center justify-between text-xs pt-4 border-t border-border"
              >
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-map-pin h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/location.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">서울시 강남구</span>
                </div>
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-calendar h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/calendar.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">2024.01.20</span>
                </div>
              </div>
              <div
                class="mt-4 opacity-0 group-hover:opacity-100 transition-all duration-300"
              >
                <button
                  class="w-full py-2.5 text-sm rounded-lg transition-colors duration-200 border bg-primary text-primary-foreground hover:bg-primary/90 border-primary/20"
                >
                  자세히 보기
                </button>
              </div>
            </div>
          </div>
          <div
            class="group rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex-shrink-0 w-[280px] cursor-pointer transform hover:-translate-y-2 bg-card border border-border"
          >
            <div class="relative h-72">
              <img
                src="https://images.unsplash.com/photo-1669891732707-4beb1437679a?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjdXRlJTIwY2F0JTIwYWRvcHRpb258ZW58MXx8fHwxNzU2ODc3MDY3fDA&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080&amp;utm_source=figma&amp;utm_medium=referral"
                alt="나비 - 코리안 숏헤어"
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-transparent"
              ></div>
              <div
                class="absolute top-4 left-4 px-3 py-1.5 rounded-full text-xs backdrop-blur-sm border bg-secondary/95 text-secondary-foreground border-secondary/20"
              >
                최근 구조
              </div>
              <button
                class="absolute top-4 right-4 p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
              >
                <div class="lucide lucide-heart h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
              </button>
              <div
                class="absolute bottom-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <button
                  class="p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
                >
                  <div class="lucide lucide-eye h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/eye.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
                </button>
              </div>
              <div
                class="absolute bottom-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div
                  class="flex items-center gap-1 px-2 py-1 rounded-full bg-accent/90 backdrop-blur-sm"
                >
                  <div class="lucide lucide-star h-3 w-3 text-accent-foreground" style="mask: url('${contextPath}/assets/images/icons/ui/star.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-xs text-accent-foreground">추천</span>
                </div>
              </div>
            </div>
            <div class="p-6">
              <div class="flex items-center justify-between mb-3">
                <h3
                  class="text-xl group-hover:text-primary transition-colors text-foreground"
                >
                  나비
                </h3>
                <span
                  class="text-sm px-3 py-1 rounded-full bg-muted text-muted-foreground border border-border"
                  >3살</span
                >
              </div>
              <p class="text-sm mb-4 text-primary">코리안 숏헤어</p>
              <p
                class="text-sm mb-4 line-clamp-2 leading-relaxed text-muted-foreground"
              >
                어미 고양이와 함께 구조된 새끼 고양이입니다.
              </p>
              <div
                class="flex items-center justify-between text-xs pt-4 border-t border-border"
              >
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-map-pin h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/location.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">부산시 해운대구</span>
                </div>
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-calendar h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/calendar.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">2024.01.26</span>
                </div>
              </div>
              <div
                class="mt-4 opacity-0 group-hover:opacity-100 transition-all duration-300"
              >
                <button
                  class="w-full py-2.5 text-sm rounded-lg transition-colors duration-200 border bg-primary text-primary-foreground hover:bg-primary/90 border-primary/20"
                >
                  자세히 보기
                </button>
              </div>
            </div>
          </div>
          <div
            class="group rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex-shrink-0 w-[280px] cursor-pointer transform hover:-translate-y-2 bg-card border border-border"
          >
            <div class="relative h-72">
              <img
                src="https://images.unsplash.com/photo-1733328059553-5d1e986f5078?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxwdXBweSUyMHNoZWx0ZXIlMjBjYXJlfGVufDF8fHx8MTc1Njg3NzA2N3ww&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080&amp;utm_source=figma&amp;utm_medium=referral"
                alt="구름 - 푸들 믹스"
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-transparent"
              ></div>
              <div
                class="absolute top-4 left-4 px-3 py-1.5 rounded-full text-xs backdrop-blur-sm border bg-secondary/95 text-secondary-foreground border-secondary/20"
              >
                최근 구조
              </div>
              <button
                class="absolute top-4 right-4 p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
              >
                <div class="lucide lucide-heart h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
              </button>
              <div
                class="absolute bottom-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <button
                  class="p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
                >
                  <div class="lucide lucide-eye h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/eye.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
                </button>
              </div>
              <div
                class="absolute bottom-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div
                  class="flex items-center gap-1 px-2 py-1 rounded-full bg-accent/90 backdrop-blur-sm"
                >
                  <div class="lucide lucide-star h-3 w-3 text-accent-foreground" style="mask: url('${contextPath}/assets/images/icons/ui/star.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-xs text-accent-foreground">추천</span>
                </div>
              </div>
            </div>
            <div class="p-6">
              <div class="flex items-center justify-between mb-3">
                <h3
                  class="text-xl group-hover:text-primary transition-colors text-foreground"
                >
                  구름
                </h3>
                <span
                  class="text-sm px-3 py-1 rounded-full bg-muted text-muted-foreground border border-border"
                  >3살</span
                >
              </div>
              <p class="text-sm mb-4 text-primary">푸들 믹스</p>
              <p
                class="text-sm mb-4 line-clamp-2 leading-relaxed text-muted-foreground"
              >
                유기되어 구조된 활발한 성격의 강아지입니다.
              </p>
              <div
                class="flex items-center justify-between text-xs pt-4 border-t border-border"
              >
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-map-pin h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/location.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">대구시 중구</span>
                </div>
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-calendar h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/calendar.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">2024.01.15</span>
                </div>
              </div>
              <div
                class="mt-4 opacity-0 group-hover:opacity-100 transition-all duration-300"
              >
                <button
                  class="w-full py-2.5 text-sm rounded-lg transition-colors duration-200 border bg-primary text-primary-foreground hover:bg-primary/90 border-primary/20"
                >
                  자세히 보기
                </button>
              </div>
            </div>
          </div>
          <div
            class="group rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex-shrink-0 w-[280px] cursor-pointer transform hover:-translate-y-2 bg-card border border-border"
          >
            <div class="relative h-72">
              <img
                src="https://images.unsplash.com/photo-1730452961410-bfeca9ae4a90?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxnb2xkZW4lMjByZXRyaWV2ZXIlMjBhZG9wdGlvbnxlbnwxfHx8fDE3NTY4NzcwNjh8MA&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080&amp;utm_source=figma&amp;utm_medium=referral"
                alt="별이 - 골든 리트리버"
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-transparent"
              ></div>
              <div
                class="absolute top-4 left-4 px-3 py-1.5 rounded-full text-xs backdrop-blur-sm border bg-secondary/95 text-secondary-foreground border-secondary/20"
              >
                최근 구조
              </div>
              <button
                class="absolute top-4 right-4 p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
              >
                <div class="lucide lucide-heart h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
              </button>
              <div
                class="absolute bottom-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <button
                  class="p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
                >
                  <div class="lucide lucide-eye h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/eye.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
                </button>
              </div>
              <div
                class="absolute bottom-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div
                  class="flex items-center gap-1 px-2 py-1 rounded-full bg-accent/90 backdrop-blur-sm"
                >
                  <div class="lucide lucide-star h-3 w-3 text-accent-foreground" style="mask: url('${contextPath}/assets/images/icons/ui/star.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-xs text-accent-foreground">추천</span>
                </div>
              </div>
            </div>
            <div class="p-6">
              <div class="flex items-center justify-between mb-3">
                <h3
                  class="text-xl group-hover:text-primary transition-colors text-foreground"
                >
                  별이
                </h3>
                <span
                  class="text-sm px-3 py-1 rounded-full bg-muted text-muted-foreground border border-border"
                  >4살</span
                >
              </div>
              <p class="text-sm mb-4 text-primary">골든 리트리버</p>
              <p
                class="text-sm mb-4 line-clamp-2 leading-relaxed text-muted-foreground"
              >
                보호자가 사정으로 인해 보호소에 맡겨진 온순한 대형견입니다.
              </p>
              <div
                class="flex items-center justify-between text-xs pt-4 border-t border-border"
              >
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-map-pin h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/location.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">인천시 연수구</span>
                </div>
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-calendar h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/calendar.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">2024.01.22</span>
                </div>
              </div>
              <div
                class="mt-4 opacity-0 group-hover:opacity-100 transition-all duration-300"
              >
                <button
                  class="w-full py-2.5 text-sm rounded-lg transition-colors duration-200 border bg-primary text-primary-foreground hover:bg-primary/90 border-primary/20"
                >
                  자세히 보기
                </button>
              </div>
            </div>
          </div>
          <div
            class="group rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex-shrink-0 w-[280px] cursor-pointer transform hover:-translate-y-2 bg-card border border-border"
          >
            <div class="relative h-72">
              <img
                src="https://images.unsplash.com/photo-1609074405294-355851aead3e?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxraXR0ZW4lMjByZXNjdWUlMjBjdXRlfGVufDF8fHx8MTc1Njg3NzA2OHww&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080&amp;utm_source=figma&amp;utm_medium=referral"
                alt="미미 - 러시안 블루"
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-transparent"
              ></div>
              <div
                class="absolute top-4 left-4 px-3 py-1.5 rounded-full text-xs backdrop-blur-sm border bg-secondary/95 text-secondary-foreground border-secondary/20"
              >
                최근 구조
              </div>
              <button
                class="absolute top-4 right-4 p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
              >
                <div class="lucide lucide-heart h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
              </button>
              <div
                class="absolute bottom-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <button
                  class="p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
                >
                  <div class="lucide lucide-eye h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/eye.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
                </button>
              </div>
              <div
                class="absolute bottom-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div
                  class="flex items-center gap-1 px-2 py-1 rounded-full bg-accent/90 backdrop-blur-sm"
                >
                  <div class="lucide lucide-star h-3 w-3 text-accent-foreground" style="mask: url('${contextPath}/assets/images/icons/ui/star.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-xs text-accent-foreground">추천</span>
                </div>
              </div>
            </div>
            <div class="p-6">
              <div class="flex items-center justify-between mb-3">
                <h3
                  class="text-xl group-hover:text-primary transition-colors text-foreground"
                >
                  미미
                </h3>
                <span
                  class="text-sm px-3 py-1 rounded-full bg-muted text-muted-foreground border border-border"
                  >4살</span
                >
              </div>
              <p class="text-sm mb-4 text-primary">러시안 블루</p>
              <p
                class="text-sm mb-4 line-clamp-2 leading-relaxed text-muted-foreground"
              >
                아파트 베란다에서 발견되어 구조된 새끼 고양이입니다.
              </p>
              <div
                class="flex items-center justify-between text-xs pt-4 border-t border-border"
              >
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-map-pin h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/location.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">광주시 북구</span>
                </div>
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-calendar h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/calendar.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">2024.01.25</span>
                </div>
              </div>
              <div
                class="mt-4 opacity-0 group-hover:opacity-100 transition-all duration-300"
              >
                <button
                  class="w-full py-2.5 text-sm rounded-lg transition-colors duration-200 border bg-primary text-primary-foreground hover:bg-primary/90 border-primary/20"
                >
                  자세히 보기
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="flex justify-center mt-12 gap-3">
      <button
        class="w-3 h-3 rounded-full transition-all duration-200 hover:scale-125 bg-primary shadow-lg"
      ></button
      ><button
        class="w-3 h-3 rounded-full transition-all duration-200 hover:scale-125 bg-muted-foreground/30 hover:bg-muted-foreground/50"
      ></button
      ><button
        class="w-3 h-3 rounded-full transition-all duration-200 hover:scale-125 bg-muted-foreground/30 hover:bg-muted-foreground/50"
      ></button
      ><button
        class="w-3 h-3 rounded-full transition-all duration-200 hover:scale-125 bg-muted-foreground/30 hover:bg-muted-foreground/50"
      ></button>
    </div>
  </div>
</section>
<section class="w-full py-20 px-4 sm:px-6 lg:px-8 relative bg-background">
  <div
    class="absolute inset-0 opacity-5"
    style="
      background-image: url('data:image/svg+xml,%3Csvg width=\'60\' height=\'60\' viewBox=\'0 0 60 60\' xmlns=\'http://www.w3.org/2000/svg\'%3E%3Cg fill=\'none\' fill-rule=\'evenodd\'%3E%3Cg fill=\'%23A4907C\' fill-opacity=\'0.4\'%3E%3Ccircle cx=\'7\' cy=\'7\' r=\'1\'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E');
    "
  ></div>
  <div class="container mx-auto relative">
    <div
      class="flex flex-col lg:flex-row justify-between items-start lg:items-center mb-16 gap-6"
    >
      <div class="text-left flex-1">
        <div class="flex flex-col xl:flex-row xl:items-center gap-4 mb-4">
          <h2 class="text-4xl lg:text-5xl text-foreground">
            입양을 기다리는 아이들
          </h2>
          <div
            class="flex flex-wrap items-center gap-4 text-lg text-muted-foreground"
          >
            <span
              class="bg-primary/10 px-4 py-2 rounded-lg text-primary whitespace-nowrap"
              >현재 20마리</span
            ><span
              class="bg-blue-100 px-4 py-2 rounded-lg text-blue-700 whitespace-nowrap"
              >지금까지 3,892마리 입양</span
            >
            <div class="ml-8">
              <button
                data-slot="button"
                class="justify-center whitespace-nowrap text-sm font-medium transition-all disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive border bg-background hover:text-accent-foreground dark:bg-input/30 dark:border-input dark:hover:bg-input/50 rounded-md has-[&gt;svg]:px-4 flex items-center gap-2 px-6 py-3 h-12 border-primary text-primary hover:bg-primary/5"
              >
                <div class="lucide lucide-plus h-5 w-5" style="mask: url('${contextPath}/assets/images/icons/ui/plus.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>더보기
              </button>
            </div>
          </div>
        </div>
        <p class="text-xl text-muted-foreground leading-relaxed max-w-2xl">
          따뜻한 가족을 기다리고 있어요
        </p>
      </div>
    </div>
    <div class="relative">
      <button
        data-slot="button"
        class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive border hover:text-accent-foreground dark:bg-input/30 dark:border-input dark:hover:bg-input/50 size-9 rounded-md absolute left-0 top-1/2 -translate-y-1/2 z-20 w-12 h-12 shadow-lg border-border backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/95 text-primary hover:bg-primary/10"
        disabled=""
      >
        <div class="lucide lucide-chevron-left h-5 w-5" style="mask: url('${contextPath}/assets/images/icons/ui/chevron-left.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div></button
      ><button
        data-slot="button"
        class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive border hover:text-accent-foreground dark:bg-input/30 dark:border-input dark:hover:bg-input/50 size-9 rounded-md absolute right-0 top-1/2 -translate-y-1/2 z-20 w-12 h-12 shadow-lg border-border backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/95 text-primary hover:bg-primary/10"
      >
        <div class="lucide lucide-chevron-right h-5 w-5" style="mask: url('${contextPath}/assets/images/icons/ui/chevron-right.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
      </button>
      <div class="overflow-hidden mx-8">
        <div class="grid grid-cols-5 gap-6">
          <div
            class="group rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex-shrink-0 w-[280px] cursor-pointer transform hover:-translate-y-2 bg-card border border-border"
          >
            <div class="relative h-72">
              <img
                src="https://images.unsplash.com/photo-1536862413209-7f2485243f1e?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZXNjdWUlMjBkb2clMjBzaGVsdGVyfGVufDF8fHx8MTc1Njc5NDMxMXww&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080&amp;utm_source=figma&amp;utm_medium=referral"
                alt="햇살 - 진돗개 믹스"
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-transparent"
              ></div>
              <div
                class="absolute top-4 left-4 px-3 py-1.5 rounded-full text-xs backdrop-blur-sm border bg-primary/95 text-primary-foreground border-primary/20"
              >
                입양 가능
              </div>
              <button
                class="absolute top-4 right-4 p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
              >
                <div class="lucide lucide-heart h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
              </button>
              <div
                class="absolute bottom-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <button
                  class="p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
                >
                  <div class="lucide lucide-eye h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/eye.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
                </button>
              </div>
              <div
                class="absolute bottom-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div
                  class="flex items-center gap-1 px-2 py-1 rounded-full bg-accent/90 backdrop-blur-sm"
                >
                  <div class="lucide lucide-star h-3 w-3 text-accent-foreground" style="mask: url('${contextPath}/assets/images/icons/ui/star.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-xs text-accent-foreground">추천</span>
                </div>
              </div>
            </div>
            <div class="p-6">
              <div class="flex items-center justify-between mb-3">
                <h3
                  class="text-xl group-hover:text-primary transition-colors text-foreground"
                >
                  햇살
                </h3>
                <span
                  class="text-sm px-3 py-1 rounded-full bg-muted text-muted-foreground border border-border"
                  >5살</span
                >
              </div>
              <p class="text-sm mb-4 text-primary">진돗개 믹스</p>
              <p
                class="text-sm mb-4 line-clamp-2 leading-relaxed text-muted-foreground"
              >
                사람을 좋아하고 산책을 즐기는 건강한 강아지입니다.
              </p>
              <div
                class="flex items-center justify-between text-xs pt-4 border-t border-border"
              >
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-map-pin h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/location.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">서울시 마포구</span>
                </div>
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-calendar h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/calendar.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">입양 대기</span>
                </div>
              </div>
              <div
                class="mt-4 opacity-0 group-hover:opacity-100 transition-all duration-300"
              >
                <button
                  class="w-full py-2.5 text-sm rounded-lg transition-colors duration-200 border bg-primary text-primary-foreground hover:bg-primary/90 border-primary/20"
                >
                  입양 신청하기
                </button>
              </div>
            </div>
          </div>
          <div
            class="group rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex-shrink-0 w-[280px] cursor-pointer transform hover:-translate-y-2 bg-card border border-border"
          >
            <div class="relative h-72">
              <img
                src="https://images.unsplash.com/photo-1669891732707-4beb1437679a?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjdXRlJTIwY2F0JTIwYWRvcHRpb258ZW58MXx8fHwxNzU2ODc3MDY3fDA&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080&amp;utm_source=figma&amp;utm_medium=referral"
                alt="달님 - 브리티시 숏헤어"
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-transparent"
              ></div>
              <div
                class="absolute top-4 left-4 px-3 py-1.5 rounded-full text-xs backdrop-blur-sm border bg-primary/95 text-primary-foreground border-primary/20"
              >
                입양 가능
              </div>
              <button
                class="absolute top-4 right-4 p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
              >
                <div class="lucide lucide-heart h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
              </button>
              <div
                class="absolute bottom-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <button
                  class="p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
                >
                  <div class="lucide lucide-eye h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/eye.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
                </button>
              </div>
              <div
                class="absolute bottom-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div
                  class="flex items-center gap-1 px-2 py-1 rounded-full bg-accent/90 backdrop-blur-sm"
                >
                  <div class="lucide lucide-star h-3 w-3 text-accent-foreground" style="mask: url('${contextPath}/assets/images/icons/ui/star.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-xs text-accent-foreground">추천</span>
                </div>
              </div>
            </div>
            <div class="p-6">
              <div class="flex items-center justify-between mb-3">
                <h3
                  class="text-xl group-hover:text-primary transition-colors text-foreground"
                >
                  달님
                </h3>
                <span
                  class="text-sm px-3 py-1 rounded-full bg-muted text-muted-foreground border border-border"
                  >5살</span
                >
              </div>
              <p class="text-sm mb-4 text-primary">브리티시 숏헤어</p>
              <p
                class="text-sm mb-4 line-clamp-2 leading-relaxed text-muted-foreground"
              >
                조용하고 차분한 성격의 예쁜 고양이입니다.
              </p>
              <div
                class="flex items-center justify-between text-xs pt-4 border-t border-border"
              >
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-map-pin h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/location.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">경기도 성남시</span>
                </div>
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-calendar h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/calendar.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">입양 대기</span>
                </div>
              </div>
              <div
                class="mt-4 opacity-0 group-hover:opacity-100 transition-all duration-300"
              >
                <button
                  class="w-full py-2.5 text-sm rounded-lg transition-colors duration-200 border bg-primary text-primary-foreground hover:bg-primary/90 border-primary/20"
                >
                  입양 신청하기
                </button>
              </div>
            </div>
          </div>
          <div
            class="group rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex-shrink-0 w-[280px] cursor-pointer transform hover:-translate-y-2 bg-card border border-border"
          >
            <div class="relative h-72">
              <img
                src="https://images.unsplash.com/photo-1733328059553-5d1e986f5078?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxwdXBweSUyMHNoZWx0ZXIlMjBjYXJlfGVufDF8fHx8MTc1Njg3NzA2N3ww&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080&amp;utm_source=figma&amp;utm_medium=referral"
                alt="봄이 - 시츄"
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-transparent"
              ></div>
              <div
                class="absolute top-4 left-4 px-3 py-1.5 rounded-full text-xs backdrop-blur-sm border bg-primary/95 text-primary-foreground border-primary/20"
              >
                입양 가능
              </div>
              <button
                class="absolute top-4 right-4 p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
              >
                <div class="lucide lucide-heart h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
              </button>
              <div
                class="absolute bottom-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <button
                  class="p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
                >
                  <div class="lucide lucide-eye h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/eye.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
                </button>
              </div>
              <div
                class="absolute bottom-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div
                  class="flex items-center gap-1 px-2 py-1 rounded-full bg-accent/90 backdrop-blur-sm"
                >
                  <div class="lucide lucide-star h-3 w-3 text-accent-foreground" style="mask: url('${contextPath}/assets/images/icons/ui/star.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-xs text-accent-foreground">추천</span>
                </div>
              </div>
            </div>
            <div class="p-6">
              <div class="flex items-center justify-between mb-3">
                <h3
                  class="text-xl group-hover:text-primary transition-colors text-foreground"
                >
                  봄이
                </h3>
                <span
                  class="text-sm px-3 py-1 rounded-full bg-muted text-muted-foreground border border-border"
                  >7살</span
                >
              </div>
              <p class="text-sm mb-4 text-primary">시츄</p>
              <p
                class="text-sm mb-4 line-clamp-2 leading-relaxed text-muted-foreground"
              >
                귀엽고 애교 많은 소형견입니다. 아이들과도 잘 지내요.
              </p>
              <div
                class="flex items-center justify-between text-xs pt-4 border-t border-border"
              >
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-map-pin h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/location.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">부산시 사상구</span>
                </div>
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-calendar h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/calendar.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">입양 대기</span>
                </div>
              </div>
              <div
                class="mt-4 opacity-0 group-hover:opacity-100 transition-all duration-300"
              >
                <button
                  class="w-full py-2.5 text-sm rounded-lg transition-colors duration-200 border bg-primary text-primary-foreground hover:bg-primary/90 border-primary/20"
                >
                  입양 신청하기
                </button>
              </div>
            </div>
          </div>
          <div
            class="group rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex-shrink-0 w-[280px] cursor-pointer transform hover:-translate-y-2 bg-card border border-border"
          >
            <div class="relative h-72">
              <img
                src="https://images.unsplash.com/photo-1730452961410-bfeca9ae4a90?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxnb2xkZW4lMjByZXRyaWV2ZXIlMjBhZG9wdGlvbnxlbnwxfHx8fDE3NTY4NzcwNjh8MA&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080&amp;utm_source=figma&amp;utm_medium=referral"
                alt="코코 - 라브라도 리트리버"
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-transparent"
              ></div>
              <div
                class="absolute top-4 left-4 px-3 py-1.5 rounded-full text-xs backdrop-blur-sm border bg-primary/95 text-primary-foreground border-primary/20"
              >
                입양 가능
              </div>
              <button
                class="absolute top-4 right-4 p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
              >
                <div class="lucide lucide-heart h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
              </button>
              <div
                class="absolute bottom-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <button
                  class="p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
                >
                  <div class="lucide lucide-eye h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/eye.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
                </button>
              </div>
              <div
                class="absolute bottom-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div
                  class="flex items-center gap-1 px-2 py-1 rounded-full bg-accent/90 backdrop-blur-sm"
                >
                  <div class="lucide lucide-star h-3 w-3 text-accent-foreground" style="mask: url('${contextPath}/assets/images/icons/ui/star.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-xs text-accent-foreground">추천</span>
                </div>
              </div>
            </div>
            <div class="p-6">
              <div class="flex items-center justify-between mb-3">
                <h3
                  class="text-xl group-hover:text-primary transition-colors text-foreground"
                >
                  코코
                </h3>
                <span
                  class="text-sm px-3 py-1 rounded-full bg-muted text-muted-foreground border border-border"
                  >4살</span
                >
              </div>
              <p class="text-sm mb-4 text-primary">라브라도 리트리버</p>
              <p
                class="text-sm mb-4 line-clamp-2 leading-relaxed text-muted-foreground"
              >
                훈련이 잘 되어 있고 성격이 온순한 대형견입니다.
              </p>
              <div
                class="flex items-center justify-between text-xs pt-4 border-t border-border"
              >
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-map-pin h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/location.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">대전시 유성구</span>
                </div>
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-calendar h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/calendar.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">입양 대기</span>
                </div>
              </div>
              <div
                class="mt-4 opacity-0 group-hover:opacity-100 transition-all duration-300"
              >
                <button
                  class="w-full py-2.5 text-sm rounded-lg transition-colors duration-200 border bg-primary text-primary-foreground hover:bg-primary/90 border-primary/20"
                >
                  입양 신청하기
                </button>
              </div>
            </div>
          </div>
          <div
            class="group rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex-shrink-0 w-[280px] cursor-pointer transform hover:-translate-y-2 bg-card border border-border"
          >
            <div class="relative h-72">
              <img
                src="https://images.unsplash.com/photo-1609074405294-355851aead3e?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxraXR0ZW4lMjByZXNjdWUlMjBjdXRlfGVufDF8fHx8MTc1Njg3NzA2OHww&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080&amp;utm_source=figma&amp;utm_medium=referral"
                alt="루루 - 먼치킨"
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-transparent"
              ></div>
              <div
                class="absolute top-4 left-4 px-3 py-1.5 rounded-full text-xs backdrop-blur-sm border bg-primary/95 text-primary-foreground border-primary/20"
              >
                입양 가능
              </div>
              <button
                class="absolute top-4 right-4 p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
              >
                <div class="lucide lucide-heart h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
              </button>
              <div
                class="absolute bottom-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <button
                  class="p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
                >
                  <div class="lucide lucide-eye h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/eye.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
                </button>
              </div>
              <div
                class="absolute bottom-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div
                  class="flex items-center gap-1 px-2 py-1 rounded-full bg-accent/90 backdrop-blur-sm"
                >
                  <div class="lucide lucide-star h-3 w-3 text-accent-foreground" style="mask: url('${contextPath}/assets/images/icons/ui/star.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-xs text-accent-foreground">추천</span>
                </div>
              </div>
            </div>
            <div class="p-6">
              <div class="flex items-center justify-between mb-3">
                <h3
                  class="text-xl group-hover:text-primary transition-colors text-foreground"
                >
                  루루
                </h3>
                <span
                  class="text-sm px-3 py-1 rounded-full bg-muted text-muted-foreground border border-border"
                  >7살</span
                >
              </div>
              <p class="text-sm mb-4 text-primary">먼치킨</p>
              <p
                class="text-sm mb-4 line-clamp-2 leading-relaxed text-muted-foreground"
              >
                놀기 좋아하는 활발한 성격의 고양이입니다.
              </p>
              <div
                class="flex items-center justify-between text-xs pt-4 border-t border-border"
              >
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-map-pin h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/location.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">울산시 남구</span>
                </div>
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-calendar h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/calendar.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">입양 대기</span>
                </div>
              </div>
              <div
                class="mt-4 opacity-0 group-hover:opacity-100 transition-all duration-300"
              >
                <button
                  class="w-full py-2.5 text-sm rounded-lg transition-colors duration-200 border bg-primary text-primary-foreground hover:bg-primary/90 border-primary/20"
                >
                  입양 신청하기
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="flex justify-center mt-12 gap-3">
      <button
        class="w-3 h-3 rounded-full transition-all duration-200 hover:scale-125 bg-primary shadow-lg"
      ></button
      ><button
        class="w-3 h-3 rounded-full transition-all duration-200 hover:scale-125 bg-muted-foreground/30 hover:bg-muted-foreground/50"
      ></button
      ><button
        class="w-3 h-3 rounded-full transition-all duration-200 hover:scale-125 bg-muted-foreground/30 hover:bg-muted-foreground/50"
      ></button
      ><button
        class="w-3 h-3 rounded-full transition-all duration-200 hover:scale-125 bg-muted-foreground/30 hover:bg-muted-foreground/50"
      ></button>
    </div>
  </div>
</section>
<section class="w-full py-20 px-4 sm:px-6 lg:px-8 relative bg-red-50">
  <div
    class="absolute inset-0 opacity-5"
    style="
      background-image: url('data:image/svg+xml,%3Csvg width=\'60\' height=\'60\' viewBox=\'0 0 60 60\' xmlns=\'http://www.w3.org/2000/svg\'%3E%3Cg fill=\'none\' fill-rule=\'evenodd\'%3E%3Cg fill=\'%23A4907C\' fill-opacity=\'0.4\'%3E%3Ccircle cx=\'7\' cy=\'7\' r=\'1\'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E');
    "
  ></div>
  <div class="container mx-auto relative">
    <div
      class="flex flex-col lg:flex-row justify-between items-start lg:items-center mb-16 gap-6"
    >
      <div class="text-left flex-1">
        <div class="flex flex-col xl:flex-row xl:items-center gap-4 mb-4">
          <h2 class="text-4xl lg:text-5xl text-foreground">실종된 아이들</h2>
          <div
            class="flex flex-wrap items-center gap-4 text-lg text-muted-foreground"
          >
            <span
              class="bg-primary/10 px-4 py-2 rounded-lg text-primary whitespace-nowrap"
              >현재 20마리</span
            ><span
              class="bg-orange-100 px-4 py-2 rounded-lg text-orange-700 whitespace-nowrap"
              >지금까지 567마리 찾음</span
            >
            <div class="ml-8">
              <button
                data-slot="button"
                class="justify-center whitespace-nowrap text-sm font-medium transition-all disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive border bg-background hover:text-accent-foreground dark:bg-input/30 dark:border-input dark:hover:bg-input/50 rounded-md has-[&gt;svg]:px-4 flex items-center gap-2 px-6 py-3 h-12 border-primary text-primary hover:bg-primary/5"
              >
                <div class="lucide lucide-plus h-5 w-5" style="mask: url('${contextPath}/assets/images/icons/ui/plus.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>더보기
              </button>
            </div>
          </div>
        </div>
        <p class="text-xl text-muted-foreground leading-relaxed max-w-2xl">
          가족을 찾고 있어요. 목격하신 분은 제보해주세요
        </p>
      </div>
    </div>
    <div class="relative">
      <button
        data-slot="button"
        class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive border hover:text-accent-foreground dark:bg-input/30 dark:border-input dark:hover:bg-input/50 size-9 rounded-md absolute left-0 top-1/2 -translate-y-1/2 z-20 w-12 h-12 shadow-lg border-border backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/95 text-primary hover:bg-primary/10"
        disabled=""
      >
        <div class="lucide lucide-chevron-left h-5 w-5" style="mask: url('${contextPath}/assets/images/icons/ui/chevron-left.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div></button
      ><button
        data-slot="button"
        class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive border hover:text-accent-foreground dark:bg-input/30 dark:border-input dark:hover:bg-input/50 size-9 rounded-md absolute right-0 top-1/2 -translate-y-1/2 z-20 w-12 h-12 shadow-lg border-border backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/95 text-primary hover:bg-primary/10"
      >
        <div class="lucide lucide-chevron-right h-5 w-5" style="mask: url('${contextPath}/assets/images/icons/ui/chevron-right.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
      </button>
      <div class="overflow-hidden mx-8">
        <div class="grid grid-cols-5 gap-6">
          <div
            class="group rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex-shrink-0 w-[280px] cursor-pointer transform hover:-translate-y-2 bg-card border border-border"
          >
            <div class="relative h-72">
              <img
                src="https://images.unsplash.com/photo-1583337130417-3346a1be7dee?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtaXNzaW5nJTIwZG9nJTIwc3BpdHp8ZW58MXx8fHwxNzU2ODc3Njc2fDA&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080&amp;utm_source=figma&amp;utm_medium=referral"
                alt="복실이 - 스피츠"
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-transparent"
              ></div>
              <div
                class="absolute top-4 left-4 px-3 py-1.5 rounded-full text-xs backdrop-blur-sm border bg-red-500/95 text-white border-red-500/20"
              >
                실종
              </div>
              <button
                class="absolute top-4 right-4 p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
              >
                <div class="lucide lucide-heart h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
              </button>
              <div
                class="absolute bottom-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <button
                  class="p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
                >
                  <div class="lucide lucide-eye h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/eye.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
                </button>
              </div>
              <div
                class="absolute bottom-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div
                  class="flex items-center gap-1 px-2 py-1 rounded-full bg-accent/90 backdrop-blur-sm"
                >
                  <div class="lucide lucide-star h-3 w-3 text-accent-foreground" style="mask: url('${contextPath}/assets/images/icons/ui/star.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-xs text-accent-foreground">추천</span>
                </div>
              </div>
            </div>
            <div class="p-6">
              <div class="flex items-center justify-between mb-3">
                <h3
                  class="text-xl group-hover:text-primary transition-colors text-foreground"
                >
                  복실이
                </h3>
                <span
                  class="text-sm px-3 py-1 rounded-full bg-muted text-muted-foreground border border-border"
                  >6살</span
                >
              </div>
              <p class="text-sm mb-4 text-primary">스피츠</p>
              <p
                class="text-sm mb-4 line-clamp-2 leading-relaxed text-muted-foreground"
              >
                하얀색 털에 갈색 반점이 있는 스피츠입니다. 목줄에 파란색 인식표
                착용 중이었습니다.
              </p>
              <div
                class="flex items-center justify-between text-xs pt-4 border-t border-border"
              >
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-map-pin h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/location.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">서울시 강서구</span>
                </div>
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-calendar h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/calendar.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">2024.01.08</span>
                </div>
              </div>
              <div
                class="mt-4 opacity-0 group-hover:opacity-100 transition-all duration-300"
              >
                <button
                  class="w-full py-2.5 text-sm rounded-lg transition-colors duration-200 border bg-red-500 text-white hover:bg-red-600 border-red-500/20"
                >
                  제보하기
                </button>
              </div>
            </div>
          </div>
          <div
            class="group rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex-shrink-0 w-[280px] cursor-pointer transform hover:-translate-y-2 bg-card border border-border"
          >
            <div class="relative h-72">
              <img
                src="https://images.unsplash.com/photo-1574144611937-0df059b5ef3e?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtaXNzaW5nJTIwYmxhY2slMjBjYXR8ZW58MXx8fHwxNzU2ODc3Njc2fDA&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080&amp;utm_source=figma&amp;utm_medium=referral"
                alt="까망이 - 토종고양이"
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-transparent"
              ></div>
              <div
                class="absolute top-4 left-4 px-3 py-1.5 rounded-full text-xs backdrop-blur-sm border bg-red-500/95 text-white border-red-500/20"
              >
                실종
              </div>
              <button
                class="absolute top-4 right-4 p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
              >
                <div class="lucide lucide-heart h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
              </button>
              <div
                class="absolute bottom-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <button
                  class="p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
                >
                  <div class="lucide lucide-eye h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/eye.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
                </button>
              </div>
              <div
                class="absolute bottom-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div
                  class="flex items-center gap-1 px-2 py-1 rounded-full bg-accent/90 backdrop-blur-sm"
                >
                  <div class="lucide lucide-star h-3 w-3 text-accent-foreground" style="mask: url('${contextPath}/assets/images/icons/ui/star.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-xs text-accent-foreground">추천</span>
                </div>
              </div>
            </div>
            <div class="p-6">
              <div class="flex items-center justify-between mb-3">
                <h3
                  class="text-xl group-hover:text-primary transition-colors text-foreground"
                >
                  까망이
                </h3>
                <span
                  class="text-sm px-3 py-1 rounded-full bg-muted text-muted-foreground border border-border"
                  >9살</span
                >
              </div>
              <p class="text-sm mb-4 text-primary">토종고양이</p>
              <p
                class="text-sm mb-4 line-clamp-2 leading-relaxed text-muted-foreground"
              >
                검은색 털에 흰 가슴팟이 있는 고양이입니다. 사람을 무서워하지
                않습니다.
              </p>
              <div
                class="flex items-center justify-between text-xs pt-4 border-t border-border"
              >
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-map-pin h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/location.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">부산시 사하구</span>
                </div>
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-calendar h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/calendar.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">2024.01.17</span>
                </div>
              </div>
              <div
                class="mt-4 opacity-0 group-hover:opacity-100 transition-all duration-300"
              >
                <button
                  class="w-full py-2.5 text-sm rounded-lg transition-colors duration-200 border bg-red-500 text-white hover:bg-red-600 border-red-500/20"
                >
                  제보하기
                </button>
              </div>
            </div>
          </div>
          <div
            class="group rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex-shrink-0 w-[280px] cursor-pointer transform hover:-translate-y-2 bg-card border border-border"
          >
            <div class="relative h-72">
              <img
                src="https://images.unsplash.com/photo-1551717743-49959800b1f6?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtYWx0ZXNlJTIwZG9nJTIwbWlzc2luZ3xlbnwxfHx8fDE3NTY4Nzc2NzZ8MA&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080&amp;utm_source=figma&amp;utm_medium=referral"
                alt="콩이 - 말티즈"
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-transparent"
              ></div>
              <div
                class="absolute top-4 left-4 px-3 py-1.5 rounded-full text-xs backdrop-blur-sm border bg-red-500/95 text-white border-red-500/20"
              >
                실종
              </div>
              <button
                class="absolute top-4 right-4 p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
              >
                <div class="lucide lucide-heart h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
              </button>
              <div
                class="absolute bottom-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <button
                  class="p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
                >
                  <div class="lucide lucide-eye h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/eye.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
                </button>
              </div>
              <div
                class="absolute bottom-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div
                  class="flex items-center gap-1 px-2 py-1 rounded-full bg-accent/90 backdrop-blur-sm"
                >
                  <div class="lucide lucide-star h-3 w-3 text-accent-foreground" style="mask: url('${contextPath}/assets/images/icons/ui/star.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-xs text-accent-foreground">추천</span>
                </div>
              </div>
            </div>
            <div class="p-6">
              <div class="flex items-center justify-between mb-3">
                <h3
                  class="text-xl group-hover:text-primary transition-colors text-foreground"
                >
                  콩이
                </h3>
                <span
                  class="text-sm px-3 py-1 rounded-full bg-muted text-muted-foreground border border-border"
                  >7살</span
                >
              </div>
              <p class="text-sm mb-4 text-primary">말티즈</p>
              <p
                class="text-sm mb-4 line-clamp-2 leading-relaxed text-muted-foreground"
              >
                크림색 털의 말티즈입니다. 분홍색 옷을 입고 있었습니다.
              </p>
              <div
                class="flex items-center justify-between text-xs pt-4 border-t border-border"
              >
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-map-pin h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/location.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">대구시 달서구</span>
                </div>
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-calendar h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/calendar.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">2024.01.04</span>
                </div>
              </div>
              <div
                class="mt-4 opacity-0 group-hover:opacity-100 transition-all duration-300"
              >
                <button
                  class="w-full py-2.5 text-sm rounded-lg transition-colors duration-200 border bg-red-500 text-white hover:bg-red-600 border-red-500/20"
                >
                  제보하기
                </button>
              </div>
            </div>
          </div>
          <div
            class="group rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex-shrink-0 w-[280px] cursor-pointer transform hover:-translate-y-2 bg-card border border-border"
          >
            <div class="relative h-72">
              <img
                src="https://images.unsplash.com/photo-1573865526739-10659fec78a5?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxwZXJzaWFuJTIwY2F0JTIwbWlzc2luZ3xlbnwxfHx8fDE3NTY4Nzc2NzZ8MA&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080&amp;utm_source=figma&amp;utm_medium=referral"
                alt="털뭉치 - 페르시안"
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-transparent"
              ></div>
              <div
                class="absolute top-4 left-4 px-3 py-1.5 rounded-full text-xs backdrop-blur-sm border bg-red-500/95 text-white border-red-500/20"
              >
                실종
              </div>
              <button
                class="absolute top-4 right-4 p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
              >
                <div class="lucide lucide-heart h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
              </button>
              <div
                class="absolute bottom-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <button
                  class="p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
                >
                  <div class="lucide lucide-eye h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/eye.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
                </button>
              </div>
              <div
                class="absolute bottom-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div
                  class="flex items-center gap-1 px-2 py-1 rounded-full bg-accent/90 backdrop-blur-sm"
                >
                  <div class="lucide lucide-star h-3 w-3 text-accent-foreground" style="mask: url('${contextPath}/assets/images/icons/ui/star.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-xs text-accent-foreground">추천</span>
                </div>
              </div>
            </div>
            <div class="p-6">
              <div class="flex items-center justify-between mb-3">
                <h3
                  class="text-xl group-hover:text-primary transition-colors text-foreground"
                >
                  털뭉치
                </h3>
                <span
                  class="text-sm px-3 py-1 rounded-full bg-muted text-muted-foreground border border-border"
                  >1살</span
                >
              </div>
              <p class="text-sm mb-4 text-primary">페르시안</p>
              <p
                class="text-sm mb-4 line-clamp-2 leading-relaxed text-muted-foreground"
              >
                긴털의 회색 페르시안 고양이입니다. 눈이 크고 둥글어요.
              </p>
              <div
                class="flex items-center justify-between text-xs pt-4 border-t border-border"
              >
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-map-pin h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/location.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">경기도 수원시</span>
                </div>
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-calendar h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/calendar.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">2024.01.05</span>
                </div>
              </div>
              <div
                class="mt-4 opacity-0 group-hover:opacity-100 transition-all duration-300"
              >
                <button
                  class="w-full py-2.5 text-sm rounded-lg transition-colors duration-200 border bg-red-500 text-white hover:bg-red-600 border-red-500/20"
                >
                  제보하기
                </button>
              </div>
            </div>
          </div>
          <div
            class="group rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex-shrink-0 w-[280px] cursor-pointer transform hover:-translate-y-2 bg-card border border-border"
          >
            <div class="relative h-72">
              <img
                src="https://images.unsplash.com/photo-1543466835-00a7907e9de1?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtaXNzaW5nJTIwZG9nJTIwbWl4fGVufDF8fHx8MTc1Njg3NzY3Nnww&amp;ixlib=rb-4.1.0&amp;q=80&amp;w=1080&amp;utm_source=figma&amp;utm_medium=referral"
                alt="바둑이 - 잡종견"
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-transparent"
              ></div>
              <div
                class="absolute top-4 left-4 px-3 py-1.5 rounded-full text-xs backdrop-blur-sm border bg-red-500/95 text-white border-red-500/20"
              >
                실종
              </div>
              <button
                class="absolute top-4 right-4 p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
              >
                <div class="lucide lucide-heart h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/heart.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
              </button>
              <div
                class="absolute bottom-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <button
                  class="p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm"
                >
                  <div class="lucide lucide-eye h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/eye.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
                </button>
              </div>
              <div
                class="absolute bottom-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div
                  class="flex items-center gap-1 px-2 py-1 rounded-full bg-accent/90 backdrop-blur-sm"
                >
                  <div class="lucide lucide-star h-3 w-3 text-accent-foreground" style="mask: url('${contextPath}/assets/images/icons/ui/star.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-xs text-accent-foreground">추천</span>
                </div>
              </div>
            </div>
            <div class="p-6">
              <div class="flex items-center justify-between mb-3">
                <h3
                  class="text-xl group-hover:text-primary transition-colors text-foreground"
                >
                  바둑이
                </h3>
                <span
                  class="text-sm px-3 py-1 rounded-full bg-muted text-muted-foreground border border-border"
                  >1살</span
                >
              </div>
              <p class="text-sm mb-4 text-primary">잡종견</p>
              <p
                class="text-sm mb-4 line-clamp-2 leading-relaxed text-muted-foreground"
              >
                흑백 얼룩무늬의 중형견입니다. 꼬리가 말려있고 귀가 서있어요.
              </p>
              <div
                class="flex items-center justify-between text-xs pt-4 border-t border-border"
              >
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-map-pin h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/location.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">광주시 북구</span>
                </div>
                <div class="flex items-center gap-2">
                  <div class="lucide lucide-calendar h-4 w-4 text-primary" style="mask: url('${contextPath}/assets/images/icons/ui/calendar.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span class="text-muted-foreground">2024.01.08</span>
                </div>
              </div>
              <div
                class="mt-4 opacity-0 group-hover:opacity-100 transition-all duration-300"
              >
                <button
                  class="w-full py-2.5 text-sm rounded-lg transition-colors duration-200 border bg-red-500 text-white hover:bg-red-600 border-red-500/20"
                >
                  제보하기
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="flex justify-center mt-12 gap-3">
      <button
        class="w-3 h-3 rounded-full transition-all duration-200 hover:scale-125 bg-primary shadow-lg"
      ></button
      ><button
        class="w-3 h-3 rounded-full transition-all duration-200 hover:scale-125 bg-muted-foreground/30 hover:bg-muted-foreground/50"
      ></button
      ><button
        class="w-3 h-3 rounded-full transition-all duration-200 hover:scale-125 bg-muted-foreground/30 hover:bg-muted-foreground/50"
      ></button
      ><button
        class="w-3 h-3 rounded-full transition-all duration-200 hover:scale-125 bg-muted-foreground/30 hover:bg-muted-foreground/50"
      ></button>
    </div>
  </div>
</section>
<section class="w-full py-20 px-4 sm:px-6 lg:px-8 relative bg-muted/30">
  <div
    class="absolute inset-0 opacity-3"
    style="
      background-image: url('data:image/svg+xml,%3Csvg width=\'40\' height=\'40\' viewBox=\'0 0 40 40\' xmlns=\'http://www.w3.org/2000/svg\'%3E%3Cg fill=\'%23A4907C\' fill-opacity=\'0.2\'%3E%3Cpath d=\'M20 20c0-5.5-4.5-10-10-10s-10 4.5-10 10 4.5 10 10 10 10-4.5 10-10zm10 0c0-5.5-4.5-10-10-10s-10 4.5-10 10 4.5 10 10 10 10-4.5 10-10z\'/%3E%3C/g%3E%3C/svg%3E');
    "
  ></div>
  <div class="container mx-auto relative">
    <div class="text-center mb-16">
      <h2 class="text-4xl lg:text-5xl mb-4 text-foreground">커뮤니티</h2>
      <p
        class="text-xl mb-10 max-w-2xl mx-auto text-muted-foreground leading-relaxed"
      >
        보호소의 일상과 반려동물 이야기들을 나누어보세요
      </p>
    </div>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-12">
      <div
        class="bg-card border border-border rounded-xl p-6 hover:shadow-lg transition-all duration-200 cursor-pointer hover:border-primary/30 group"
      >
        <div class="flex items-start justify-between mb-3">
          <span
            class="text-xs px-2 py-1 rounded-full bg-primary/10 text-primary"
            >입양 후기</span
          >
          <div class="w-2 h-2 bg-primary rounded-full flex-shrink-0"></div>
        </div>
        <h3
          class="text-lg mb-3 group-hover:text-primary transition-colors line-clamp-2"
        >
          새로운 가족을 만난 골든 리트리버 "행복이" 근황
        </h3>
        <p class="text-sm text-muted-foreground mb-4 line-clamp-3">
          작년에 입양된 행복이가 새 가족과 함께 행복하게 지내고 있다는 소식을
          전해드립니다. 매일 산책하며 건강하게 자라고 있어요.
        </p>
        <div
          class="flex items-center justify-between text-xs text-muted-foreground"
        >
          <div class="flex items-center gap-4">
            <span>사랑보호소</span><span>2024.01.25</span>
          </div>
          <div class="flex items-center gap-3">
            <div class="flex items-center gap-1">
              <div class="lucide lucide-message-square h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/message-square.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>23</span>
            </div>
            <div class="flex items-center gap-1">
              <div class="lucide lucide-users h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/users.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>1024</span>
            </div>
          </div>
        </div>
      </div>
      <div
        class="bg-card border border-border rounded-xl p-6 hover:shadow-lg transition-all duration-200 cursor-pointer hover:border-primary/30 group"
      >
        <div class="flex items-start justify-between mb-3">
          <span
            class="text-xs px-2 py-1 rounded-full bg-accent/10 text-accent-foreground"
            >봉사 후기</span
          >
          <div class="w-2 h-2 bg-primary rounded-full flex-shrink-0"></div>
        </div>
        <h3
          class="text-lg mb-3 group-hover:text-primary transition-colors line-clamp-2"
        >
          보호소 봉사활동 후기 - 따뜻한 하루
        </h3>
        <p class="text-sm text-muted-foreground mb-4 line-clamp-3">
          오늘 처음으로 보호소 봉사활동에 참여했습니다. 아이들과 함께한 시간이
          정말 소중했고, 다음에도 꼭 참여하고 싶어요.
        </p>
        <div
          class="flex items-center justify-between text-xs text-muted-foreground"
        >
          <div class="flex items-center gap-4">
            <span>김민수</span><span>2024.01.24</span>
          </div>
          <div class="flex items-center gap-3">
            <div class="flex items-center gap-1">
              <div class="lucide lucide-message-square h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/message-square.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>15</span>
            </div>
            <div class="flex items-center gap-1">
              <div class="lucide lucide-users h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/users.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>567</span>
            </div>
          </div>
        </div>
      </div>
      <div
        class="bg-card border border-border rounded-xl p-6 hover:shadow-lg transition-all duration-200 cursor-pointer hover:border-primary/30 group"
      >
        <div class="flex items-start justify-between mb-3">
          <span
            class="text-xs px-2 py-1 rounded-full bg-secondary/30 text-secondary-foreground"
            >보호일지</span
          >
          <div class="w-2 h-2 bg-primary rounded-full flex-shrink-0"></div>
        </div>
        <h3
          class="text-lg mb-3 group-hover:text-primary transition-colors line-clamp-2"
        >
          구조견 "초코"의 치료 과정 기록
        </h3>
        <p class="text-sm text-muted-foreground mb-4 line-clamp-3">
          길에서 발견된 초코가 건강을 되찾아가는 과정을 기록합니다. 많은 분들의
          관심과 후원 덕분에 회복 중이에요.
        </p>
        <div
          class="flex items-center justify-between text-xs text-muted-foreground"
        >
          <div class="flex items-center gap-4">
            <span>동물병원 김수의사</span><span>2024.01.23</span>
          </div>
          <div class="flex items-center gap-3">
            <div class="flex items-center gap-1">
              <div class="lucide lucide-message-square h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/message-square.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>31</span>
            </div>
            <div class="flex items-center gap-1">
              <div class="lucide lucide-users h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/users.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>891</span>
            </div>
          </div>
        </div>
      </div>
      <div
        class="bg-card border border-border rounded-xl p-6 hover:shadow-lg transition-all duration-200 cursor-pointer hover:border-primary/30 group"
      >
        <div class="flex items-start justify-between mb-3">
          <span
            class="text-xs px-2 py-1 rounded-full bg-muted text-muted-foreground"
            >보호소 타임라인</span
          >
        </div>
        <h3
          class="text-lg mb-3 group-hover:text-primary transition-colors line-clamp-2"
        >
          보호소 겨울나기 준비 완료!
        </h3>
        <p class="text-sm text-muted-foreground mb-4 line-clamp-3">
          추운 겨울을 맞아 보온용품과 사료 후원에 감사드립니다. 덕분에 아이들이
          따뜻하게 겨울을 날 수 있을 것 같아요.
        </p>
        <div
          class="flex items-center justify-between text-xs text-muted-foreground"
        >
          <div class="flex items-center gap-4">
            <span>희망보호소</span><span>2024.01.22</span>
          </div>
          <div class="flex items-center gap-3">
            <div class="flex items-center gap-1">
              <div class="lucide lucide-message-square h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/message-square.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>42</span>
            </div>
            <div class="flex items-center gap-1">
              <div class="lucide lucide-users h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/users.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>1156</span>
            </div>
          </div>
        </div>
      </div>
      <div
        class="bg-card border border-border rounded-xl p-6 hover:shadow-lg transition-all duration-200 cursor-pointer hover:border-primary/30 group"
      >
        <div class="flex items-start justify-between mb-3">
          <span
            class="text-xs px-2 py-1 rounded-full bg-muted text-muted-foreground"
            >질문과 답변</span
          >
        </div>
        <h3
          class="text-lg mb-3 group-hover:text-primary transition-colors line-clamp-2"
        >
          강아지 훈련 방법에 대해 질문있어요
        </h3>
        <p class="text-sm text-muted-foreground mb-4 line-clamp-3">
          새로 입양한 강아지가 밤에 자꾸 울어서 고민입니다. 좋은 훈련 방법이나
          조언 있으시면 공유해주세요.
        </p>
        <div
          class="flex items-center justify-between text-xs text-muted-foreground"
        >
          <div class="flex items-center gap-4">
            <span>이수진</span><span>2024.01.21</span>
          </div>
          <div class="flex items-center gap-3">
            <div class="flex items-center gap-1">
              <div class="lucide lucide-message-square h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/message-square.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>28</span>
            </div>
            <div class="flex items-center gap-1">
              <div class="lucide lucide-users h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/users.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>445</span>
            </div>
          </div>
        </div>
      </div>
      <div
        class="bg-card border border-border rounded-xl p-6 hover:shadow-lg transition-all duration-200 cursor-pointer hover:border-primary/30 group"
      >
        <div class="flex items-start justify-between mb-3">
          <span
            class="text-xs px-2 py-1 rounded-full bg-muted text-muted-foreground"
            >보호소 타임라인</span
          >
        </div>
        <h3
          class="text-lg mb-3 group-hover:text-primary transition-colors line-clamp-2"
        >
          겨울철 유기동물 구조 활동 현황
        </h3>
        <p class="text-sm text-muted-foreground mb-4 line-clamp-3">
          추운 겨울, 길거리에서 힘들어하는 아이들을 구조하고 있습니다. 시민
          여러분의 신고와 관심이 큰 도움이 됩니다.
        </p>
        <div
          class="flex items-center justify-between text-xs text-muted-foreground"
        >
          <div class="flex items-center gap-4">
            <span>동물구조대</span><span>2024.01.20</span>
          </div>
          <div class="flex items-center gap-3">
            <div class="flex items-center gap-1">
              <div class="lucide lucide-message-square h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/message-square.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>56</span>
            </div>
            <div class="flex items-center gap-1">
              <div class="lucide lucide-users h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/users.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>1789</span>
            </div>
          </div>
        </div>
      </div>
      <div
        class="bg-card border border-border rounded-xl p-6 hover:shadow-lg transition-all duration-200 cursor-pointer hover:border-primary/30 group"
      >
        <div class="flex items-start justify-between mb-3">
          <span
            class="text-xs px-2 py-1 rounded-full bg-primary/10 text-primary"
            >입양 후기</span
          >
        </div>
        <h3
          class="text-lg mb-3 group-hover:text-primary transition-colors line-clamp-2"
        >
          새로 입양된 고양이 "달빛이" 적응기
        </h3>
        <p class="text-sm text-muted-foreground mb-4 line-clamp-3">
          한 달 전 입양한 달빛이가 집에 완전히 적응했어요! 처음엔 숨어만 있던
          아이가 이제는 무릎 위에서 잠을 자네요.
        </p>
        <div
          class="flex items-center justify-between text-xs text-muted-foreground"
        >
          <div class="flex items-center gap-4">
            <span>박지혜</span><span>2024.01.19</span>
          </div>
          <div class="flex items-center gap-3">
            <div class="flex items-center gap-1">
              <div class="lucide lucide-message-square h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/message-square.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>19</span>
            </div>
            <div class="flex items-center gap-1">
              <div class="lucide lucide-users h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/users.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>634</span>
            </div>
          </div>
        </div>
      </div>
      <div
        class="bg-card border border-border rounded-xl p-6 hover:shadow-lg transition-all duration-200 cursor-pointer hover:border-primary/30 group"
      >
        <div class="flex items-start justify-between mb-3">
          <span
            class="text-xs px-2 py-1 rounded-full bg-muted text-muted-foreground"
            >보호소 타임라인</span
          >
        </div>
        <h3
          class="text-lg mb-3 group-hover:text-primary transition-colors line-clamp-2"
        >
          보호소 운영비 후원 현황 공지
        </h3>
        <p class="text-sm text-muted-foreground mb-4 line-clamp-3">
          12월 한 달간 따뜻한 후원을 해주신 모든 분들께 감사드립니다. 덕분에
          겨울철 난방비와 사료비를 충당할 수 있었습니다.
        </p>
        <div
          class="flex items-center justify-between text-xs text-muted-foreground"
        >
          <div class="flex items-center gap-4">
            <span>희망보호소</span><span>2024.01.18</span>
          </div>
          <div class="flex items-center gap-3">
            <div class="flex items-center gap-1">
              <div class="lucide lucide-message-square h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/message-square.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>38</span>
            </div>
            <div class="flex items-center gap-1">
              <div class="lucide lucide-users h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/users.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>987</span>
            </div>
          </div>
        </div>
      </div>
      <div
        class="bg-card border border-border rounded-xl p-6 hover:shadow-lg transition-all duration-200 cursor-pointer hover:border-primary/30 group"
      >
        <div class="flex items-start justify-between mb-3">
          <span
            class="text-xs px-2 py-1 rounded-full bg-primary/10 text-primary"
            >입양 후기</span
          >
        </div>
        <h3
          class="text-lg mb-3 group-hover:text-primary transition-colors line-clamp-2"
        >
          우리 집 새 식구 "복이" 이야기
        </h3>
        <p class="text-sm text-muted-foreground mb-4 line-clamp-3">
          3개월 전 입양한 복이가 우리 가족에게 가져다준 행복은 말로 표현할 수
          없어요. 입양을 고민하시는 분들께 추천드려요!
        </p>
        <div
          class="flex items-center justify-between text-xs text-muted-foreground"
        >
          <div class="flex items-center gap-4">
            <span>최민정</span><span>2024.01.17</span>
          </div>
          <div class="flex items-center gap-3">
            <div class="flex items-center gap-1">
              <div class="lucide lucide-message-square h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/message-square.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>27</span>
            </div>
            <div class="flex items-center gap-1">
              <div class="lucide lucide-users h-3 w-3" style="mask: url('${contextPath}/assets/images/icons/ui/users.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div><span>756</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="text-center">
      <button
        data-slot="button"
        class="inline-flex items-center justify-center gap-2 whitespace-nowrap font-medium disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg:not([class*='size-'])]:size-4 shrink-0 [&amp;_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive hover:bg-primary/90 h-10 has-[&gt;svg]:px-4 text-base px-8 py-4 rounded-full shadow-lg hover:shadow-xl transition-all duration-200 hover:scale-105 bg-primary text-primary-foreground"
      >
        더 많은 글 보기<div class="lucide lucide-arrow-right h-5 w-5 ml-3" style="mask: url('${contextPath}/assets/images/icons/ui/arrow-right.svg') no-repeat center; mask-size: contain; background-color: currentColor;"></div>
      </button>
    </div>
  </div>
</section>
