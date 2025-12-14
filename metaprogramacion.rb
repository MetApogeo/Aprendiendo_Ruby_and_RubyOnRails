#Metodos dinamicos

class Persona
    %w[saludando corriendo].each do |accion|
        define_method(accion) do
            puts "Estoy #{accion}"
        end
    end
end

persona = Persona.new
persona.saludando
persona.corriendo

#Eval 
#permite guardar codigo en un string y ejecutarlo

codigo = "puts 'hola'"
eval(codigo)

class Calculadora
    def calcular 
        operacion = "100 + 50"
        eval(operacion)
    end
end

calc = Calculadora.new
puts calc.calcular

#! SOLO USAR EN CASOS ESPECIFICOS CONTROLADOS COMO EXPERIMENTOS NUNCA EN PRODUCCION

# Reflexion method_missing

class Fantasma
    def method_missing(nombre_metodo, *args)
        puts "El fantasma no sabe como #{nombre_metodo}, porque no existe"
    end

    # ESTO ES OBLIGATORIO para que sea un código robusto
    def respond_to_missing?(method_name, include_private = false)
        true # O tu lógica para decidir si responde o no
    end
end 

fantasma = Fantasma.new
fantasma.dormido
puts fantasma.respond_to?(:cualquier_cosa) # Ahora dirá TRUE, antes decía FALSE

#* La Regla de Oro: Siempre que definas method_missing, debes definir también respond_to_missing?.

#send

class Secreto
    private
    def susurrar
        "Soy privado"
    end
end

secreto = Secreto.new
puts secreto.susurrar #da error porque es privado
puts secreto.send(:susurrar)

#es util para acceder a metodos privados

# 🏋️‍♂️ Tu Desafío: "El Robot Políglota"

# Objetivo: Tienes que crear una clase Robot que no sabe hacer nada al principio. Pero, al instanciarse, le pasaremos una lista de idiomas que "aprende" instantáneamente usando metaprogramación.

# Requisitos:

# La clase Robot recibe un array de idiomas en el initialize (ej: ['ingles', 'frances', 'aleman']).

# En el initialize, usa define_method para crear un método por cada idioma.

# Si llamas a robot.ingles, debe imprimir: "Hablado en ingles".

# Luego, fuera de la clase, simula que recibes un input de usuario (un string como "frances") y usa send para hacer que el robot hable ese idioma.

class Robot
    def initialize(idiomas)
        idiomas.each do |idioma|
            define_singleton_method(idioma) do
                puts "Hablando en #{idioma}"
            end
        end
    end
end

lista_idiomas = ["ingles", "frances", "japones"]
bot = Robot.new(lista_idiomas)
bot.ingles

input_usuario = "japones"

bot.send(input_usuario)
