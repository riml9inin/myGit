public with sharing class TrainingTasks {

    public static List<Integer> isAverage1(List<Integer> arr, Integer num) {
        if (arr.size() == 0) {
            return arr;
        } else {
            Integer numAverage = 0;
            Integer numSum = 0;
            for (Integer i = 0; i < arr.size(); i++) {
                numSum = numSum + arr[i];
            }
            numAverage = numSum / arr.size();
            for (Integer i = 0; i < arr.size(); i++) {
                if (arr[i] > num) {
                    arr.set(i, numAverage);
                }
            }
        }
        return arr;
    }

    public static List<Integer> isFirstElement2(List<Integer> arr) {
        for (Integer i = 1; i < arr.size(); i++) {
            if (arr[i] < arr[arr.size() - 1]) {
                arr.set(i, arr[0]);
            }
        }
        return arr;
    }

    public static List<Integer> SwapMinAndMax3(List<Integer> arr) {
        List<Integer> newArr = new List<Integer>();
        List<Integer> clonArr = arr.clone();
        arr.sort();
        Integer indexMax;
        Integer min = arr[0];
        Integer max = arr[arr.size()-1];
        for (Integer a : clonArr) {
            if (a == min) {
                newArr.add(max);
            } else if (a == max) {
                newArr.add(min);
            } else {
                newArr.add(a);
            }
        }
        return newArr; //TODO
    }

    public static List<Integer> SwapOddMinAndEvenMax4(List<Integer> arr) {
        List<Integer> newArr = new List<Integer>();
        Integer min;
        Integer max;
        for (Integer i = 0; i < arr.size(); i++) {
            if (Math.mod(arr[i], 2) == 0) {
                max = arr[i];
                System.debug(max);
            } else {
                min = arr[i];
                System.debug(min);
            } continue;
        }
        System.debug(min);
        System.debug(max);
        if (min == null || max == null) {
            for (Integer j = 0; j < arr.size(); j++) {
                arr.set(j, 0);
            }
            return arr;
        } else {
            for (Integer i = 0; i < arr.size(); i++) {
                if (max < arr[i] && Math.mod(arr[i], 2) == 0) {
                    max = arr[i];
                } else if (min > arr[i] && Math.mod(arr[i], 2) != 0) {
                    min = arr[i];
                }
            }
            for (Integer a : arr) {
                if (a == min) {
                    newArr.add(max);
                } else if (a == max) {
                    newArr.add(min);
                } else {
                    newArr.add(a);
                }
            }
            return newArr; //TODO
        }

    }

    public static List<Integer> replaceEvenOnLeftNeighbor5(List<Integer> arr) {
        if (arr.size() < 3)
        {
            return arr;
        } else {
            for (Integer i = 2; i < arr.size(); i = i + 2) {
                arr.set(i, arr[i - 1]);
            }
            return arr;
        }
    }

    public static List<Integer> minusFirstAndLast6(List<Integer> arr) {
        arr.remove(0);
        arr.remove(arr.size()-1);
        return arr; //TODO
    }

    public static List<Integer> noSuccessive8(List<Integer> arr) {
        for (Integer i = 1; i < arr.size(); i++) {
            if (arr[i] != arr[i - 1]) continue;
            arr.remove(i-1);
            i--;
	    }
        return arr; //TODO
    }

     public static List<Integer> notMoreThanTwoTimes7(List<Integer> arr) {
         System.debug(arr);
         List<Integer> arr1 = new List<Integer>();
         List<Integer> arr2 = new List<Integer>();
         List<Integer> newarr = new List<Integer>();
         for (Integer i = 0; i < arr.size(); i++) {
             if (!arr1.contains(arr[i])) {
                 arr1.add(arr[i]);
                 newarr.add(arr[i]);
             } else {
                 if (!arr2.contains(arr[i])) {
                     arr2.add(arr[i]);
                     newarr.add(arr[i]);
                 } else continue;
             } 
         }
         return newarr;
     }

    public static List<Integer> removeLargestNumbers9(List<Integer> arr, Integer num) {
        for (Integer i = 0; i < arr.size(); i++) {
          	if (arr[i] <= num) continue;
            arr.remove(i);
            i--;
        }
        return arr; //TODO
    }

    public static List<Integer> reverseOrder10(List<Integer> arr) {
        List<Integer> newArr = new List<Integer>();
        for (Integer i = arr.size() - 1; i >= 0; i--) {
            newArr.add(arr[i]);
        }
        return newArr;
    }

    public static Integer wordsFromNumbersAndTheirSum1(String str) {
        Integer sum = 0;
        List<String> words = str.split(' ');
        for (String word : words) {
            if (word.isNumeric()) {
                Integer num = Integer.valueOf(word);
                sum += num; //+=
            }
        }
        return sum;
    }

    public static Integer longestSpace2(String str) {
        Integer n = 0;
        Integer max = 0;
        for (Integer i = 0; i < str.length(); i++) {
            if (str.substring(i, i + 1).isWhitespace()) {
                n++;
                if (n > max) {
                    max = n;
                }
            } else n=0;
        }
        return max; //TODO work incorrect
    }

    public static List<String> twoWordsAndOneCharacter3(String str1, String str2) {
        List<String> characters = new List<String>();
        String symbol;
        for (Integer i = 0; i < str1.length(); i++) {
            System.debug(i);
            if (i != str1.length()) {
                symbol = str1.substring(i, i + 1);
            } else {
                symbol = str1.right(1);
            }
            System.debug(symbol);
            if (str1.countMatches(symbol) == 1 && str2.countMatches(symbol) == 1) {
                characters.add(symbol);
            }
        }
        return characters; //TODO String str1 = 'asdssdortn'; String str2 = 'aatsdsooorrn'; == t,n,n

    }

    public static List<String> sortByLength4(List<String> strings) {
        List<Integer> sizes = new List<Integer>();
        List<String> newStrings = new List<String>();
        for (String str : strings) {
            sizes.add(str.length());
        }
        sizes.sort();
        for (Integer s : sizes) {
            for (String str : strings) {
                if (s != str.length()) continue;
                else {
                    newStrings.add(str);
                }
            }
        }
        return newStrings;
    }

    public static List<List<String>> wonderfulSort5(List<String> strings) {
        Map<Integer, List<String>> StringsByIntegers = new Map<Integer, List<String>>();
        List<List<String>> sorts = new List<List<String>>();
        String numbers = '0123456789';
        List<Integer> sortIntegers = new List<Integer>();
        for (String str : strings) {
            Integer n = 0;
            List<String> newStrings = new List<String>();
            for (Integer i = 0; i < str.length(); i++) {
                if (numbers.contains(str.substring(i, i+1))) {
                    n++;
                }
            }
            if (StringsByIntegers.containsKey(n)) {
                StringsByIntegers.get(n).add(str);
            } else {
                newStrings.add(str);
                StringsByIntegers.put(n, newStrings);
            }
        }
        sortIntegers.addAll(StringsByIntegers.keySet());
        sortIntegers.sort();
        for (Integer integers : sortIntegers) {
            sorts.add(StringsByIntegers.get(integers));
        }
        return sorts;
    }

    public static String smallToLarge6(String str) {
        String newString = str.replace('a', 'A');
        newString = newString.replace('b', 'B');
        return newString;
    }

    public static String betweenFirstCommas7(String str) {
        List<String> strings = str.split(',');
        return strings[1];
    }

    public static String insideString9(String str1, String str2) {
        if (str1.length() >= str2.length()) {
            if (str1.contains(str2)) {
                return 'String "' + str2 + '" contain in "' + str1 + '"';
            } else {
                return 'String "' + str2 + '" do not contain in "' + str1 + '"';
            }
        } else {
            if (str2.contains(str1)) {
                return 'String "' + str1 + '" contain in "' + str2 + '"';
            } else {
                return 'String "' + str1 + '" do not contain in "' + str2 + '"';
            }
        }
    }

    public static String removeItem8(String str, Integer num) {
        if (str.length() < num) {
            return str;
        } else {
            List<Integer> strInIntegers = str.getChars();
            strInIntegers.remove(num - 1);
            String newString = String.fromCharArray(strInIntegers);
            return newString;
        }
    }

    public static String stringInString10(String str1, String str2) {
        String substr;
        if (str2.length() > str1.length()) {
            return 'no';
        } else {
            for (Integer i = 0; i <= str2.length(); i++) {
                if (i < str2.length()) {
                    substr = str2.substring(i, i + 1);
                    if (str1.contains(substr)) {
                        str1.replaceFirst(substr, '');
                    } else break;
                } else {
                    substr = str2.substring(i);
                    if (str1.contains(substr)) {
                        return 'yes';
                    } else {
                        return 'no';
                    }
                }
            } return 'no';
        }
    }
}