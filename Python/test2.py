#importacion de librerias que pueden necesitar
import pandas as pd
import csv
from datetime import datetime as d, timedelta as td,datetime as dt 
from dateutil.relativedelta import relativedelta as rd
# use esta fecha para hacer los calculos de edad, no use el dt.today(),       
#   FECHA A USARdt(2022, 1, 19)
#   FECHA A USARdt(2022, 1, 19)
#   FECHA A USARdt(2022, 1, 19)
#   FECHA A USARdt(2022, 1, 19)
#   FECHA A USARdt(2022, 1, 19)
#   FECHA A USARdt(2022, 1, 19)

df = pd.read_csv("carros.csv")
marca= df['marca']
modelo=df['modelo']
color= df['color']
placa=df['placa']
año=df['Ano_Compra']
mes=df['Mes_Compra']
dia=df['Dia_Compra']
fecha_act=dt(2022, 1, 19)

lista=[]
  
def UNO():
    for i in range(0,len(df)):
        primer=f'La marca de tu automovil es {marca[i]} {modelo[i]} de color {color[i]} y la placa es {placa[i]}'
        lista.append(primer)
        fecha=dt(year=int(año[i]), month=int(mes[i]), day=int(dia[i]))
        edad=rd(fecha_act,fecha)
        segundo=f'El automovil de placa {placa[i]}, fue comprado el {fecha.strftime("%A")}, {fecha.strftime("%d")} de {fecha.strftime("%B")} de {fecha.strftime("%Y")} y tiene {edad.years} años, {edad.months} meses y {edad.days} días'
        lista.append(segundo)
    return lista

