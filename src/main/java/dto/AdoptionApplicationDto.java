package dto;

import java.math.BigDecimal;
import java.time.LocalDate;

public class AdoptionApplicationDto {
    private Integer id;

    private Integer animalId;

    private Integer memberId;

    private LocalDate applicationDate;

    private LocalDate preferredAdoptionDate;

    private String applicationStatus;

    private String currentAddress;

    private String housingType;

    private String housingOwnership;

    private Boolean hasYard;

    private Boolean yardFenced;

    private Integer householdMembers;

    private Boolean hasChildren;

    private String childrenAges;

    private Boolean allMembersAgree;

    private Boolean previousPetExperience;

    private String petCareKnowledgeLevel;

    private BigDecimal monthlyPetBudget;

    private Boolean emergencyFundPrepared;

    private Integer reviewedBy;

    private LocalDate reviewDate;

    private String currentPets;

    private String adoptionReason;

    private String dailyCarePlan;

    private String emergencyVetPlan;

    private String vacationCarePlan;

    private String specialRequests;

    private String reviewNotes;

    private String approvalConditions;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAnimalId() {
        return animalId;
    }

    public void setAnimalId(Integer animalId) {
        this.animalId = animalId;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public LocalDate getApplicationDate() {
        return applicationDate;
    }

    public void setApplicationDate(LocalDate applicationDate) {
        this.applicationDate = applicationDate;
    }

    public LocalDate getPreferredAdoptionDate() {
        return preferredAdoptionDate;
    }

    public void setPreferredAdoptionDate(LocalDate preferredAdoptionDate) {
        this.preferredAdoptionDate = preferredAdoptionDate;
    }

    public String getApplicationStatus() {
        return applicationStatus;
    }

    public void setApplicationStatus(String applicationStatus) {
        this.applicationStatus = applicationStatus == null ? null : applicationStatus.trim();
    }

    public String getCurrentAddress() {
        return currentAddress;
    }

    public void setCurrentAddress(String currentAddress) {
        this.currentAddress = currentAddress == null ? null : currentAddress.trim();
    }

    public String getHousingType() {
        return housingType;
    }

    public void setHousingType(String housingType) {
        this.housingType = housingType == null ? null : housingType.trim();
    }

    public String getHousingOwnership() {
        return housingOwnership;
    }

    public void setHousingOwnership(String housingOwnership) {
        this.housingOwnership = housingOwnership == null ? null : housingOwnership.trim();
    }

    public Boolean getHasYard() {
        return hasYard;
    }

    public void setHasYard(Boolean hasYard) {
        this.hasYard = hasYard;
    }

    public Boolean getYardFenced() {
        return yardFenced;
    }

    public void setYardFenced(Boolean yardFenced) {
        this.yardFenced = yardFenced;
    }

    public Integer getHouseholdMembers() {
        return householdMembers;
    }

    public void setHouseholdMembers(Integer householdMembers) {
        this.householdMembers = householdMembers;
    }

    public Boolean getHasChildren() {
        return hasChildren;
    }

    public void setHasChildren(Boolean hasChildren) {
        this.hasChildren = hasChildren;
    }

    public String getChildrenAges() {
        return childrenAges;
    }

    public void setChildrenAges(String childrenAges) {
        this.childrenAges = childrenAges == null ? null : childrenAges.trim();
    }

    public Boolean getAllMembersAgree() {
        return allMembersAgree;
    }

    public void setAllMembersAgree(Boolean allMembersAgree) {
        this.allMembersAgree = allMembersAgree;
    }

    public Boolean getPreviousPetExperience() {
        return previousPetExperience;
    }

    public void setPreviousPetExperience(Boolean previousPetExperience) {
        this.previousPetExperience = previousPetExperience;
    }

    public String getPetCareKnowledgeLevel() {
        return petCareKnowledgeLevel;
    }

    public void setPetCareKnowledgeLevel(String petCareKnowledgeLevel) {
        this.petCareKnowledgeLevel = petCareKnowledgeLevel == null ? null : petCareKnowledgeLevel.trim();
    }

    public BigDecimal getMonthlyPetBudget() {
        return monthlyPetBudget;
    }

    public void setMonthlyPetBudget(BigDecimal monthlyPetBudget) {
        this.monthlyPetBudget = monthlyPetBudget;
    }

    public Boolean getEmergencyFundPrepared() {
        return emergencyFundPrepared;
    }

    public void setEmergencyFundPrepared(Boolean emergencyFundPrepared) {
        this.emergencyFundPrepared = emergencyFundPrepared;
    }

    public Integer getReviewedBy() {
        return reviewedBy;
    }

    public void setReviewedBy(Integer reviewedBy) {
        this.reviewedBy = reviewedBy;
    }

    public LocalDate getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(LocalDate reviewDate) {
        this.reviewDate = reviewDate;
    }

    public String getCurrentPets() {
        return currentPets;
    }

    public void setCurrentPets(String currentPets) {
        this.currentPets = currentPets == null ? null : currentPets.trim();
    }

    public String getAdoptionReason() {
        return adoptionReason;
    }

    public void setAdoptionReason(String adoptionReason) {
        this.adoptionReason = adoptionReason == null ? null : adoptionReason.trim();
    }

    public String getDailyCarePlan() {
        return dailyCarePlan;
    }

    public void setDailyCarePlan(String dailyCarePlan) {
        this.dailyCarePlan = dailyCarePlan == null ? null : dailyCarePlan.trim();
    }

    public String getEmergencyVetPlan() {
        return emergencyVetPlan;
    }

    public void setEmergencyVetPlan(String emergencyVetPlan) {
        this.emergencyVetPlan = emergencyVetPlan == null ? null : emergencyVetPlan.trim();
    }

    public String getVacationCarePlan() {
        return vacationCarePlan;
    }

    public void setVacationCarePlan(String vacationCarePlan) {
        this.vacationCarePlan = vacationCarePlan == null ? null : vacationCarePlan.trim();
    }

    public String getSpecialRequests() {
        return specialRequests;
    }

    public void setSpecialRequests(String specialRequests) {
        this.specialRequests = specialRequests == null ? null : specialRequests.trim();
    }

    public String getReviewNotes() {
        return reviewNotes;
    }

    public void setReviewNotes(String reviewNotes) {
        this.reviewNotes = reviewNotes == null ? null : reviewNotes.trim();
    }

    public String getApprovalConditions() {
        return approvalConditions;
    }

    public void setApprovalConditions(String approvalConditions) {
        this.approvalConditions = approvalConditions == null ? null : approvalConditions.trim();
    }
}