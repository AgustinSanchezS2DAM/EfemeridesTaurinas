package Entities;

import Entities.FotosPK;
import Entities.Personaje;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-02-08T00:58:39")
@StaticMetamodel(Fotos.class)
public class Fotos_ { 

    public static volatile SingularAttribute<Fotos, String> nombreimagen;
    public static volatile SingularAttribute<Fotos, FotosPK> fotosPK;
    public static volatile SingularAttribute<Fotos, String> imagen;
    public static volatile SingularAttribute<Fotos, Personaje> personaje;

}