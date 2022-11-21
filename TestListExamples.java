import static org.junit.Assert.*;
import org.junit.*;
import java.util.ArrayList;
public class TestListExamples {
  // Write your grading tests here!
  class IfLengthLargerThanTwo implements StringChecker{
    public boolean checkString(String s){
      if(s.length() > 2){
        return true;
      }
      return false;
    }
  }
  @Test(timeout = 100)
    public void testFilter(){
        ArrayList<String> arr = new ArrayList<>(); arr.add("a"); arr.add("aa"); arr.add("aaa"); arr.add("aaaa");
        ArrayList<String> arr2 = new ArrayList<>(); arr2.add("aaa"); arr2.add("aaaa");

        assertEquals(arr2, ListExamples.filter(arr, new IfLengthLargerThanTwo()));
        
    }

    @Test(timeout = 100)
    public void testMerge(){
        ArrayList<String> arr = new ArrayList<>(); arr.add("a"); arr.add("c"); 
        ArrayList<String> arr2 = new ArrayList<>(); arr2.add("b"); arr2.add("d"); arr2.add("e"); arr2.add("f");
        ArrayList<String> arr3 = new ArrayList<>(); arr3.add("a"); arr3.add("b"); arr3.add("c"); arr3.add("d");
         arr3.add("e"); arr3.add("f");

        assertEquals(arr3, ListExamples.merge(arr, arr2));
    }
}
