
package com.watad.philoPLus.classes;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.annotation.Annotation;
import java.lang.reflect.Type;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import javax.ws.rs.Consumes;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.ext.MessageBodyWriter;
import javax.ws.rs.ext.Provider;
import javax.ws.rs.Produces;


@Provider
@Produces(MediaType.APPLICATION_JSON)
public class ArrayListBodyWriter implements MessageBodyWriter<ArrayList<liftProgress>>{

     ObjectMapper obm = new ObjectMapper();
    @Override
    public boolean isWriteable(Class<?> type, Type type1, Annotation[] antns, MediaType mt) {
    
        return ArrayList.class.isAssignableFrom(type);
    }

    @Override
    public long getSize(ArrayList<liftProgress> t, Class<?> type, Type type1, Annotation[] antns, MediaType mt) {
        return -1;
    }

    @Override
    public void writeTo(ArrayList<liftProgress> t, Class<?> type, Type GenericType, Annotation[] antns, MediaType mt, MultivaluedMap<String, Object> mm, OutputStream out) throws IOException, WebApplicationException {
        mm.putSingle("Content-type", MediaType.APPLICATION_JSON+" ; charset=UTF-8");
        String json = obm.writeValueAsString(t);
        out.write(json.getBytes(StandardCharsets.UTF_8));
    }
    
}
