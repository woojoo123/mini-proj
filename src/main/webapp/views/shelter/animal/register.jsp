<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>강아지 등록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/animal/upload.css">
</head>

<body>

    <header class="page card">
        <h1>강아지 등록</h1>
        <p class="muted">새로운 강아지의 정보를 등록해주세요</p>
    </header>

    <main class="container">
        <!-- Sidebar -->
        <aside class="sidebar card">
            <div class="sidebar-inner">
                <ul class="stepnav">
                    <li><button class="step-btn active" data-goto="1"><span class="dot">1</span>기본 정보</button></li>
                    <li><button class="step-btn" data-goto="2"><span class="dot">2</span>사진 등록</button></li>
                    <li><button class="step-btn" data-goto="3"><span class="dot">3</span>건강 정보</button></li>
                    <li><button class="step-btn" data-goto="4"><span class="dot">4</span>성격 및 행동</button></li>
                    <li><button class="step-btn" data-goto="5"><span class="dot">5</span>입소 정보</button></li>
                    <li><button class="step-btn" data-goto="6"><span class="dot">6</span>입양 정보</button></li>
                </ul>
                <button class="submit">등록 완료</button>
        </aside>

        <!-- Content -->
        <section class="content card">
            <div class="progress"><i id="bar" style="width:16%"></i></div>

            <!-- Step 1: 기본 정보 -->
            <section class="section active" data-step="1">
                <h2>기본 정보</h2>
                <div class="grid">
                    <div class="field">
                        <label class="label" for="name">이름 <span class="muted">*</span></label>
                        <input id="name" type="text" placeholder="강아지 이름을 입력하세요" required>
                    </div>
                    <div class="field">
                        <label class="label" for="breed">견종 <span class="muted">*</span></label>
                        <select id="breed" required>
                            <option value="">견종을 선택하세요</option>
                            <option>믹스</option>
                            <option>말티즈</option>
                            <option>푸들</option>
                            <option>시바</option>
                        </select>
                    </div>

                    <div class="field">
                        <label class="label">성별 <span class="muted">*</span></label>
                        <div class="inline">
                            <label class="chip"><input type="radio" name="sex" value="m" required> 수컷</label>
                            <label class="chip"><input type="radio" name="sex" value="f"> 암컷</label>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label" for="age">나이</label>
                        <input id="age" type="text" placeholder="예: 만 2년 6개월">
                        <div class="hint">또는 추정 생년월로 기록</div>
                    </div>

                    <div class="field">
                        <span class="label">크기 (소형견:10kg / 중형견:10~25kg / 대형견:25kg)</span>
                        <div class="inline">
                            <label class="chip"><input type="radio" name="size" value="s"> 소형견</label>
                            <label class="chip"><input type="radio" name="size" value="m"> 중형견</label>
                            <label class="chip"><input type="radio" name="size" value="l"> 대형견</label>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label" for="weight">체중</label>
                        <input id="weight" type="text" placeholder="예: 15kg">
                    </div>

                    <div class="field">
                        <label class="label" for="traits">털색/외형 특징</label>
                        <input id="traits" type="text" placeholder="예: 갈색+흰색, 귀가 처짐">
                    </div>
                    <div class="field">
                        <label class="label" for="bio">간단한 소개</label>
                        <textarea id="bio" placeholder="성격이나 특징을 간단히 소개해주세요"></textarea>
                    </div>
                </div>

                <div class="actions">
                    <button class="btn ghost" data-prev disabled>이전</button>
                    <button class="btn primary" data-next>다음</button>
                </div>
            </section>

            <!-- Step 2: 사진 등록 -->
            <section class="section" data-step="2">
                <h2>사진 등록</h2>
                <p class="muted" style="margin-top:-8px">여러 장 업로드하세요. 첫 번째가 대표로 사용됩니다.</p>
                <div class="field" style="margin-top:var(--s3)">
                    <label class="label">업로드</label>
                    <input type="file" multiple accept="image/*">
                    <div class="hint">JPG/PNG, 파일당 최대 5MB</div>
                </div>
                <div class="actions">
                    <button class="btn" data-prev>이전</button>
                    <button class="btn primary" data-next>다음</button>
                </div>
            </section>

            <!-- Step 3: 건강 정보 -->
            <section class="section" data-step="3">
                <h2>건강 정보</h2>
                <div class="grid">
                    <div class="field">
                        <label class="label"><input type="checkbox"> 중성화 완료</label>
                    </div>
                    <div class="field">
                        <span class="label">건강 상태</span>
                        <div class="inline">
                            <label class="chip"><input type="radio" name="health" value="very"> 매우 건강</label>
                            <label class="chip"><input type="radio" name="health" value="normal"> 보통</label>
                            <label class="chip"><input type="radio" name="health" value="need"> 치료 필요</label>
                        </div>
                    </div>

                    <div class="field">
                        <span class="label">예방접종 현황</span>
                        <div class="inline" style="flex-wrap:wrap">
                            <label class="chip"><input type="checkbox"> DHPP</label>
                            <label class="chip"><input type="checkbox"> 광견병</label>
                            <label class="chip"><input type="checkbox"> 켄넬코프</label>
                            <label class="chip"><input type="checkbox"> 기타</label>
                        </div>
                    </div>

                    <div class="field">
                        <label class="label" for="chip">마이크로칩 ID</label>
                        <input id="chip" type="text" placeholder="15자리 숫자 입력">
                    </div>

                    <div class="field" style="grid-column:1/-1">
                        <label class="label" for="med">의료 기록 및 특이사항</label>
                        <textarea id="med" placeholder="과거 병력, 현재 치료 중인 질병, 복용 약 등"></textarea>
                    </div>
                </div>
                <div class="actions">
                    <button class="btn" data-prev>이전</button>
                    <button class="btn primary" data-next>다음</button>
                </div>
            </section>

            <!-- Step 4: 성격 및 행동 -->
            <section class="section" data-step="4">
                <h2>성격 및 행동</h2>
                <div class="grid">
                    <div class="field">
                        <span class="label">성격 특성(복수 선택)</span>
                        <div class="inline" style="flex-wrap:wrap">
                            <label class="chip"><input type="checkbox"> 활발함</label>
                            <label class="chip"><input type="checkbox"> 온순함</label>
                            <label class="chip"><input type="checkbox"> 친화적</label>
                            <label class="chip"><input type="checkbox"> 독립적</label>
                            <label class="chip"><input type="checkbox"> 장난기 많음</label>
                        </div>
                    </div>
                    <div class="field">
                        <span class="label">훈련 수준</span>
                        <div class="inline">
                            <label class="chip"><input type="radio" name="train" value="none"> 훈련 없음</label>
                            <label class="chip"><input type="radio" name="train" value="basic"> 기본 훈련</label>
                            <label class="chip"><input type="radio" name="train" value="adv"> 고급 훈련</label>
                        </div>
                    </div>
                    <div class="field">
                        <span class="label">활동량</span>
                        <div class="inline">
                            <label class="chip"><input type="radio" name="energy" value="low"> 낮음</label>
                            <label class="chip"><input type="radio" name="energy" value="mid"> 보통</label>
                            <label class="chip"><input type="radio" name="energy" value="high"> 높음</label>
                        </div>
                    </div>
                    <div class="field">
                        <span class="label">사회성</span>
                        <div class="inline" style="flex-wrap:wrap">
                            <label class="chip"><input type="checkbox"> 아이들과 잘 지냄</label>
                            <label class="chip"><input type="checkbox"> 다른 강아지와 잘 지냄</label>
                            <label class="chip"><input type="checkbox"> 고양이와 잘 지냄</label>
                        </div>
                    </div>

                    <div class="field" style="grid-column:1/-1">
                        <label class="label" for="incident">입질/사고 이력</label>
                        <textarea id="incident" placeholder="있다면 시점/상황/강도 등 상세 기록"></textarea>
                    </div>
                </div>
                <div class="actions">
                    <button class="btn" data-prev>이전</button>
                    <button class="btn primary" data-next>다음</button>
                </div>
            </section>

            <!-- Step 5: 입소 정보 -->
            <section class="section" data-step="5">
                <h2>입소 정보</h2>
                <div class="grid">
                    <div class="field">
                        <label class="label" for="intakeDate">입소일자</label>
                        <input id="intakeDate" type="date">
                    </div>
                    <div class="field">
                        <label class="label" for="shelter">보호소명</label>
                        <select id="shelter">
                            <option>보호소를 선택하세요</option>
                        </select>
                    </div>
                    <div class="field">
                        <span class="label">입소 유형</span>
                        <div class="inline">
                            <label class="chip"><input type="radio" name="intype"> 구조</label>
                            <label class="chip"><input type="radio" name="intype"> 유기</label>
                            <label class="chip"><input type="radio" name="intype"> 파양</label>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label" for="spot">구조장소</label>
                        <input id="spot" type="text" placeholder="예: 서울시 강남구 역삼동">
                    </div>
                    <div class="field" style="grid-column:1/-1">
                        <label class="label" for="intakeDesc">구조 경위 및 상황</label>
                        <textarea id="intakeDesc" placeholder="상황/특이사항을 상세히 기록하세요"></textarea>
                    </div>
                    <div class="field">
                        <label class="label" for="staff">담당자</label>
                        <input id="staff" type="text" placeholder="담당자 이름">
                    </div>
                </div>
                <div class="actions">
                    <button class="btn" data-prev>이전</button>
                    <button class="btn primary" data-next>다음</button>
                </div>
            </section>

            <!-- Step 6: 입양 정보 -->
            <section class="section" data-step="6">
                <h2>입양 정보</h2>
                <div class="grid">
                    <div class="field">
                        <span class="label">입양 상태</span>
                        <div class="inline" style="flex-wrap:wrap">
                            <label class="chip"><input type="radio" name="adopt" value="prep"> 입양 준비 중</label>
                            <label class="chip"><input type="radio" name="adopt" value="open"> 입양 가능</label>
                            <label class="chip"><input type="radio" name="adopt" value="progress"> 입양 진행 중</label>
                            <label class="chip"><input type="radio" name="adopt" value="done"> 입양 완료</label>
                        </div>
                    </div>
                    <div class="field" style="grid-column:1/-1">
                        <label class="label" for="adoptNote">특별 요구사항 및 입양 조건</label>
                        <textarea id="adoptNote" placeholder="주의사항/권장 환경 등"></textarea>
                    </div>
                </div>
                <div class="actions">
                    <button class="btn" data-prev>이전</button>
                    <button class="btn primary">저장</button>
                </div>
            </section>
        </section>

        <script src="${pageContext.request.contextPath}/assets/js/shelter/animal/upload.js"></script>
    </main>

    <!-- ===== (선택) 40줄짜리 순정 JS: 스텝 이동 & 진행바 ===== -->
    
</body>

</html>