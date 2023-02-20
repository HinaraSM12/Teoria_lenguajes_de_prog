/* SOFASA considera en su linea de ensamble y mantenimiento de automóviles, 
de tres tipos de Sandero: Stepway, Aventure y Track.

Para la Línea de ensamble es indispensable calcular las siguientes
características de la ficha técnica, las cuales dependen del cilindraje
en centimetros cúbicos (cc) y la cantidad de válvulas (cv) del motor,
Cantidad de KM recorridos (cKM) y año del modelo (mod). Para los cálculos
se considera como año de referencia (aRef) el 2018.

Además, cada característica depende de una constante estimada para cada tipo
de automovi (kAuto).

pesoMxChasis está dado en toneladas, y se define como: (cc / cv * 0.7) + (cv * kAuto)
vidaUtilBandas está dado en KM, y se define como: (cKM / (aRef - mod)) * kauto
caballosFuerzaDesgaste está dado en HP, y se define como: (cc * cv) / (aRef - mod) + cKM * kAuto

Para el Stepway, kAuto es 0.012
Para el Aventure, kAuto es 0.048
Para el Track, kAuto es 0.271

La siguiente es una posible implementación mediante programación Funcional en Escala.
Por favor completa los espacios solicitados.
*/

object Concesionario { 
    
    //PUNTO REGEX NO BORRAR ESTE CODIGO
    import scala.util.matching.Regex

    case class Vehiculo(nombre: String, color: String, placa: String)
    // la lista de vehiculos
    val fruit= List(Vehiculo("VPL","rojo","LCE88B"), Vehiculo("VPL","rojo","L0CW883"), Vehiculo("VPL","rojo","ABPH000"), Vehiculo("VPL","rojo","LCW88A"), Vehiculo("VPL","rojo","LLL1112"), 
    Vehiculo("VPL","rojo","LCW883"), Vehiculo("VPL","rojo","MCM81I"), Vehiculo("VPL","rojo","UDU276"), Vehiculo("VPL","rojo","DBD31B"), Vehiculo("VPL","rojo","BZW693"), Vehiculo("VPL","rojo","EDH74d"),
    Vehiculo("VPL","rojo","SFE04Z"), Vehiculo("VPL","rojo","EDH74V"), Vehiculo("VPL","rojo","WYJ555"), Vehiculo("VPL","rojo","aAA123"), Vehiculo("VPL","rojo","HVI938"), 
    Vehiculo("VPL","rojo","URY248"), Vehiculo("VPL","rojo","TAY31S"), Vehiculo("VPL","rojo","TAY32S"), Vehiculo("VPL","rojo","VMH106"), Vehiculo("VPL","rojo","YYN85U"), 
    Vehiculo("VPL","rojo","A1A2A3"), Vehiculo("VPL","rojo","ETM64L"), Vehiculo("VPL","rojo","EEEEEEEEEEEEEOOOOOOOOOOO123"))

    
    def MotoCarro(vehiculos : List[Vehiculo]): List[String]={
        val carro = "([A-Z]{3})([0-9]{3})$".r
        val moto = "([A-Z]{3})([0-9]{2})([A-Z]{1})$".r
        var lista:List[String]=List()
        for(i <- vehiculos){
            i match{
                case Vehiculo(_,_,x) if carro.findPrefixOf(x)!= None => lista = lista :+ "Es un Carro"
                case Vehiculo(_,_,x) if moto.findPrefixOf(x)!=  None => lista = lista :+ "Es una Moto"
                case _ => lista = lista :+ "Placa no reconocida"
            }
        }
        lista
    }
    val respuestapunto4 = print(for(i<- MotoCarro(fruit)) yield i)


    
    // No Cambiar este Método, es el caso de prueba
  

