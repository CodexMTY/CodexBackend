class UserSerializer

    def initialize(user: nil)
      @user = user
    end
  
    def serialize_new_user()
        serialized_new_user = serialize_user(@user)
        serialized_new_user.to_json()
    end
      
    def serialize_user(user)
        {
            id: user.id,
            nombre: user.nombre,
            apellidos: user.apellidos,
            email: user.email,
            password_digest: user.password_digest,
            status: user.status,
            idm4: user.idm4,
            estudios: user.estudios,
            cumpleanos: user.cumpleanos,
            edad: user.getEdad(),
            fecha_ingreso: user.fecha_ingreso,
            antiguedad: user.getAntiguedad(),
            universidad: user.universidad,
            direccion: user.direccion,
            puesto: user.puesto,
            pc_cat: user.pc_cat,
            resumen: user.resumen,
            key_talent: user.key_talent,
            encuadre: user.encuadre,
            cet: user.cet,
            jefe: user.jefe,
            image: user.get_image_url(),
            estructura3: user.estructura3,
            estructura4: user.estructura4,
            estructura5: user.estructura5,
            created_at: user.created_at,
            updated_at: user.updated_at,
        }
    end   
end