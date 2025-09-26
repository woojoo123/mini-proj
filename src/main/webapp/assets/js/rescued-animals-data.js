// 구조된 동물 샘플 데이터 및 AJAX 기능

class RescuedAnimalsData {
    constructor() {
        this.sampleData = {
            items: [
                {
                    id: 1,
                    name: "하양이",
                    rescueDate: "2024-09-15",
                    rescueLocation: "부산시 해운대구",
                    rescueDescription: "교통사고로 다친 상태로 발견되어 긴급 구조했습니다. 현재 치료 중이며 회복 상태가 양호합니다.",
                    healthStatus: "치료중",
                    profileImage: "https://via.placeholder.com/120x120/F1DEC9/8D7B68?text=하양이",
                    shelterId: 1,
                    shelterName: "부산 해운대 보호소"
                },
                {
                    id: 2,
                    name: "초코",
                    rescueDate: "2024-09-14",
                    rescueLocation: "서울시 강남구",
                    rescueDescription: "길에서 혼자 떠돌고 있던 강아지를 시민이 신고하여 구조했습니다. 건강상태 양호합니다.",
                    healthStatus: "건강",
                    profileImage: "https://via.placeholder.com/120x120/F1DEC9/8D7B68?text=초코",
                    shelterId: 2,
                    shelterName: "서울 강남 보호소"
                },
                {
                    id: 3,
                    name: "밤톨이",
                    rescueDate: "2024-09-12",
                    rescueLocation: "인천시 남동구",
                    rescueDescription: "폐건물에서 새끼 고양이들과 함께 발견되었습니다. 영양실조 상태였으나 현재 회복 중입니다.",
                    healthStatus: "치료중",
                    profileImage: "https://via.placeholder.com/120x120/F1DEC9/8D7B68?text=밤톨이",
                    shelterId: 3,
                    shelterName: "인천 남동 보호소"
                },
                {
                    id: 4,
                    name: "복실이",
                    rescueDate: "2024-09-10",
                    rescueLocation: "대구시 수성구",
                    rescueDescription: "주인이 이사를 가면서 버린 것으로 추정됩니다. 성격이 온순하고 사람을 잘 따릅니다.",
                    healthStatus: "건강",
                    profileImage: "https://via.placeholder.com/120x120/F1DEC9/8D7B68?text=복실이",
                    shelterId: 4,
                    shelterName: "대구 수성 보호소"
                },
                {
                    id: 5,
                    name: "점순이",
                    rescueDate: "2024-09-08",
                    rescueLocation: "광주시 서구",
                    rescueDescription: "공사장에서 다친 상태로 발견되었습니다. 다리 부상이 있었으나 현재는 많이 회복되었습니다.",
                    healthStatus: "치료중",
                    profileImage: "https://via.placeholder.com/120x120/F1DEC9/8D7B68?text=점순이",
                    shelterId: 5,
                    shelterName: "광주 서구 보호소"
                },
                {
                    id: 6,
                    name: "귀요미",
                    rescueDate: "2024-09-05",
                    rescueLocation: "울산시 남구",
                    rescueDescription: "임시보호자가 더 이상 돌볼 수 없어 보호소로 오게 되었습니다. 건강하고 활발한 성격입니다.",
                    healthStatus: "건강",
                    profileImage: "https://via.placeholder.com/120x120/F1DEC9/8D7B68?text=귀요미",
                    shelterId: 6,
                    shelterName: "울산 남구 보호소"
                }
            ],
            shelters: [
                { id: 1, name: "부산 해운대 보호소", location: "부산시" },
                { id: 2, name: "서울 강남 보호소", location: "서울시" },
                { id: 3, name: "인천 남동 보호소", location: "인천시" },
                { id: 4, name: "대구 수성 보호소", location: "대구시" },
                { id: 5, name: "광주 서구 보호소", location: "광주시" },
                { id: 6, name: "울산 남구 보호소", location: "울산시" }
            ],
            regions: ["서울시", "부산시", "인천시", "대구시", "광주시", "울산시"],
            sexCd: ["수컷", "암컷", "미상"],
            animalTypes : [
                { code: "417000", name: "개" },
                { code: "422400", name: "고양이" },
                { code: "429900", name: "기타" }
            ],
            breeds: ["믹스견", "시츄", "비글", "리트리버", "래브라도", "불독", "푸들", "시바", "진돗개", "기타"],
            currentCount: 24,
            totalRescued: 156
        };
    }

    // 구조 동물 목록 조회 (필터링 포함)
    getRescuedAnimals(filters = {}) {
        return new Promise((resolve) => {
            setTimeout(() => {
                let filteredAnimals = [...this.sampleData.items];

                // 지역 필터링 (upr_cd)
                if (filters.upr_cd && filters.upr_cd !== '') {
                    const region = this.sampleData.regions.find(r => r.code === filters.upr_cd);
                    if (region) {
                        filteredAnimals = filteredAnimals.filter(animal =>
                            animal.careAddr.includes(region.name.replace('광역시', '').replace('특별시', ''))
                        );
                    }
                }

                // 동물 종류 필터링 (upkind)
                if (filters.upkind && filters.upkind !== '') {
                    filteredAnimals = filteredAnimals.filter(animal =>
                        animal.kindCd === filters.upkind
                    );
                }

                // 발견일 필터링 (bgnde, endde)
                if (filters.bgnde && filters.bgnde !== '') {
                    filteredAnimals = filteredAnimals.filter(animal =>
                        animal.happenDt >= filters.bgnde
                    );
                }
                if (filters.endde && filters.endde !== '') {
                    filteredAnimals = filteredAnimals.filter(animal =>
                        animal.happenDt <= filters.endde
                    );
                }

                // 상태 필터링 (state)
                if (filters.state && filters.state !== '') {
                    filteredAnimals = filteredAnimals.filter(animal =>
                        animal.processState === filters.state
                    );
                }

                // 성별 필터링 (sex_cd)
                if (filters.sex_cd && filters.sex_cd !== '') {
                    filteredAnimals = filteredAnimals.filter(animal =>
                        animal.sexCd === filters.sex_cd
                    );
                }

                // 통계 계산
                const noticeCount = filteredAnimals.filter(a => a.processState === 'notice').length;
                const protectCount = filteredAnimals.filter(a => a.processState === 'protect').length;

                const result = {
                    items: filteredAnimals,
                    regions: this.sampleData.regions,
                    animalTypes: this.sampleData.animalTypes,
                    noticeCount: noticeCount,
                    protectCount: protectCount,
                    totalCount: filteredAnimals.length
                };

                resolve(result);
            }, 300); // 실제 API 호출 시뮬레이션
        });
    }

    // 특정 구조 동물 상세 정보 조회
    getRescuedAnimalDetail(desertionNo) {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                const animal = this.sampleData.items.find(a => a.desertionNo === desertionNo);
                if (animal) {
                    resolve(animal);
                } else {
                    reject(new Error('Animal not found'));
                }
            }, 200);
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

    // 지역 목록 조회
    getRegions() {
        return new Promise((resolve) => {
            setTimeout(() => {
                resolve(this.sampleData.regions);
            }, 100);
        });
    }

    // 통계 정보 조회
    getStats() {
        return new Promise((resolve) => {
            setTimeout(() => {
                resolve({
                    noticeCount: this.sampleData.noticeCount,
                    protectCount: this.sampleData.protectCount,
                    totalCount: this.sampleData.totalCount
                });
            }, 100);
        });
    }
}

// 전역 인스턴스 생성
window.rescuedAnimalsData = new RescuedAnimalsData();