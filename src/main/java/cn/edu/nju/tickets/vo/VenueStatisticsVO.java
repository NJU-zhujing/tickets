package cn.edu.nju.tickets.vo;

import java.io.Serializable;

public class VenueStatisticsVO implements Serializable{

    private int totalNum;

    private int createdNum;

    private int hasArrangedNum;

    private int hasPaiedNum;

    private int finishedNum;

    private int pastDueNum;


    public VenueStatisticsVO(int createdNum, int hasArrangedNum, int hasPaiedNum, int finishedNum, int pastDueNum) {
        this.createdNum = createdNum;
        this.hasArrangedNum = hasArrangedNum;
        this.hasPaiedNum = hasPaiedNum;
        this.finishedNum = finishedNum;
        this.pastDueNum = pastDueNum;
    }


    public int getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(int totalNum) {
        this.totalNum = totalNum;
    }

    public int getCreatedNum() {
        return createdNum;
    }

    public void setCreatedNum(int createdNum) {
        this.createdNum = createdNum;
    }

    public int getHasArrangedNum() {
        return hasArrangedNum;
    }

    public void setHasArrangedNum(int hasArrangedNum) {
        this.hasArrangedNum = hasArrangedNum;
    }

    public int getHasPaiedNum() {
        return hasPaiedNum;
    }

    public void setHasPaiedNum(int hasPaiedNum) {
        this.hasPaiedNum = hasPaiedNum;
    }

    public int getFinishedNum() {
        return finishedNum;
    }

    public void setFinishedNum(int finishedNum) {
        this.finishedNum = finishedNum;
    }

    public int getPastDueNum() {
        return pastDueNum;
    }

    public void setPastDueNum(int pastDueNum) {
        this.pastDueNum = pastDueNum;
    }
}