def DOS():
    hoy = dt(2022, 1, 19)
    lista = []
    for i in range(len(df)):
      str1 = 'La marca de tu automovil es '+df['marca'][i]+' '+df['modelo'][i]+' de color '+df['color'][i]+' y la placa es '+df['placa'][i]
      lista.append(str1)
      # Cálculo de alineacion 
      fecha_de_alineacion = dt(year=df['Ano_Alineacion'][i], month=df['Mes_Alineacion'][i], day=df['Dia_Alineacion'][i])
      mesB = fecha_de_alineacion.strftime('%B')
      diaA = fecha_de_alineacion.strftime('%A')
      diaNumAli = fecha_de_alineacion.strftime('%d')
      str2= 'La última fecha de alineacion realizada fue el '+diaA+', '+str(diaNumAli)+' de '+mesB+ ' de '+str(df['Ano_Alineacion'][i])
      lista.append(str2)
      lista.append('Las siguientes fechas de alineacion programadas son:')
      fecha_de_alineacion1 = fecha_de_alineacion
      for j in range(1,4):
        fecha_de_alineacion1= fecha_de_alineacion1 + rd(years=1)
        diaW = fecha_de_alineacion1.strftime('%w')
        while (int(diaW) == 0 or int(diaW) == 5 or int(diaW) == 6):
          fecha_de_alineacion1 = fecha_de_alineacion1 + td(days=1)
          diaW = fecha_de_alineacion1.strftime('%w')
        prox_ali_dia = fecha_de_alineacion1.strftime('%A')
        prox_ali_dia_num = fecha_de_alineacion1.strftime('%d')
        prox_ali_mes = fecha_de_alineacion1.strftime('%B')
        prox_ali_ano = fecha_de_alineacion1.strftime('%Y')
        lista.append(prox_ali_dia+', '+prox_ali_dia_num+' de '+prox_ali_mes+' de '+prox_ali_ano)
      
      #Calculo cambio de aceite
      fecha_de_aceite = dt(year=df['Ano_Aceite'][i], month=df['Mes_Aceite'][i], day=df['Dia_Aceite'][i])
      mesAceite = fecha_de_aceite.strftime('%B')
      diaAceite = fecha_de_aceite.strftime('%A')
      diaNumAceite = fecha_de_aceite.strftime('%d')

      str4= 'La última fecha de cambio de aceite realizada fue el '+diaAceite+', '+str(diaNumAceite)+' de '+mesAceite+ ' de '+str(df['Ano_Aceite'][i])
      lista.append(str4)

      lista.append('Las siguientes fechas de cambio de aceite programadas son:')
      fecha_de_aceite1 = fecha_de_aceite
      for j in range(1,4):
        fecha_de_aceite1= fecha_de_aceite1 + rd(months=9)
        diaW = fecha_de_aceite1.strftime('%w')
        while (int(diaW) != 0 and int(diaW) != 6):
          fecha_de_aceite1 = fecha_de_aceite1 + td(days=1)
          diaW = fecha_de_aceite1.strftime('%w')
        prox_ali_dia = fecha_de_aceite1.strftime('%A')
        prox_ali_dia_num = fecha_de_aceite1.strftime('%d')
        prox_ali_mes = fecha_de_aceite1.strftime('%B')
        prox_ali_ano = fecha_de_aceite1.strftime('%Y')
        lista.append(prox_ali_dia+', '+prox_ali_dia_num+' de '+prox_ali_mes+' de '+prox_ali_ano)
        
        #Calculo balanceo
      fecha_de_balanceo = dt(year=df['Ano_Balanceo'][i], month=df['Mes_Balanceo'][i], day=df['Dia_Balanceo'][i])
      mesBalan = fecha_de_balanceo.strftime('%B')
      diaBalan = fecha_de_balanceo.strftime('%A')
      diaNumBalan = fecha_de_balanceo.strftime('%d')

      str3= 'La última fecha de balanceo realizada fue el '+diaBalan+', '+str(diaNumBalan)+' de '+mesBalan+ ' de '+str(df['Ano_Balanceo'][i])
      lista.append(str3)

      lista.append('Las siguientes fechas de balanceo programadas son:')
      fecha_de_balanceo1= fecha_de_balanceo
      for j in range(1,4):
        fecha_de_balanceo1= fecha_de_balanceo1 + rd(months=18)
        diaW = fecha_de_balanceo1.strftime('%w')
        while (int(diaW) == 0 or int(diaW) == 6):
          fecha_de_balanceo1 = fecha_de_balanceo1 + td(days=1)
          diaW = fecha_de_balanceo1.strftime('%w')
        prox_ali_dia = fecha_de_balanceo1.strftime('%A')
        prox_ali_dia_num = fecha_de_balanceo1.strftime('%d')
        prox_ali_mes = fecha_de_balanceo1.strftime('%B')
        prox_ali_ano = fecha_de_balanceo1.strftime('%Y')
        lista.append(prox_ali_dia+', '+prox_ali_dia_num+' de '+prox_ali_mes+' de '+prox_ali_ano)
      #Calculo tecnomecanica
      fecha_de_compra = dt(year=df['Ano_Compra'][i], month=df['Mes_Compra'][i], day=df['Dia_Compra'][i])
      anos = rd(hoy,fecha_de_compra).years
      fecha_de_tecno = ''
      diaW = 0
      if(anos < 6):
        fecha_de_tecno = fecha_de_compra + rd(years=6)
        while (int(diaW) != 5):
          fecha_de_tecno = fecha_de_tecno + td(days=1)
          diaW = fecha_de_tecno.strftime('%w')
        mesTecno = fecha_de_tecno.strftime('%B')
        diaTecno = fecha_de_tecno.strftime('%A')
        diaNumTecno = fecha_de_tecno.strftime('%d')
        anoTecno = fecha_de_tecno.strftime('%Y')

        lista.append('la primera prueba tecnicomecanica sera el:')
        lista.append(diaTecno+', '+diaNumTecno+' de '+mesTecno+' de '+anoTecno)
      else:
        fecha_de_tecno = dt(year=int(df['Ano_Tecnicomecanica'][i]), month=int(df['Mes_Tecnicomecanica'][i]), day=int(df['Dia_Tecnicomecanica'][i]))
        mesTecno = fecha_de_tecno.strftime('%B')
        diaTecno = fecha_de_tecno.strftime('%A')
        diaNumTecno = fecha_de_tecno.strftime('%d')

        str4= 'La última fecha de tecnicomecanica realizada fue el '+diaTecno+', '+str(diaNumTecno)+' de '+mesTecno+ ' de '+str(int(df['Ano_Tecnicomecanica'][i]))
        lista.append(str4)

        lista.append('Las siguientes fechas de tecnicomecanica programadas son:')
        fecha_de_tecno1 = fecha_de_tecno
        for j in range(1,4):
          fecha_de_tecno1= fecha_de_tecno1 + td(days=365)
          diaW = fecha_de_tecno1.strftime('%w')
          while (int(diaW) != 5):
            fecha_de_tecno1 = fecha_de_tecno1 + td(days=1)
            diaW = fecha_de_tecno1.strftime('%w')
          prox_ali_dia = fecha_de_tecno1.strftime('%A')
          prox_ali_dia_num = fecha_de_tecno1.strftime('%d')
          prox_ali_mes = fecha_de_tecno1.strftime('%B')
          prox_ali_ano = fecha_de_tecno1.strftime('%Y')
          lista.append(prox_ali_dia+', '+prox_ali_dia_num+' de '+prox_ali_mes+' de '+prox_ali_ano)
    return lista
    
