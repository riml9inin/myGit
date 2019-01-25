public class MyInfo {
    
    public static String getMyId() {
        String myId = UserInfo.getUserId();
        return myId;
    }
    
    public static String getMyCurrency() {
        String myCur = UserInfo.getDefaultCurrency();
        return myCur;
    }
    
    public static String getUserEmail() {
    	String myEmail = UserInfo.getUserEmail();
        return myEmail;
    }
    
    public static String getMyOrganization() {
        String myOrg = UserInfo.getOrganizationName();
        return myOrg;
    }
    
    public static String getTodayDate() {
        Date todayDate = System.today();
        String myDate = String.valueOf(todayDate);
        return myDate;
    }
    
    public static String getNumberSOQL() {
        Integer numSOQL = Limits.getLimitQueries() - Limits.getQueries();
        String result = String.valueOf(numSOQL);
        return result;
    }
}