package cn.edu.nju.tickets.vo;

import cn.edu.nju.tickets.po.VenuePO;

import java.io.Serializable;

public class VenueVO implements Serializable {

    private VenuePO venuePO;

    private VenueStatisticsVO venueStatisticsVO;

    public VenueVO(VenuePO venuePO, VenueStatisticsVO venueStatisticsVO) {
        this.venuePO = venuePO;
        this.venueStatisticsVO = venueStatisticsVO;
    }

    public VenuePO getVenuePO() {
        return venuePO;
    }

    public void setVenuePO(VenuePO venuePO) {
        this.venuePO = venuePO;
    }

    public VenueStatisticsVO getVenueStatisticsVO() {
        return venueStatisticsVO;
    }

    public void setVenueStatisticsVO(VenueStatisticsVO venueStatisticsVO) {
        this.venueStatisticsVO = venueStatisticsVO;
    }
}