lista1=[]
diction={"Renault":5,"Chevrolet":5,"Kia":7,"Volkswagen":12,"BMW":15}
def TRES():
    for i in range(0,len(df)):
          primer=f'La marca de tu automovil es {marca[i]} {modelo[i]} de color {color[i]} y la placa es {placa[i]}'
          lista1.append(primer)
          fecha=dt(year=int(año[i]), month=int(mes[i]), day=int(dia[i]))
          edad=rd(fecha_act,fecha)
          años=str(marca[i])
          if int(edad.years)>=diction.get(años):
            segundo=f'El automovil de placa {placa[i]} ha superado su vida util de {diction.get(años)} años'
            lista1.append(segundo)
          else:
            fecha2=fecha_act-d(year=int(año[i]), month=int(mes[i]), day=int(dia[i]))
            tercero=f"El automovil de placa {placa[i]}, tiene una vida util de {round(diction.get(años)*365.2425-fecha2.days,0)} dias son {round((diction.get(años)*365.2425-fecha2.days)/365.2425,0)} años aproximadamente"
            lista1.append(tercero)
    return lista1


def cuadradosFor():
  lista2=[]
  for i in range(0,100+1):
    lista2.append(i*i)
  return lista2
    
def cuadradosComprehion():
  return [i*i for i in range(0,100+1)]
  

def cuadradosFilter():
    cuadrados1=[i*i for i in range(101)]
    return list(filter(lambda x: x in cuadrados1, range(10001)))

def cuadrados():
    yield [i*i for i in range(0,100+1)]
    
#tiempos de jecución
from time import time
inicio = time()
# Código a medir
cuadradosFor()
# -------------
fin = time()
a=fin-inicio 
#print (f'El tiempo de ejecucion fue: {a:.20f}') # 0.00007343292236328125 segundos (cuadradosFor())

inicio2 = time()
# Código a medir
cuadradosComprehion()
# -------------
fin2 = time()
b=fin2-inicio2 
#print (f'El tiempo de ejecucion fue: {b:.20f}') #0.00004649162292480469 segundos (cuadradosComprehion())
  
inicio3 = time()
# Código a medir
cuadradosFilter()
# -------------
fin3 = time()
c=fin3-inicio3 
#print (f'El tiempo de ejecucion fue: {c:.20f}') #0.01570105552673339844 segundos (cuadradosFilter())

#inicio = time()
# Código a medir
#cuadrados()
# -------------
#fin = time()
#d=fin-inicio 
#print (f'El tiempo de ejecucion fue: {d:.20f}') #0.00009489059448242188 segundos (cuadrados())

#EL CÓDIGO MÁS EFICIENTE ES EL DE LIST COMPREHENSION AUNQUE DEPENDIENDO DE LA EJECUCIÓN A VECES LO ES MÁS EL DEL YIELD

#NO BORRAR
def switch_demo(argument):
    switcher = {
        1: UNO(),
        2: DOS(),
        3: TRES(),
        4: cuadradosFor(),
        5: cuadradosComprehion(),
        6: cuadradosFilter(),
        7: list(cuadrados())
    }
    return switcher.get(argument,"Llorelo papu")

if __name__ == "__main__":
    print(switch_demo(int(input())))