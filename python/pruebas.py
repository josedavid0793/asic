print("Programa de prueba")

numero1=int(input("Ingrese un número:  "))
numero2=int(input("Ingrese siguiente número:  "))

def Devuelvemax(num1,num2):

	if num1<num2:
		print(num2)
	elif num2<num1:
		print(num1)
	else:
		print("Ambos números son iguales")

Devuelvemax(numero1,numero2)