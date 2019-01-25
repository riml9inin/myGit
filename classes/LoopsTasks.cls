public class LoopsTasks {

  /**
   * Returns the 'Fizz','Buzz' or an original number as String using the following rules:
   * 1) return original number as String
   * 2) but if number multiples of three return 'Fizz'
   * 3) for the multiples of five return 'Buzz'
   * 4) for numbers which are multiples of both three and five return 'FizzBuzz'
   *
   * @param {number} num
   * @return {any}
   *
   * @example
   *   2 =>  '2'
   *   3 => 'Fizz'
   *   5 => 'Buzz'
   *   4 => '4'
   *  15 => 'FizzBuzz'
   *  20 => 'Buzz'
   *  21 => 'Fizz'
   *
   */
  public static String getFizzBuzz(Integer num) {
    String f = 'Fizz';
    String b = 'Buzz';
    String fb = 'FizzBuzz';
    String n = String.valueOf(num);
    if (Math.mod(num,3)==0 && Math.mod(num,5)==0) {
      return fb;
    } else if (Math.mod(num,5)==0) {
      return b;
    } else if (Math.mod(num,3)==0) {
      return f;
    } else {
      return n;
    }
  }

  /**
   * Returns the factorial of the specified integer n.
   *
   * @param {number} n
   * @return {number}
   *
   * @example:
   *   1  => 1
   *   5  => 120
   *   10 => 3628800
   */
  public static Integer getFactorial(Integer num) {
    Integer fac = 1;
    if (num == 1 || num ==0) {
    return 1;
    } else {
      for (Integer i=0; i<num; i++) {
        fac = fac*(num-i);
      }
      return fac;
    }
  }

  /**
   * Returns the sum of integer numbers between n1 and n2 (inclusive).
   *
   * @param {number} n1
   * @param {number} n2
   * @return {number}
   *
   * @example:
   *   1,2   =>  3  ( = 1+2 )
   *   5,10  =>  45 ( = 5+6+7+8+9+10 )
   *   -1,1  =>  0  ( = -1 + 0 + 1 )
   */
  public static Integer getSumBetweenNumbers(Integer num1, Integer num2) {
    Integer sum = num1;
    for (Integer i=num1; i<num2; i++) {
      sum = sum+ (i+1);
    }
    return sum;
  }

  /**
   * Returns true, if a triangle can be built with the specified sides a,b,c and false in any other ways.
   *
   * @param {number} a
   * @param {number} b
   * @param {number} c
   * @return {bool}
   *
   * @example:
   *   1,2,3    =>  false
   *   3,4,5    =>  true
   *   10,1,1   =>  false
   *   10,10,10 =>  true
   */
  public static Boolean isTriangle(Integer a, Integer b, Integer c) {
    if ((a+b<=c) || (a+c<=b) || (c+b<=a)) {
    return false;
  } else {
      return true;
    }
  }

  /**
   * Returns true, if two specified axis-aligned rectangles overlap, otherwise false.
   * Each rectangle representing by Map<String, Integer> 
   *  {
   *     top: 5,
   *     left: 5,
   *     width: 20,
   *     height: 10
   *  }
   * 
   *  (5;5)
   *     -------------  
   *     |           | 
   *     |           |  height = 10
   *     ------------- 
   *        width=20    
   * 
   * NOTE: Please use canvas coordinate space (https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Tutorial/Drawing_shapes#The_grid),
   * it differs from Cartesian coordinate system.
   * 
   * @param {Map<String, Integer>} rect1
   * @param {Map<String, Integer>} rect2
   * @return {bool}
   *
   * @example:
   *   { top: 0, left: 0, width: 10, height: 10 },
   *   { top: 5, left: 5, width: 20, height: 20 }    =>  true
   * 
   *   { top: 0, left: 0, width: 10, height: 10 },
   *   { top:20, left:20, width: 20, height: 20 }    =>  false
   *  
   */
  public static Boolean doRectanglesOverlap(Map<String, Integer> rect1, Map<String, Integer> rect2) {
    Integer aW = rect1.get('left') + rect1.get('width');
    Integer aH = rect1.get('top') + rect1.get('height');

    if ((aW<rect2.get('left')) || (aH<rect2.get('top'))) {
      return false;
    } else {
      return true;
    }
  }

  /**
   * Returns true, if point lies inside the circle, otherwise false.
   * Circle is:
   *     Center Map<String, Double>: {
   *       x: 5,       
   *       y: 5
   *     },        
   *     Radius Integer: 20
   * Point is Map<String, Double> 
   *  {
   *     x: 5,
   *     y: 5
   *  }
   * 
   * @param {Map<String, Double>} center
   * @param {Integer} raduis
   * @param {Map<String, Double>} point
   * @return {bool}
   *
   * @example:
   *   center: { x:0, y:0 }, radius: 10, point: { x:0, y:0 }     => true
   *   center: { x:0, y:0 }, radius:10,  point: { x:10, y:10 }   => false
   *   
   */
  public static Boolean isInsideCircle(Map<String, Double> center, Integer radius, Map<String, Double> point) {
    Double g = Math.pow(point.get('x')-center.get('x'),2)+Math.pow(point.get('y')-center.get('y'),2);
    if (g<Math.pow(radius,2)) {
      return true;
    } else {
      return false;
    }
  }

  /**
   * Returns the first non repeated char in the specified strings otherwise returns null.
   *
   * @param {string} str
   * @return {string}
   *
   * @example:
   *   'The quick brown fox jumps over the lazy dog' => 'T'
   *   'abracadabra'  => 'c'
   *   'entente' => null
   */
  public static String findFirstSingleChar(String str) {
    for (Integer i=0; i<str.length();i++) {
      String substr = str.substring(i, i+1);
      if (str.countMatches(substr)==1) {
        return substr;
      }

      }
    return null;


  }

  /**
   * Returns the string representation of math interval, specified by two points and include / exclude flags.
   * See the details: https://en.wikipedia.org/wiki/Interval_(mathematics)
   *
   * Please take attention, that the smaller number should be the first in the notation
   *
   * @param {number} a
   * @param {number} b
   * @param {bool} isStartIncluded
   * @param {bool} isEndIncluded
   * @return {string}
   *
   * @example
   *   0, 1, true, true   => '[0, 1]'
   *   0, 1, true, false  => '[0, 1)'
   *   0, 1, false, true  => '(0, 1]'
   *   0, 1, false, false => '(0, 1)'
   * Smaller number has to be first :
   *   5, 3, true, true   => '[3, 5]'
   *
   */
  public static String getIntervalString(Integer a, Integer b, Boolean isStartIncluded, Boolean isEndIncluded) {

      if (a<b && (isStartIncluded == true && isEndIncluded == true)) {
        return ('['+String.valueOf(a)+', '+String.valueOf(b)+']');
      } else if (a<b && (isStartIncluded == true && isEndIncluded == false)) {
        return ('['+String.valueOf(a)+', '+String.valueOf(b)+')');
      } else if (a<b && (isStartIncluded == false && isEndIncluded == true)) {
        return ('('+String.valueOf(a)+', '+String.valueOf(b)+']');
      } else if (a<b && (isStartIncluded == false && isEndIncluded == false)) {
        return ('('+String.valueOf(a)+', '+String.valueOf(b)+')');
      } else if (a>=b && (isStartIncluded == true && isEndIncluded == true)) {
        return ('[' + String.valueOf(b) + ', ' + String.valueOf(a) + ']');
      } else if (a>=b && (isStartIncluded == true && isEndIncluded == false)) {
        return ('[' + String.valueOf(b) + ', ' + String.valueOf(a) + ')');
      } else if (a>=b && (isStartIncluded == false && isEndIncluded == true)) {
        return ('(' + String.valueOf(b) + ', ' + String.valueOf(a) + ']');
      } else {
        return ('(' + String.valueOf(b) + ', ' + String.valueOf(a) + ')');
      }
  }

  /**
   * Reverse the specified string (put all chars in reverse order)
   *
   * @param {string} str
   * @return {string}
   *
   * @example:
   * 'The quick brown fox jumps over the lazy dog' => 'god yzal eht revo spmuj xof nworb kciuq ehT'
   * 'abracadabra' => 'arbadacarba'
   * 'rotator' => 'rotator'
   * 'noon' => 'noon'
   */
  public static String reverseString(String str) {
    return str.reverse();
  }

  /**
   * Reverse the specified integer number (put all digits in reverse order)
   *
   * @param {number} num
   * @return {number}
   *
   * @example:
   *   12345 => 54321
   *   1111  => 1111
   *   87354 => 45378
   *   34143 => 34143
   */
  public static Integer reverseInteger(Integer num) {
    String str = String.valueOf(num);
    return Integer.valueOf(str.reverse());
  }

  /**
   * Returns the digital root of integer:
   *   step1 : find sum of all digits
   *   step2 : if sum > 9 then goto step1 otherwise return the sum
   *
   * @param {number} n
   * @return {number}
   *
   * @example:
   *   12345 ( 1+2+3+4+5 = 15, 1+5 = 6) => 6
   *   23456 ( 2+3+4+5+6 = 20, 2+0 = 2) => 2
   *   10000 ( 1+0+0+0+0 = 1 ) => 1
   *   165536 (1+6+5+5+3+6 = 26,  2+6 = 8) => 8
   */
  public static Integer getDigitalRoot(Integer num) {

    do {
      Integer sum = 0;
      String str = String.valueOf(num);
      for (Integer i = 0; i<str.length();i++) {
        Integer n = Integer.valueOf(str.substring(i, i + 1));
        sum = sum + n;
        num = sum;
      }
    } while (num>9);
    return num;
  }

  /**
   * Returns true if the specified string has the balanced brackets and false otherwise.
   * Balanced means that is, whether it consists entirely of pairs of opening/closing brackets
   * (in that order), none of which mis-nest.
   * Brackets include [],(),{},<>
   *
   * @param {string} str
   * @return {boolean}
   *
   * @example:
   *   '' => true
   *   '[]'  => true
   *   '{}'  => true
   *   '()   => true
   *   '[[]' => false
   *   ']['  => false
   *   '[[][][[]]]' => true
   *   '[[][]][' => false
   *   '{)' = false
   *   '{[(<{[]}>)]}' = true 
   */
  public static Boolean isBracketsBalanced(String str) {
    if (String.isEmpty(str)) {
      return true;
    }
      List <String> s = new List<String>();
      for (Integer i = 0; i<str.length(); i++) {
        System.debug(+i);
        String el = str.substring(i, i+1);
        System.debug(+el);
        if (el == '[' || el == '(' || el == '{' || el == '<') {
          s.add(el);
          System.debug(+s);
        }
        if (el == ']' || el == ')' || el == '}' || el == '>') {
          if (s.isEmpty()) {
            return false;
          }
          String c = s.get(s.size()-1);
          System.debug(+c);
          if (el == ']' && c == '[' || el == ')' && c == '(' || el == '}' && c == '{' || el == '>' && c == '<') {
            s.remove(s.size()-1);
          }
          else {
            return false;
          }

        }
      }
    if (s.isEmpty()==true) {
      return true;
    } else {
      return false;
    }




  }

  /**
   * Returns the human readable string of time period specified by the start and end time.
   * The result string should be constrcuted using the folliwing rules:
   *
   * ---------------------------------------------------------------------
   *   Difference                 |  Result
   * ---------------------------------------------------------------------
   *    0 to 45 seconds           |  a few seconds ago
   *   45 to 90 seconds           |  a minute ago
   *   90 seconds to 45 minutes   |  2 minutes ago ... 45 minutes ago
   *   45 to 90 minutes           |  an hour ago
   *  90 minutes to 22 hours      |  2 hours ago ... 22 hours ago
   *  22 to 36 hours              |  a day ago
   *  36 hours to 25 days         |  2 days ago ... 25 days ago
   *  25 to 45 days               |  a month ago
   *  45 to 345 days              |  2 months ago ... 11 months ago
   *  345 to 545 days (1.5 years) |  a year ago
   *  546 days+                   |  2 years ago ... 20 years ago
   * ---------------------------------------------------------------------
   *
   * @param {DateTime} startDate
   * @param {DateTime} endDate
   * @return {string}
   *
   * @example
   *   DateTime('2000-01-01 01:00:00'), DateTime('2000-01-01 01:00:01')  => 'a few seconds ago'
   *   DateTime('2000-01-01 01:00:00'), DateTime('2000-01-01 01:00:05')  => '5 minutes ago'
   *   DateTime('2000-01-01 01:00:00'), DateTime('2000-01-02 03:00:05')  => 'a day ago'
   *   DateTime('2000-01-01 01:00:00'), DateTime('2015-01-02 03:00:05')  => '15 years ago'
   *
   */
  public static String timespanToHumanString(DateTime startDate, DateTime endDate) {
    Long ms = startDate.getTime(); 
    System.debug(+ms);  
	Long me = endDate.getTime();
    System.debug(+me);
    Long result = (me-ms)/1000;
    System.debug(+result);
    Decimal m = result/Decimal.valueOf(60);
    System.debug(+m);
    Long md = (result/Decimal.valueOf(60)).round(System.roundingMode.CEILING);
    System.debug(+md);
    Decimal h = result/Decimal.valueOf(3600);
    System.debug(+h);
    Long hd = (result/Decimal.valueOf(3600)).round(System.roundingMode.CEILING);
    System.debug(+hd);
    Decimal d = result/Decimal.valueOf(86400);
    System.debug(+d);
    Long dd = (result/Decimal.valueOf(86400)).round(System.roundingMode.CEILING);
    System.debug(+dd);
    Decimal n = result/Decimal.valueOf(2592000);
    System.debug(+n);
    Long nd = (result/Decimal.valueOf(2592000)).round(System.roundingMode.CEILING);
    System.debug(+nd);
    Decimal y = result/Decimal.valueOf(31104000);
    System.debug(+y);
    Long yd = (result/Decimal.valueOf(31104000)).round(System.roundingMode.CEILING);
    System.debug(+yd);
	if (result>=0 && result<=45) {
      return ('a few seconds ago');
    } else if (result>45 && result<=90) {
      return ('a minute ago');
    } else if (m>1.5 && m<=45) {
        if ((result/Decimal.valueOf(60))+0.50<=md) {
        return (+String.valueOf(md-1)+' minutes ago');
        } else return (+String.valueOf(md)+' minutes ago');
    } else if (m>45 && m<=90) {
      return ('an hour ago');
    } else if (h>1.5 && h<=22) {
      if (h + 0.50 <= hd) {
        return (+String.valueOf(hd - 1) + ' hours ago');
      } else return (+String.valueOf(hd) + ' hours ago');
    } else if (h>22 && h<=36) {
      return ('a day ago');
    } else if (d>1.5 && d<=25) {
      if (d + 0.50 <= dd) {
        return (+String.valueOf(dd - 1) + ' days ago');
      }
      else return (+String.valueOf(dd) + ' days ago');
    } else if (d>25 && d<=45) {
      return ('a month ago');
    } else if (n>1.5 && n<=11.5) {
      if (n + 0.50 <= nd) {
        return (+String.valueOf(nd - 1) + ' months ago');
      }
      else return (+String.valueOf(nd) + ' months ago');
    } else if (d>345 && d<=545) {
      return ('a year ago');
    } else {
      if (y + 0.50 <= yd) {
        return (+String.valueOf(yd - 1) + ' years ago');
      }
      else return (+String.valueOf(yd) + ' years ago');
    }
  }
}