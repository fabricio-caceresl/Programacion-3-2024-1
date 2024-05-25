package empresa.recursoshumanos.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;

@WebService(serviceName="AreaWS")
public class AreaWS {
    
    @WebMethod(operationName="hello")
    public String hello(@WebParam(name="name") String txt) {
        return "Hello "+txt+" !";
    }
    
}
