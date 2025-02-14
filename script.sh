#!/bin/bash

# Esto es un comentario

#Tipos de variables: Es universal pero se asigna como un número, un valor  booleano o una cadena de texto

n1=10
n2=7

echo "El valor de n1 es $n1" #para regresar mensajes a la terminal. $ es para hacer referencia al valor de la variable

#Estructuras condicionales
#Operadores condicionales <(-lt) >(-gt) <=(-le) =>(-ge) ==(-eq) !=(-ne)

if [[ $n1 -gt $n2 ]]; then
	echo "La sentencia es verdadera $n1 $n2"
else
	echo "La sentencia es falsa $n1 $n2"
fi

#Todo programa regresa un valor. Si es exitoso es 0
res=$?
echo "El resultado de la ejecución es $res"

if [[ $res == 0 ]]; then
	echo "La ejecución fue exitosa"
else
	echo "La ejecución fue fallida"
fi

#Operadores para administrar archivos
#-e: Si un archivo o una carpeta existe
#-d: Si es una carpeta
#-r -w -x
#-s Si el archivo esta vacio

file="./file-demo"

if [[ -s file ]]; then
	echo "El archivo contiene algo"
else	
	echo "El archivo esta vacio"
fi

#Operadores lógicos AND (&&), OR (||)

if [ -r $file ] && [ -x $file ]; then
	echo "El archivo se puede leer y ejecutar"
else
	echo "El archivo no se puede leer o no se puede ejecutar"
fi

#Estructura de control case: 
#case <<variable>> in
#	<<caso>> )
#		<<lógica>>
#	;;
#esac

# $ = array donde $# ($1, $2, $3,...,$n)

case $1 in
	hola )
		echo "Bienvenido"
	;;
	adios )
		echo "Hasta luego"
	;;
	*)
		echo "No entiendo"
	;;
esac 

#Estructuras de control iterativas 

# while
user=""
while [[ $user != "admin" ]]; do
	read -p "¿Cuál es tu usuario?" user
done

#for

for i in {1..5}; do
	echo "El número es $i"
done

for ((i=0; i<5; i++)); do
	echo "** El número es $i"
done

invitados=("Vero" "Mau" "Emi" "Mau2" "Gus")

for invitado in ${invitados[@]}; do #[] define el rango dentro del arreglo. @ indica que se usaran todos los elementos
	echo "Hola $invitado"
done

#Funciones

suma(){
	echo "Hola desde la función suma"
}

resta(){
	echo $(( $1 - $2))
}

suma
total=$(resta 9 4)
echo "El total es $total"
