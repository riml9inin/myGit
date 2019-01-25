public class Example1 {
	public List<String> method() {
        List<SObject> objs = [SELECT Id, Name FROM Contact];
        System.debug(objs);
        List<String> strings = new List<String>();
        for(Integer i = 0; i < objs.size(); i++) {
            Boolean f = false;
            for(Integer j = 0; j < strings.size(); j++) {
                if(objs[i].get('Name') == strings[j]) {
                    f = true;
                }
            }
            if(f = false) {
                strings.add(String.valueof(objs[i].get('Name')));
            }
        }
        System.debug(strings);
        return strings;

    }
}