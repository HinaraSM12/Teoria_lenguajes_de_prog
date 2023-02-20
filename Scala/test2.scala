object Test {
    
    // No Cambiar este Método, es el caso de prueba
    def main(args: Array[String]){
        val Numero = scala.io.StdIn.readInt()
        if (Numero < 8) println(result(Numero)) else result(Numero)
        
    }
    

    val f2 = (a:Double, b:Double, c:Double) => 
        if (a+b>c & a+c>b & b+c>a) true else false
                                    
    def verificarTriangulo(f:(Double, Double, Double)=> Boolean, a:Double, b:Double, c:Double): Boolean= f(a,b,c)
    
    def reverse(r:String):String={
        if(r.length==0) r else reverse(r.tail) + r.head
    }
    
    def palindromo(p:(String) => String, str:String): Boolean= if(p(str)==str)true else false
    
    val filtro = List('a','e','i','o','u')
    
    def vocal1(filtro:List[Char], cadena:String): String= cadena.filter(filtro contains _)
        
    def vocal2(filtro:List[Char], cadena:String): String= cadena.map(X=>if (filtro contains X) X else " ").mkString(" ").replaceAll("\\s+","")
        
    def vocal3(filtro:List[Char], cadena:String): Unit= cadena.foreach(X => if (filtro contains X) print(X))
    
    //añada aqui en comentarios los casos de prueba que utilizo y  que imprime.
    //CASOS PRUEBA VOCAL1
        //print(vocal1(filtro, "holaperro")) da como resultado oaeo
        //print(vocal1(filtro, "soy linda")) da como resultado oia
        //print(vocal1(filtro, "tengo mucho sueño")) da como resultado eououeo
    
    //CASOS PRUEBA VOCAL2
        //print(vocal2(filtro, "ultimamente no tengo ganas de nada")) da como resultado uiaeeoeoaaeaa
        //print(vocal2(filtro, "a veces solo quiero dormir un año entero")) da como resultado aeeoouieooiuaoeeo
        //print(vocal2(filtro, "extraño a mi mami")) da como resultado eaoaiai
        
    //CASOS PRUEBA VOCAL3
        //vocal3(filtro, "los girasoles siempre seran suyos") da como resultado oiaoeieeeauo
        //vocal3(filtro, "al igual que mi corazon") da como resultado aiuaueioao
        //vocal3(filtro, "estoy muy rota") da como resultado eouoa
    
    
    
    //No borrar, esto sirve para que minaslap pueda hacer la evaluacion atumatica
    var result = (x:Int) => x match {
        case 1  => verificarTriangulo(f2,1,3,2)&&verificarTriangulo(f2,8,3,20) 
        case 2  => verificarTriangulo(f2,4,3,2)
        case 4  => palindromo(reverse,"annitalavalatinna") && palindromo(reverse,"allivesasevilla")  && palindromo(reverse,"allisimariaavisayasivaairamisilla")  
        case 7  => palindromo(reverse,"noespalindromo")
        case 8  => print(vocal1(filtro,"hola"))
        case 9  => print(vocal2(filtro,"suanaoria"))
        case 10  => vocal3(filtro,"quevivaeldoctor")
    }
    
}