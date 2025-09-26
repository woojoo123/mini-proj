package dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class DonationTransactionDto {
    private String transactionId;

    private Integer subscriptionId;

    private BigDecimal amount;

    private LocalDateTime paidAt;

    private String pgTransactionData;

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId == null ? null : transactionId.trim();
    }

    public Integer getSubscriptionId() {
        return subscriptionId;
    }

    public void setSubscriptionId(Integer subscriptionId) {
        this.subscriptionId = subscriptionId;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public LocalDateTime getPaidAt() {
        return paidAt;
    }

    public void setPaidAt(LocalDateTime paidAt) {
        this.paidAt = paidAt;
    }

    public String getPgTransactionData() {
        return pgTransactionData;
    }

    public void setPgTransactionData(String pgTransactionData) {
        this.pgTransactionData = pgTransactionData == null ? null : pgTransactionData.trim();
    }
}