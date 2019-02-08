package Entities;

import Entities.Personaje;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-02-08T00:58:39")
@StaticMetamodel(Efemeride.class)
public class Efemeride_ { 

    public static volatile SingularAttribute<Efemeride, String> ganaderia;
    public static volatile SingularAttribute<Efemeride, Date> fechaefemeride;
    public static volatile SingularAttribute<Efemeride, String> notas;
    public static volatile SingularAttribute<Efemeride, String> fuente;
    public static volatile SingularAttribute<Efemeride, String> provincia;
    public static volatile SingularAttribute<Efemeride, Date> fechareal;
    public static volatile SingularAttribute<Efemeride, String> foto;
    public static volatile SingularAttribute<Efemeride, Integer> idefemeride;
    public static volatile SingularAttribute<Efemeride, String> reportaje;
    public static volatile ListAttribute<Efemeride, Personaje> personajeList;
    public static volatile SingularAttribute<Efemeride, String> pueblo;
    public static volatile SingularAttribute<Efemeride, String> cartel;
    public static volatile SingularAttribute<Efemeride, String> tipoevento;

}