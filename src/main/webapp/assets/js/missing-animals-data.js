// 분실동물 샘플 데이터 및 AJAX 기능 (분실동물 조회 API 스펙 기반)

class MissingAnimalsData {
    constructor() {
        this.sampleData = {
            missingAnimals: [
                {
                    animal_seq: "202409150001",
                    thumbnail: "https://via.placeholder.com/300x200/FF6B6B/FFFFFF?text=분실강아지1",
                    lost_ymd: "20240915",
                    lost_place: "서울특별시 강남구 역삼동 테헤란로 근처 공원",
                    species_nm: "개",
                    breeds_nm: "포메라니안",
                    sex_nm: "암컷",
                    age_info: "3세",
                    bdwgh_info: "5kg",
                    tmpr_protect_yn: "N",
                    main_color: "갈색",
                    spot_color: "흰색",
                    tmpr_protect_place: "",
                    tmpr_protect_charge_nm: "",
                    tmpr_protect_charge_tel: "",
                    etc_info: "목에 빨간색 목걸이를 착용하고 있음. 오른쪽 귀에 작은 점이 있음. 사람을 잘 따르는 성격",
                    owner_nm: "김민수",
                    owner_tel: "010-1234-5678",
                    area_nm: "서울특별시",
                    sigun_nm: "강남구",
                    emd_nm: "역삼동"
                },
                {
                    animal_seq: "202409140002",
                    thumbnail: "https://via.placeholder.com/300x200/FF6B6B/FFFFFF?text=분실고양이1",
                    lost_ymd: "20240914",
                    lost_place: "부산광역시 해운대구 우동 마린시티 아파트 단지",
                    species_nm: "고양이",
                    breeds_nm: "러시안블루",
                    sex_nm: "수컷",
                    age_info: "2세",
                    bdwgh_info: "3kg",
                    tmpr_protect_yn: "N",
                    main_color: "회색",
                    spot_color: "흰색",
                    tmpr_protect_place: "",
                    tmpr_protect_charge_nm: "",
                    tmpr_protect_charge_tel: "",
                    etc_info: "왼쪽 앞발에 흰색 양말 무늬. 꼬리 끝이 까만색. 매우 친근한 성격으로 사람을 잘 따름",
                    owner_nm: "박영희",
                    owner_tel: "010-2345-6789",
                    area_nm: "부산광역시",
                    sigun_nm: "해운대구",
                    emd_nm: "우동"
                },
                {
                    animal_seq: "202409130003",
                    thumbnail: "https://via.placeholder.com/300x200/FF6B6B/FFFFFF?text=분실강아지2",
                    lost_ymd: "20240913",
                    lost_place: "대구광역시 수성구 범어동 수성못 산책로",
                    species_nm: "개",
                    breeds_nm: "래브라도 리트리버",
                    sex_nm: "수컷",
                    age_info: "3세",
                    bdwgh_info: "15kg",
                    tmpr_protect_yn: "N",
                    main_color: "검은색",
                    spot_color: "흰색",
                    tmpr_protect_place: "",
                    tmpr_protect_charge_nm: "",
                    tmpr_protect_charge_tel: "",
                    etc_info: "가슴에 하얀색 하트 모양 무늬. 오른쪽 뒷다리를 약간 절음. 평소 산책을 좋아하며 활발한 성격",
                    owner_nm: "이철수",
                    owner_tel: "010-3456-7890",
                    area_nm: "대구광역시",
                    sigun_nm: "수성구",
                    emd_nm: "범어동"
                },
                {
                    animal_seq: "202409120004",
                    thumbnail: "https://via.placeholder.com/300x200/FF6B6B/FFFFFF?text=분실고양이2",
                    lost_ymd: "20240912",
                    lost_place: "인천광역시 남동구 구월동 인하대학교 정문 앞",
                    species_nm: "고양이",
                    breeds_nm: "코리안숏헤어",
                    sex_nm: "암컷",
                    age_info: "1세",
                    bdwgh_info: "4kg",
                    tmpr_protect_yn: "N",
                    main_color: "회색",
                    spot_color: "검은색",
                    tmpr_protect_place: "",
                    tmpr_protect_charge_nm: "",
                    tmpr_protect_charge_tel: "",
                    etc_info: "왼쪽 눈 위에 검은 점이 있음. 꼬리가 짧음. 조금 겁이 많은 성격으로 큰 소리를 싫어함",
                    owner_nm: "최지영",
                    owner_tel: "010-4567-8901",
                    area_nm: "인천광역시",
                    sigun_nm: "남동구",
                    emd_nm: "구월동"
                },
                {
                    animal_seq: "202409110005",
                    thumbnail: "https://via.placeholder.com/300x200/FF6B6B/FFFFFF?text=분실강아지3",
                    lost_ymd: "20240911",
                    lost_place: "광주광역시 서구 치평동 광주천 산책로",
                    species_nm: "개",
                    breeds_nm: "진돗개",
                    sex_nm: "암컷",
                    age_info: "4세",
                    bdwgh_info: "8kg",
                    tmpr_protect_yn: "N",
                    main_color: "노란색",
                    spot_color: "흰색",
                    tmpr_protect_place: "",
                    tmpr_protect_charge_nm: "",
                    tmpr_protect_charge_tel: "",
                    etc_info: "목에 파란색 목줄 착용. 귀가 한쪽만 서있음. 사람을 매우 좋아하고 온순한 성격",
                    owner_nm: "정미경",
                    owner_tel: "010-5678-9012",
                    area_nm: "광주광역시",
                    sigun_nm: "서구",
                    emd_nm: "치평동"
                }
            ],
            regions: [
                { code: "6110000", name: "서울특별시" },
                { code: "6260000", name: "부산광역시" },
                { code: "6270000", name: "대구광역시" },
                { code: "6280000", name: "인천광역시" },
                { code: "6290000", name: "광주광역시" },
                { code: "6300000", name: "대전광역시" },
                { code: "6310000", name: "울산광역시" }
            ],
            animalTypes: [
                { code: "417000", name: "개" },
                { code: "422400", name: "고양이" },
                { code: "429900", name: "기타" }
            ]
        };
    }

