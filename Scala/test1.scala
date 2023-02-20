object Test {
    //Desarrollar las siguientes funciones anónimas y asignarlas a las constantes

    //(val) siguientes:

    //1 – val mcd (máximo común divisor) de 3 números. 

    //2 – val celsius que convierte grados fahrenheit a celsius a. 

    //3 – val millas que convierte kms en millas.(un kilometro equivale a 0.62137 millas)

    //4 – val area_circulo: devuelve el area de un círculo a partir del radio. (use como valor de pi=3.1416)

    //5 – Crear una funcion anónima para hacer una tasa de cambio (Euros A Pesos Colombianos) Utilizando la siguiente conversion: 1 Euro = 4.384,32 Pesos Colombianos

    //(val).
    
    // No Cambiar este Método, es el caso de prueba
    def main(args: Array[String]){
        val Numero = scala.io.StdIn.readInt()
        println(result(Numero))
    }
    
    import scala.math._
    def mcd(x:Double, y:Double): Double = y match {
    case 0 => x
    case _ => mcd(y, x%y)
   }
    
    val mcd1 = (x:Double,y:Double,z:Double) => mcd(x,mcd(y,z))
    
    val celsius = (i:Float)=> (i-32)*1/1.8
    
    val millas = (k:Float)=> k*0.62137
    
    val area_circulo = (r:Float)=> 3.1416*(r*r)
    
    val Pesos = (p:Float)=> p*4384.32
    
    //Primera función: distancia recorrida en km en un movimiento MRUV, el tiempo t debe de estar en horas, 
    //la velocidad inicial vo en km/h y la aceleración en km/h^2, el ejemplo que usé fue cual es la distancia 
    //recorrida por un automóvil que se desplaza a 20 km/h durante 10 horas y con una aceleración de 6 km/h^2, 
    //la respuesta es 200 km
    val distancia_recorrida_km_MRUV = (vo:Float, t:Float, a:Float) => vo*t+1/2*a*(t*t)
    print(distancia_recorrida_km_MRUV(20,10,6))
    
    //Segunda ley de Newton: La aceleración de un objeto es directamente proporcional a la suma de todas las 
    //fuerzas que actúan sobre él e inversamente propocional a la masa del objeto, Masa es la cantidad de 
    //materia que el objeto tiene. El ejemplo es cual es la fuerza que hay que aplicarle a una pelota de fútbol 
    //de 0,4 kg para patearla con una aceleración de 3,5 m/s^2. En este caso, sería 1.4 N
    val fuerza = (m:Double, a:Double) => m*a
    print(fuerza(0.4,3.5))
    
    //Ley de gravitación universal es una ley física clásica que describe la interacción gravitatoria entre 
    //distintos cuerpos con masa. La fuerza con que se atraen dos cuerpos tenía que ser proporcional al producto
    //de sus masas dividido por la distancia entre ellos al cuadrado. El ejemplo es el siguiente: Supongamos que 
    //una masa de 800 kg y otra de 500 kg se atraen en el vacío, separadas por un espacio de 3 metros. ¿Cómo podemos
    //calcular la fuerza de atracción que experimentan? tomando G=6.67×10^-11 N.m^2/kg^2
    val fuerza_gravitacional = (M:Float, m:Float, r:Float) => 6.67*scala.math.pow(10,-11)*(M*m)/(r*r)
    print(fuerza_gravitacional(800,500,3))
    
    //Cuarta función por si alguna no es tan interesante:
    //Ecuación para hallar la pendiente de una recta a partir de dos puntos  se halla a partir del cociente de
    //la diferenca entre las ordenadas y la diferencia de las abcisas de los dos puntos
    //a partir de los puntos (0,3) y (-1,0) hallamos que la pendiente es 3
    val pendienteRecta = (x1:Float, x2:Float, y1:Float, y2:Float) => (y2-y1)/(x2-x1)
    print(pendienteRecta(0,-1,3,0))
    
    //No borrar, esto sirve para que minaslap pueda hacer la evaluacion atumatica
    var result = (x:Int) => x match {
        case 1  => List(mcd1(25,50,15),mcd1(5,7,11),mcd1(100,10,50))
        case 4  => List(celsius(0),celsius(32),celsius(100)) 
        case 7  => List(millas(100),millas(666),millas(333))
        case 10 => List(area_circulo(10),area_circulo(100),area_circulo(666))
        case 13 => List(Pesos(1),Pesos(1000),Pesos(666))

    }
    
}