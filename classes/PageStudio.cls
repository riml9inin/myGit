/**
 * Created by User on 22.10.2018.
 */

public class PageStudio {
    public String movieId {get; set;}
    public List<Movie__c> movies {get; set;}
    public String myfinish {get; set;}
    public PageStudio(ApexPages.StandardController stdController) {
        movieId = '';
        movies = [SELECT Id, Name, Studio__c, Status__c
        FROM Movie__c
        WHERE Status__c ='In Process'
        AND Studio__c =:ApexPages.currentPage().getParameters().get('id')];

    }

//   public List<Movie__c> getMovie() {
//       System.debug('ssss');
//       System.debug(movies);
//       return movies;

  // }
    public void finish() {

       // movieId = System.currentPageReference().getParameters().get('idmovie');
        System.debug(movieId);
        for (Movie__c mov : movies) {
            if (mov.Id == myfinish) {
                //System.debug(mov.Status__c);
                mov.Status__c = 'Finished';
                //System.debug(mov.Status__c);
            }
        }
        try {
            update movies;
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, e.getMessage()));
        }
    }
}