    def main(args: Array[String]){
        //cc,cv,cKM,mod
        def lSanderos = List(Stepway(1600,16,90221,2011), Aventure(1600,16,90221,2011), Track(1600,16,90221,2011),
        Stepway(1600,8,15000,2016), Aventure(1600,16,50000,2011), Track(1200,16,100221,2010),
        Aventure(1800,8,54685,2013), Track(1100,16,9000,2013), Aventure(1600,16,15488,2014), Track(1400,16,2000,2016))
        val aSanderos = calculadoraSanderos.calCaracteristicas(lSanderos)
        val Numero = scala.io.StdIn.readInt()
        if (Numero == 1) {
            println("hola")
            aSanderos.foreach{f => println(f.getCaracteristicas())}
        } else {
            println(result(Numero)) 
        }
     
    }    

    var result = (x:Int) => x match {
        case 2  => respuestapunto4
    }

    def redondeo(numero: Double) : Double = {
    BigDecimal(numero).setScale(3, BigDecimal.RoundingMode.HALF_UP).toDouble
    }

    abstract class Sandero {
    def getCaracteristicas():String = s"$tipo, modelo: $mod | Chasis Mx: $pesoMxChasis Ton, Bandas: $vidaUtilBandas km, C.F. Desgaste: $caballosFuerzaDesgaste HP."
    val cc: Double
    val cv: Int
    val cKM: Double
    val mod: Double
    var caballosFuerzaDesgaste: Double
    val kAuto: Double
    var pesoMxChasis: Double
    var vidaUtilBandas: Double
    val tipo : String
    }


    //Para las case class se considera el siguiente orden (cc,cv,cKM,mod)

    
    case class Stepway(cc: Double, cv: Int, cKM: Double, mod: Double) extends Sandero {
    override val kAuto: Double = 0.012
    override var pesoMxChasis = 0.0
    override var vidaUtilBandas = 0.0
    override var caballosFuerzaDesgaste = 0.0
    override val tipo: String = "Stepway"
    }
    
    //Ej de retorno para getCaracteristicas(), si Stepway(1600,16,90221,2011):
    // Stepway, modelo: 2011 | Chasis Mx: 70.192 Ton, Bandas: 154.665 km, C.F. Desgaste: 4739.795 HP.
    

    case class Aventure(cc: Double, cv: Int, cKM: Double, mod: Double) extends Sandero {
    override val kAuto: Double = 0.048
    override var pesoMxChasis = 0.0
    override var vidaUtilBandas = 0.0
    override var caballosFuerzaDesgaste = 0.0
    override val tipo: String = "Aventure"
    }
    
    //Ej de retorno para getCaracteristicas(), si Aventure(1600,16,90221,2011):
    //Aventure, modelo: 2011 | Chasis Mx: 70.768 Ton, Bandas: 618.658 km, C.F. Desgaste: 7987.751 HP.
    
    case class Track(cc: Double, cv: Int, cKM: Double, mod: Double) extends Sandero {
    override val kAuto: Double = 0.271
    override var pesoMxChasis = 0.0
    override var vidaUtilBandas = 0.0
    override var caballosFuerzaDesgaste = 0.0
    override val tipo: String = "Track"
    }
    
    //Ej de retorno para getCaracteristicas(), si Track(1600,16,90221,2011):
    //Track, modelo: 2011 | Chasis Mx: 74.336 Ton, Bandas: 3492.842 km, C.F. Desgaste: 28107.034 HP.


    object calculadoraSanderos {
    val aRef: Double = 2018.0
    def calCaracteristicas(l: List[Sandero]): List[Sandero] = {
      l.foreach(s => {
        s.pesoMxChasis = redondeo((s.cc / s.cv * 0.7) + (s.cv * s.kAuto))
        s.vidaUtilBandas = redondeo((s.cKM / (aRef - s.mod)) * s.kAuto)
        s.caballosFuerzaDesgaste = redondeo((s.cc * s.cv) / (aRef - s.mod) + s.cKM * s.kAuto)
      })
      l
    }
  }
}
    