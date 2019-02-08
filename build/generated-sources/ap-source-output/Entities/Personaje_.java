package Entities;

import Entities.Efemeride;
import Entities.Fotos;
import Entities.Profesion;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-02-08T00:58:39")
@StaticMetamodel(Personaje.class)
public class Personaje_ { 

    public static volatile SingularAttribute<Personaje, String> apodo1;
    public static volatile SingularAttribute<Personaje, String> apodo2;
    public static volatile SingularAttribute<Personaje, Boolean> completo;
    public static volatile SingularAttribute<Personaje, String> notas;
    public static volatile SingularAttribute<Personaje, Date> fechaalternativa;
    public static volatile SingularAttribute<Personaje, String> provincianacimiento;
    public static volatile ListAttribute<Personaje, Profesion> profesionList;
    public static volatile SingularAttribute<Personaje, String> nombrepersonaje;
    public static volatile SingularAttribute<Personaje, String> correo;
    public static volatile SingularAttribute<Personaje, String> telefono;
    public static volatile SingularAttribute<Personaje, String> nombrecartel;
    public static volatile SingularAttribute<Personaje, Date> fechapresentacion;
    public static volatile SingularAttribute<Personaje, String> puebloactual;
    public static volatile SingularAttribute<Personaje, String> apellido2;
    public static volatile SingularAttribute<Personaje, String> personadecontacto;
    public static volatile SingularAttribute<Personaje, Boolean> clm;
    public static volatile SingularAttribute<Personaje, String> apellido1;
    public static volatile SingularAttribute<Personaje, String> direccion;
    public static volatile SingularAttribute<Personaje, String> biografia;
    public static volatile SingularAttribute<Personaje, String> pueblonacimiento;
    public static volatile SingularAttribute<Personaje, Date> fechapicadores;
    public static volatile SingularAttribute<Personaje, String> fotografia;
    public static volatile ListAttribute<Personaje, Fotos> fotosList;
    public static volatile SingularAttribute<Personaje, Boolean> cossio;
    public static volatile SingularAttribute<Personaje, Integer> idpersonaje;
    public static volatile SingularAttribute<Personaje, Date> fechanacimiento;
    public static volatile SingularAttribute<Personaje, String> provinciaactual;
    public static volatile ListAttribute<Personaje, Efemeride> efemerideList;

}