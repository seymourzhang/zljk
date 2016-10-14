import com.mtc.zljk.system.entity.SysDict;
import com.sun.glass.ui.SystemClipboard;

/**
 * Created by Ants on 2016/9/18.
 */
public class testArray {
    public static void main(String[] args){
        System.out.println("|DF|A".split("|").length);
        for (int i = 0; i < "|DF|A".split("|").length; i++) {
            System.out.println("|DF|A".split("|")[i]);
        }
    }
}
