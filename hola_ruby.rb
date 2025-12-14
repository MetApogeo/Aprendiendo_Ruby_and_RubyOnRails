nombre = 'obed'
apellido = "perez" #se pueden usar ocn interpolaciones

nombre_completo = "#{nombre} #{apellido}"

puts nombre 

puts nombre.class # String

edad = 21
peso = 75.5

fecha_nacimiento = Time.new(2003, 12, 23)

# ? OPERADORES

suma = 10 + 5 # suma
resta = 10 - 5 # resta
multiplicacion = 10 * 5 # multiplicacion
division = 10 / 5 # division

es_mayor = 10 > 5 # mayor que
es_menor = 10 < 5 # menor que
es_mayor_igual = 10 >= 5 # mayor o igual que
es_menor_igual = 10 <= 5 # menor o igual que

es_igual = 10 == 5 # igual que
es_distinto = 10 != 5 # distinto que

## && and || or ! not

operador_and = (10 > 5) and (5 < 2) # false
operador_or = (10 > 5) or (5 < 2) # true
operador_not = not (10 > 5) # false

#! and, or, not. En Ruby, estos existen, pero tienen menor prioridad que =, mientras que && y || tienen mayor prioridad.

#TODO   ejemplo:

# Lo que tú crees que pasa:
exito = (guardar_usuario and enviar_email)

# Lo que Ruby entiende realmente:
(exito = guardar_usuario) and enviar_email

#? Usa siempre &&, ||, ! para lógica booleana.
#? Usa and/or solo para control de flujo en una línea (ej: hacer_algo or morir_en_el_intento).

#estructuras de control
edad=18
if edad >= 18
    puts "es mayor de edad"
else
    puts "es menor de edad"
end 

puts "Tienes 18 años" if edad == 18
puts "Tienes 19 años" if edad == 19

puts "Eres mayor de edad" unless edad < 18
puts "Eres mayor de edad" if not (edad < 18)

edad = 25
if edad < 18
    puts "Eres menor de edad"
elsif edad == 18
    puts "Tienes 18 años"
elsif edad < 25
    puts "Eres joven adulto"
else
    puts "Eres todo un adulto"
end

case(edad)
when edad < 18
    puts "Eres menor de edad"
when edad == 18
    puts "Tienes 18 años"
when edad < 25
    puts "Eres joven adulto"
else
    puts "Eres todo un adulto"
end

#Bucle while
contador = 1
while contador <=10
    puts contador
    contador += 1
end

for i in 1..10
    puts i
end

# Funciones

def suma(a, b)
    return a + b 
end

#es lo mismo, ruby retorna lo ultimo hecho en la función
def suma(a, b)
    a + b 
end

resultado = suma(10, 20) #30
resultado = suma 2,3 #5

class Persona
    #encapsulamiento
    # está diciendo a la instancia que tenga estos atributos, en otros lenguajes se llama encapsulamiento
    attr_accessor :nombre, :apellido
    
    def initialize(nombre, apellido)
        @nombre = nombre
        @apellido = apellido
    end

    def nombre_completo
        #el return es opcional ya que es redundante
        "#{nombre} #{apellido}"
    end

end 

persona = Persona.new("Obed", "Perez")
persona.nombre_completo

#Modulos o Polimorfismo

module Saludar
    def saluda
        puts "Hola"
    end
end

#Herencia

class Empleado < Persona
    include Saludar

    def initialize(nombre, apellido, salario)
        super(nombre, apellido)
        @salario = salario
    end

    def nombre_con_salario
        puts "#{self.nombre_completo} #{@salario}"
    end
end

empleado = Empleado.new("Obed", "Perez", 1000)
empleado.nombre_completo
empleado.nombre_con_salario



# Archivos

File.open('archivo.txt', 'w') do |f|
    f.write("Hola")
end

File.open('archivo.txt', 'r') do |f|
    puts f.read 
end

#* 'w': Escritura (borra el contenido anterior).

#* 'r': Lectura (solo lee).

#* 'a': Append (agrega al final sin borrar).

#* 'r+': Lectura y escritura.

# Hashes o Diccionarios

persona = {
    nombre: "Obed",
    apellido: "Perez"
}

puts persona[:nombre]
puts persona[:apellido]

# Arrays

arreglo = [1, 2, 3, 4, 5]
puts arreglo[0]
puts arreglo[1]
puts arreglo[2]
puts arreglo[3]
puts arreglo[4]

# Bloques
# .each es un método que recorre el arreglo que usa un iterador, es como el foreach de otros lenguajes
arreglo.each do |numero|
    puts numero
end

nombres = ['Obed', 'Ana', 'Juan', 'Maria']

nombres.push('Ana')

#devuelve todos los elementos que encuentre
nombres_con_a = nombres.select do |nombre|
    nombre.start_with?('A')
end


#devuelve el primer elemento que encuentre
nombres_con_a = nombres.find do |nombre|
    nombre.start_with?('A')
end

class Persona
    attr_accessor :nombre, :apellido, :genero, :edad, :es_activo

    def initialize(nombre, apellido, genero, edad, es_activo)
        @nombre = nombre
        @apellido = apellido
        @genero = genero
        @edad = edad
        @es_activo = es_activo
    end

    def nombre_completo
        "#{nombre} #{apellido}"
    end
end

persona1 = Persona.new("Obed", "Perez", "Masculino", 21, true)
persona2 = Persona.new("Ana", "Perez", "Femenino", 23, true)
persona3 = Persona.new("Juan", "Perez", "Masculino", 24, false)
persona4 = Persona.new("Maria", "Perez", "Femenino", 26, true)

personas = [persona1, persona2, persona3, persona4]

# Personas mayores de edad

personas_mayores = personas.select do |persona|
    persona.edad >= 18
end

personas_mayores = personas.select{|persona| persona.edad >= 18}

# Personas de genero masculino
masculinos = personas.select{|persona| persona.genero == "Masculino"}

masculinos_mayores = personas.select{|p| p.edad >= 18 and p.genero == "Masculino"}

#personas menores y mujeres
mujeres_menores = personas.select{|p| p.edad < 18 and p.genero == "Femenino"}

#Iteradores

numeros = [1, 2, 3, 4, 5]

dobles = numeros.map { |numero| numero * 2 } # [2, 4, 6, 8, 10]
pares = numeros.select { |numero| numero.even? } # [2, 4]
suma = numeros.reduce { |acumulador, numero| acumulador + numero } # 15

datos = ['Hola', nil, 'Mundo', nil]
limpios = datos.compact # ['Hola', 'Mundo']

# Diferencia entre .map y .map!

numeros = [1, 2, 3, 4, 5]
#? Sin signo de exclamación (map): Devuelve una copia modificada, pero el original se queda igual. (Es seguro).
dobles = numeros.map { |numero| numero * 2 } # [2, 4, 6, 8, 10]
#? Con signo de exclamación (map!): Modifica el array original.
numeros = numeros.map! { |numero| numero * 2 } # [2, 4, 6, 8, 10]
