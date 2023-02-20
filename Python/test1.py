# 1. Definir una función filter que imprima los primos que existen en el rango de 1 a tope (i.e. range(1,tope+1)). 
#De esta forma, la función de orden superior filter debe utilizar una función booleana llamada “esprimo(n)” la cual devuelve True si el n es primo y False en caso contrario.
#La variable tope se obtiene como parametro de entrada de una función, asi:

def esprimo(num):
    for n in range(2,num):
        if num%n==0:
            return False
    return True

def filterprimo(tope):
    #Aqui va su codigo, por favor no borrar la linea de abajo, esto ayuda a validar los resultados en minaslap
    listaprimo = list(filter(esprimo, range(2,tope+1)))
    listaprimos = [y for y in listaprimo]
    return listaprimos

#2. Utilizar la noción de generador para crear una función gen_primos(N) que devuelva una lista con los numeros primos hasta N. 
#La función gen_primos utiliza la función booleana esprimo(i) para determinar si i es primo (True) o no (False).
#def esprimo(_):

def gen_primos(N):
    #Aqui va su codigo, por favor no borrar la linea de abajo, esto ayuda a validar los resultados en minaslap
    listaprimo = list(range(2,N+1))
    listaprimo2=[]
    for k in range(0, len(listaprimo)):
        if esprimo(listaprimo[k])==True:
            listaprimo2.append(listaprimo[k])
    listaprimos = (x for x in listaprimo2)
    return listaprimos

# 3. Programar Factorial Recursivo Cola (Tail).
def tailFactorial(n, acum=1):
    if n == 0: return acum
    else: return tailFactorial(n-1, acum * n)
    #Aqui va su codigo, tambien debe rellenar los parametros de la funcion y el retorno
    
#comparacion de factorial normal
def factorial(n):
  if n<=0:
    return 1
  else:
    return n*factorial(n-1)

#tiempos de jecución
from time import time
inicio = time()
# Código a medir
tailFactorial(50,1)
# -------------
fin = time()
a=fin-inicio 
#print (f'El tiempo de ejecucion fue: {a:.20f}') #0.00002551078796386719 segundos (factorial tail recursion)

inicio2 = time()
# Código a medir
factorial(50)
# -------------
fin2 = time()
b=fin2-inicio2 
#print (f'El tiempo de ejecucion fue: {b:.20f}') # 0.00001692771911621094 segundos (factorial normal)

#El tiempo de ejecución del tail recursion fue más demorado que el del factorial normal
#print(a-b) # con una diferencia de 8.58306884765625e-06 segundos


# 4. Programar Fibonacci Simple (n) y Fibonacci Recursivo Cola (n).
def fibonacci(n):
    if n<2:
        return n
    else:
        return fibonacci(n-1) + fibonacci(n-2)

def tailfibonacci(n,acum=0,R=1):
    if n == 0: return acum
    elif n==1: return R
    else: return tailfibonacci(n-1,R, acum+R)
    
inicio = time()
# Código a medir
fibonacci(20)
# -------------
fin = time()
a=fin-inicio #0.00229144096374511719 fibonacci normal
#print (f'El tiempo de ejecucion fue: {a:.20f}')

inicio2 = time()
# Código a medir
tailfibonacci(20,0,1)
# -------------
fin2 = time()
b=fin2-inicio2 # 0.00000572204589843750 fibonacci tail recursion
#print (f'El tiempo de ejecucion fue: {b:.20f}')
    
#El tiempo de ejecución del tail recursion fue más rápido que el del fibonacci normal
#print(a-b) # con una diferencia de 0.0022857189178466797 segundos


# 5. DarkSouls de los DarkSouls

def subconjuntos(numeros):
    return subconjunto([], sorted(numeros))

def subconjunto(actual, conjunto):
    if conjunto:
        return subconjunto(actual,conjunto[1:])+subconjunto(actual+[conjunto[0]], conjunto[1:])
    return [actual]

def existe(Peso,Pesos):
    b=subconjuntos(Pesos)
    a=[]
    for i in b:
        suma=0
        for x in i:
            suma+=x
        if suma==Peso:
            a.append(i)
    a.sort()
    a.sort(key=lambda x : len(x))
    return a
    