    // 분실동물 목록 조회 (필터링 포함)
    getMissingAnimals(filters = {}) {
        return new Promise((resolve) => {
            setTimeout(() => {
                let filteredAnimals = [...this.sampleData.missingAnimals];

                // 지역 필터링
                if (filters.upr_cd && filters.upr_cd !== '') {
                    const regionName = this.sampleData.regions.find(r => r.code === filters.upr_cd)?.name;
                    if (regionName) {
                        filteredAnimals = filteredAnimals.filter(animal =>
                            animal.area_nm.includes(regionName.substring(0, 2))
                        );
                    }
                }

                // 동물 종류 필터링
                if (filters.upkind && filters.upkind !== '') {
                    const animalTypeName = this.getAnimalTypeName(filters.upkind);
                    filteredAnimals = filteredAnimals.filter(animal =>
                        animal.species_nm === animalTypeName
                    );
                }

                // 분실일 필터링 (시작일)
                if (filters.bgnde && filters.bgnde !== '') {
                    filteredAnimals = filteredAnimals.filter(animal =>
                        animal.lost_ymd >= filters.bgnde.replace(/-/g, '')
                    );
                }

                // 분실일 필터링 (종료일)
                if (filters.ended && filters.ended !== '') {
                    filteredAnimals = filteredAnimals.filter(animal =>
                        animal.lost_ymd <= filters.ended.replace(/-/g, '')
                    );
                }

                // 성별 필터링
                if (filters.sex_cd && filters.sex_cd !== '') {
                    const genderName = this.getGenderName(filters.sex_cd);
                    filteredAnimals = filteredAnimals.filter(animal =>
                        animal.sex_nm === genderName
                    );
                }

                // 날짜순 정렬 (최신순)
                filteredAnimals.sort((a, b) => b.lost_ymd.localeCompare(a.lost_ymd));

                const result = {
                    items: filteredAnimals,
                    regions: this.sampleData.regions,
                    animalTypes: this.sampleData.animalTypes,
                    totalCount: filteredAnimals.length,
                    searchParams: filters
                };

                resolve(result);
            }, 300);
        });
    }

    // 특정 분실동물 상세 정보 조회
    getMissingAnimalDetail(animal_seq) {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                const animal = this.sampleData.missingAnimals.find(a => a.animal_seq === animal_seq);
                if (animal) {
                    resolve(animal);
                } else {
                    reject(new Error('Animal not found'));
                }
            }, 200);
        });
    }

    // 지역 목록 조회
    getRegions() {
        return new Promise((resolve) => {
            setTimeout(() => {
                resolve(this.sampleData.regions);
            }, 100);
        });
    }

    // 동물 종류 목록 조회
    getAnimalTypes() {
        return new Promise((resolve) => {
            setTimeout(() => {
                resolve(this.sampleData.animalTypes);
            }, 100);
        });
    }

    // 날짜 포맷팅 (YYYYMMDD -> YYYY-MM-DD)
    formatDate(dateString) {
        if (!dateString || dateString.length !== 8) return dateString;
        return `${dateString.substring(0, 4)}-${dateString.substring(4, 6)}-${dateString.substring(6, 8)}`;
    }

    // 동물 종류 코드를 이름으로 변환
    getAnimalTypeName(kindCd) {
        const animalType = this.sampleData.animalTypes.find(type => type.code === kindCd);
        return animalType ? animalType.name : '기타';
    }

    // 성별 코드를 이름으로 변환
    getGenderName(sexCd) {
        switch (sexCd) {
            case 'M': return '수컷';
            case 'F': return '암컷';
            default: return '미상';
        }
    }

    // 임시보호 여부 확인
    getTmpProtectStatus(tmpr_protect_yn) {
        return tmpr_protect_yn === 'Y' ? '임시보호 중' : '분실 상태';
    }
}

// 전역 인스턴스 생성
window.missingAnimalsData = new MissingAnimalsData();