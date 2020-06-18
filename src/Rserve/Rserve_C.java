package Rserve;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

/**
 * Created by parkjihyoung on 15. 5. 24..
 */
public class Rserve_C {

    public REXP x = null;
    public RConnection c = null;
    public String retStr = "";

    public String returnRClass() throws RserveException, REXPMismatchException{

            c = new RConnection();
            x = c.eval("1+2");
            retStr = x.asString();

        return retStr;
    }
}
