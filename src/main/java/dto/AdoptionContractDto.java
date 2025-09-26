package dto;

import java.math.BigDecimal;
import java.time.LocalDate;

public class AdoptionContractDto {
    private Integer id;

    private Integer applicationId;

    private Integer animalId;

    private Integer memberId;

    private Integer shelterId;

    private LocalDate contractDate;

    private LocalDate adoptionDate;

    private String contractNumber;

    private BigDecimal adoptionFee;

    private Integer trialPeriodDays;

    private String contractStatus;

    private LocalDate terminatedDate;

    private LocalDate adopterSignatureDate;

    private LocalDate shelterSignatureDate;

    private String witnessName;

    private String witnessContact;

    private String contractFileUrl;

    private String returnPolicy;

    private String contractTerms;

    private String specialConditions;

    private String followUpSchedule;

    private String terminationReason;

    private String additionalDocuments;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(Integer applicationId) {
        this.applicationId = applicationId;
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

    public Integer getShelterId() {
        return shelterId;
    }

    public void setShelterId(Integer shelterId) {
        this.shelterId = shelterId;
    }

    public LocalDate getContractDate() {
        return contractDate;
    }

    public void setContractDate(LocalDate contractDate) {
        this.contractDate = contractDate;
    }

    public LocalDate getAdoptionDate() {
        return adoptionDate;
    }

    public void setAdoptionDate(LocalDate adoptionDate) {
        this.adoptionDate = adoptionDate;
    }

    public String getContractNumber() {
        return contractNumber;
    }

    public void setContractNumber(String contractNumber) {
        this.contractNumber = contractNumber == null ? null : contractNumber.trim();
    }

    public BigDecimal getAdoptionFee() {
        return adoptionFee;
    }

    public void setAdoptionFee(BigDecimal adoptionFee) {
        this.adoptionFee = adoptionFee;
    }

    public Integer getTrialPeriodDays() {
        return trialPeriodDays;
    }

    public void setTrialPeriodDays(Integer trialPeriodDays) {
        this.trialPeriodDays = trialPeriodDays;
    }

    public String getContractStatus() {
        return contractStatus;
    }

    public void setContractStatus(String contractStatus) {
        this.contractStatus = contractStatus == null ? null : contractStatus.trim();
    }

    public LocalDate getTerminatedDate() {
        return terminatedDate;
    }

    public void setTerminatedDate(LocalDate terminatedDate) {
        this.terminatedDate = terminatedDate;
    }

    public LocalDate getAdopterSignatureDate() {
        return adopterSignatureDate;
    }

    public void setAdopterSignatureDate(LocalDate adopterSignatureDate) {
        this.adopterSignatureDate = adopterSignatureDate;
    }

    public LocalDate getShelterSignatureDate() {
        return shelterSignatureDate;
    }

    public void setShelterSignatureDate(LocalDate shelterSignatureDate) {
        this.shelterSignatureDate = shelterSignatureDate;
    }

    public String getWitnessName() {
        return witnessName;
    }

    public void setWitnessName(String witnessName) {
        this.witnessName = witnessName == null ? null : witnessName.trim();
    }

    public String getWitnessContact() {
        return witnessContact;
    }

    public void setWitnessContact(String witnessContact) {
        this.witnessContact = witnessContact == null ? null : witnessContact.trim();
    }

    public String getContractFileUrl() {
        return contractFileUrl;
    }

    public void setContractFileUrl(String contractFileUrl) {
        this.contractFileUrl = contractFileUrl == null ? null : contractFileUrl.trim();
    }

    public String getReturnPolicy() {
        return returnPolicy;
    }

    public void setReturnPolicy(String returnPolicy) {
        this.returnPolicy = returnPolicy == null ? null : returnPolicy.trim();
    }

    public String getContractTerms() {
        return contractTerms;
    }

    public void setContractTerms(String contractTerms) {
        this.contractTerms = contractTerms == null ? null : contractTerms.trim();
    }

    public String getSpecialConditions() {
        return specialConditions;
    }

    public void setSpecialConditions(String specialConditions) {
        this.specialConditions = specialConditions == null ? null : specialConditions.trim();
    }

    public String getFollowUpSchedule() {
        return followUpSchedule;
    }

    public void setFollowUpSchedule(String followUpSchedule) {
        this.followUpSchedule = followUpSchedule == null ? null : followUpSchedule.trim();
    }

    public String getTerminationReason() {
        return terminationReason;
    }

    public void setTerminationReason(String terminationReason) {
        this.terminationReason = terminationReason == null ? null : terminationReason.trim();
    }

    public String getAdditionalDocuments() {
        return additionalDocuments;
    }

    public void setAdditionalDocuments(String additionalDocuments) {
        this.additionalDocuments = additionalDocuments == null ? null : additionalDocuments.trim();
    }
}