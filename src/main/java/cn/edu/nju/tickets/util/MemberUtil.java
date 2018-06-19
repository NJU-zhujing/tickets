package cn.edu.nju.tickets.util;

public class MemberUtil {

    private static final int memberPoints[] = {50,100,200,400,800,1600,3200,6400};

    private static final int memberLevels[] = {0,1,2,3,4,5,6,7,8};

    private static final double memberDiscounts[] = {1,0.95,0.9,0.85,0.8,0.75,0.7,0.65,0.6};

    public static int getLevel(int point){
        int i = 0;
        for (;i<memberPoints.length;i++){
            if (point>memberPoints[i]){
                i++;
            }else {
                break;
            }
        }

        return memberLevels[i];

    }


    public static double getDiscount(int point){
        int i = 0;
        for (;i<memberPoints.length;i++){
            if (point>memberPoints[i]){
                i++;
            }else {
                break;
            }
        }

        return memberDiscounts[i];

    }


    public static int costToMemberpoints(double cost){

        double memberPoints = cost/10.0;
        return (int) memberPoints;
    }





}
