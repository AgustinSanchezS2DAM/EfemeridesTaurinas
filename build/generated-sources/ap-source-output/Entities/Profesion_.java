package Entities;

import Entities.Personaje;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-02-08T00:58:39")
@StaticMetamodel(Profesion.class)
public class Profesion_ { 

    public static volatile SingularAttribute<Profesion, String> descripcion;
    public static volatile ListAttribute<Profesion, Personaje> personajeList;
    public static volatile SingularAttribute<Profesion, Integer> idprofesion;

}