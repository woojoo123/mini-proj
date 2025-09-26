package dto;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class MemberDto {
    private Integer id;

    private String username;

    private String email;

    private String passwordHash;

    private String phoneNumber;

    private String fullName;

    private LocalDate birthDate;

    private String address;

    private String detailAddress;

    private String accountStatus;

    private String userType;

    private Boolean emailVerified;

    private Boolean phoneVerified;

    private Boolean hasExperience;

    private String emailVerificationToken;

    private LocalDateTime emailTokenExpiresAt;

    private Boolean notifyAnnouncement;

    private Boolean notifyAdoption;

    private Boolean notifyFollowedShelter;

    private Boolean notifyNewDevice;

    private String passwordResetToken;

    private LocalDateTime passwordTokenExpiresAt;

    private String nickname;

    private String profileImageUrl;

    private Integer volunteerHoursTotal;

    private BigDecimal donationsTotal;

    private Integer shelterId;

    private String shelterManagerRole;

    private String bio;

    private String sanctionReason;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash == null ? null : passwordHash.trim();
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber == null ? null : phoneNumber.trim();
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName == null ? null : fullName.trim();
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getAccountStatus() {
        return accountStatus;
    }

    public void setAccountStatus(String accountStatus) {
        this.accountStatus = accountStatus == null ? null : accountStatus.trim();
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType == null ? null : userType.trim();
    }

    public Boolean getEmailVerified() {
        return emailVerified;
    }

    public void setEmailVerified(Boolean emailVerified) {
        this.emailVerified = emailVerified;
    }

    public Boolean getPhoneVerified() {
        return phoneVerified;
    }

    public void setPhoneVerified(Boolean phoneVerified) {
        this.phoneVerified = phoneVerified;
    }

    public Boolean getHasExperience() {
        return hasExperience;
    }

    public void setHasExperience(Boolean hasExperience) {
        this.hasExperience = hasExperience;
    }

    public String getEmailVerificationToken() {
        return emailVerificationToken;
    }

    public void setEmailVerificationToken(String emailVerificationToken) {
        this.emailVerificationToken = emailVerificationToken == null ? null : emailVerificationToken.trim();
    }

    public LocalDateTime getEmailTokenExpiresAt() {
        return emailTokenExpiresAt;
    }

    public void setEmailTokenExpiresAt(LocalDateTime emailTokenExpiresAt) {
        this.emailTokenExpiresAt = emailTokenExpiresAt;
    }

    public Boolean getNotifyAnnouncement() {
        return notifyAnnouncement;
    }

    public void setNotifyAnnouncement(Boolean notifyAnnouncement) {
        this.notifyAnnouncement = notifyAnnouncement;
    }

    public Boolean getNotifyAdoption() {
        return notifyAdoption;
    }

    public void setNotifyAdoption(Boolean notifyAdoption) {
        this.notifyAdoption = notifyAdoption;
    }

    public Boolean getNotifyFollowedShelter() {
        return notifyFollowedShelter;
    }

    public void setNotifyFollowedShelter(Boolean notifyFollowedShelter) {
        this.notifyFollowedShelter = notifyFollowedShelter;
    }

    public Boolean getNotifyNewDevice() {
        return notifyNewDevice;
    }

    public void setNotifyNewDevice(Boolean notifyNewDevice) {
        this.notifyNewDevice = notifyNewDevice;
    }

    public String getPasswordResetToken() {
        return passwordResetToken;
    }

    public void setPasswordResetToken(String passwordResetToken) {
        this.passwordResetToken = passwordResetToken == null ? null : passwordResetToken.trim();
    }

    public LocalDateTime getPasswordTokenExpiresAt() {
        return passwordTokenExpiresAt;
    }

    public void setPasswordTokenExpiresAt(LocalDateTime passwordTokenExpiresAt) {
        this.passwordTokenExpiresAt = passwordTokenExpiresAt;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getProfileImageUrl() {
        return profileImageUrl;
    }

    public void setProfileImageUrl(String profileImageUrl) {
        this.profileImageUrl = profileImageUrl == null ? null : profileImageUrl.trim();
    }

    public Integer getVolunteerHoursTotal() {
        return volunteerHoursTotal;
    }

    public void setVolunteerHoursTotal(Integer volunteerHoursTotal) {
        this.volunteerHoursTotal = volunteerHoursTotal;
    }

    public BigDecimal getDonationsTotal() {
        return donationsTotal;
    }

    public void setDonationsTotal(BigDecimal donationsTotal) {
        this.donationsTotal = donationsTotal;
    }

    public Integer getShelterId() {
        return shelterId;
    }

    public void setShelterId(Integer shelterId) {
        this.shelterId = shelterId;
    }

    public String getShelterManagerRole() {
        return shelterManagerRole;
    }

    public void setShelterManagerRole(String shelterManagerRole) {
        this.shelterManagerRole = shelterManagerRole == null ? null : shelterManagerRole.trim();
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio == null ? null : bio.trim();
    }

    public String getSanctionReason() {
        return sanctionReason;
    }

    public void setSanctionReason(String sanctionReason) {
        this.sanctionReason = sanctionReason == null ? null : sanctionReason.trim();
    }

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", username=" + username + ", email=" + email + ", passwordHash=" + passwordHash
				+ ", phoneNumber=" + phoneNumber + ", fullName=" + fullName + ", birthDate=" + birthDate + ", address="
				+ address + ", detailAddress=" + detailAddress + ", accountStatus=" + accountStatus + ", userType="
				+ userType + ", emailVerified=" + emailVerified + ", phoneVerified=" + phoneVerified
				+ ", hasExperience=" + hasExperience + ", emailVerificationToken=" + emailVerificationToken
				+ ", emailTokenExpiresAt=" + emailTokenExpiresAt + ", notifyAnnouncement=" + notifyAnnouncement
				+ ", notifyAdoption=" + notifyAdoption + ", notifyFollowedShelter=" + notifyFollowedShelter
				+ ", notifyNewDevice=" + notifyNewDevice + ", passwordResetToken=" + passwordResetToken
				+ ", passwordTokenExpiresAt=" + passwordTokenExpiresAt + ", nickname=" + nickname + ", profileImageUrl="
				+ profileImageUrl + ", volunteerHoursTotal=" + volunteerHoursTotal + ", donationsTotal="
				+ donationsTotal + ", shelterId=" + shelterId + ", shelterManagerRole=" + shelterManagerRole + ", bio="
				+ bio + ", sanctionReason=" + sanctionReason + "]";
	}
}