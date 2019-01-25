public with sharing class Rectangle {
    public Integer length, width;
    
    
    public void setSidesOfRectangle(Integer l, Integer w) {
        this.length = l;
        this.width = w;
	} 
    
    public String perimeter(Integer a, Integer b) {
        if ((a==NULL||a<=0) || (b==NULL||b<=0)) {
            return 'Sides are not specified';
        } 
        else {
            return ('Perimeter=' + String.valueOf(2*(a + b)));
 		}
    }
    
    public String area(Integer a, Integer b) 
    { 
        if ((a==NULL||a<=0) || (b==NULL||b<=0)) {
       	    return 'Sides are not specified';
        }
 		else {
            return ('Area=' + String.valueOf(a*b));
		}
    }

    public String diagonal(Double a, Double b) {
        if ((a==NULL||a<=0) || (b==NULL||b<=0)) {
            return 'Sides are not specified';
        }
        else {
            return ('Diagonal=' +String.valueOf(math.sqrt(math.pow(a,2)+math.pow(b,2))));
        }
    }
}