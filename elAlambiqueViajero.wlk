object luke{
    var sitiosViajados=0
    var paisAViajar=paris
    var recuerdo= paisAViajar.recuerdo()
    method vehiculo()=alambiqueVeloz
    method recuerdo()= recuerdo
    method sitiosViajados()=sitiosViajados
    method tirarRecuerdo(lugarDelViaje){
        paisAViajar=lugarDelViaje
        recuerdo = lugarDelViaje.recuerdo()
        sitiosViajados+=1
    }
    method viajar(lugarDeViaje){
        if(self.vehiculo().puedeIrALaCiudad(lugarDeViaje)){
            self.vehiculo().sufreConsecuencias()
            self.tirarRecuerdo(lugarDeViaje)
        }
        
    }
}

object paris{
    method recuerdo()="llavero de la torre eiffel "
    method seEstaConmemorando()=true
}
object buenosAires{
    method recuerdo(){
        if(presidente.nombre()=="alberto fernandez"){
            return "mate con llerva"
        }
        else{
            return "mate sin llerva"
        }
    }
    
}
object bagdad{
    method recuerdo(){
        if(presidente.añoActual()==2019){
            return "bidón petroleo"
        }
        else if(presidente.añoActual()==2020){
            return "destruccion masiva que no fue encontrada"
        }
        else if(presidente.añoActual()==2021){
            return "réplica de los míticos jardines colgantes de Babilonia"
        }
        else{
            return "otra cosa diferente"
        }
    }
}

object vegas{
    var homanejeando=paris
    method recuerdo(){
        if(paris.seEstaConmemorando()){
            return paris.recuerdo()
        }
        else{
            homanejeando=buenosAires
            return buenosAires.recuerdo()
        }
    }
    method homanejeando()=homanejeando
}
object presidente{
    var añoTranscurrido=2019
    var añosElecto=2019
    var finAñoElecto=2023
    var presidenteActual="alberto fernandez"
    method nombre()= presidenteActual
    method añosElecto()=añosElecto
    method añoFinElecto()=finAñoElecto
    method cambiarPresindencia(nuevoPresidente,añoComienzo, añoFinDeComienzo){
        presidenteActual=nuevoPresidente
        añosElecto=añoComienzo
        finAñoElecto=añoFinDeComienzo
    }
    method añoActual()=añosElecto
    method actualizarAño(){
        añoTranscurrido+=1
    }
}

//autos
object alambiqueVeloz{
    var combustible=200
    method combustible()=combustible
    method sufreConsecuencias(){
        combustible -= 50
    }
    method suficienteCombustible(pais){
        if(pais==paris){
            return combustible >=50
        }
        else if(pais==buenosAires){
            return self.viajeRapido() 
        }
        else if(pais==bagdad){
            return combustible>0
        }
        else{
            if(vegas.homanejeando()==paris)
                return self.suficienteCombustible(paris)
            else if(vegas.homanejeando()==buenosAires)
                return self.viajeRapido()
            else{
                return combustible>0
            } 
        }

    }
    method puedeIrALaCiudad(lugar)= self.suficienteCombustible(lugar) 
    method viajeRapido()= combustible>=150
}