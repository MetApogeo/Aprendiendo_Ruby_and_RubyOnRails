begin
    # codigo que puede generar una excepcion
rescue
    # codigo que se ejecuta si hay una excepcion
ensure
    # codigo que se ejecuta siempre
end

#? EJEMPLO:

def dividir(a,b)
    begin
        resultado = a/b
        puts "El resultado es #{resultado}"
    rescue ZeroDivisionError
        puts "No se puede dividir entre cero"
    rescue => e
        puts "Ocurrio un error inesperado: #{e.message}"
    ensure
        puts "Fin del bloque"
    end
end

#* EXCEPCION PERSIONALIZADA

# 1. Defines la excepción (SOLITA, sin lógica dentro)
class EdadInvalidaError < StandardError; end

# 2. Defines la lógica en otro lado (Ej. una clase Usuario)
class RegistroUsuario
    def registrar(nombre, edad)
        # Aquí lanzamos el error que creamos arriba
        raise EdadInvalidaError, "La edad no puede ser negativa" if edad < 0
        puts "Usuario #{nombre} registrado con la edad #{edad}"
    rescue EdadInvalidaError => e
        puts "Error capturado: #{e.message}"
    end
end

# 3. Ejecutas
registro = RegistroUsuario.new
registro.registrar("Obed", -21)


#bloques, Procesos y Lambdas

#bloque
mi_bloque do
    puts "Este es un bloque"
end

mi_bloque2 {
    puts "Este es un bloque"
} 

#! LA FORMA DE USARLOS

def mi_bloque
    yield # Aquí se ejecuta el bloque
end

# Ahora sí funciona:
mi_bloque do
    puts "Este es un bloque"
end

#proceso
mi_proc = Proc.new {puts "soy un proc"}
mi_proc.call

#lambda (es un proceso que puede ser guardado en una variable)

mi_lambda = -> {puts "soy un lambda"}
mi_lambda.call


#? EJEMPLO BLOQUE

def saludar_con_nombre
    puts "hola"
    yield
    puts "que gusto verte"
end

#enviando un bloque
saludar_con_nombre do
    puts "me llamo obed"
end

#? EJEMPLO PROC

mi_proc2 = Proc.new do
    puts "soy un proc"
end
mi_proc2.call

#? EJEMPLO LAMBDA

mi_lambda2 = -> (nombre) do
    puts "Hola, #{nombre} un gusto"
    return "fin del metodo" #lambda si puede retornar un valor
end

mi_lambda2.call('Sofia')


#! DIFERENCIAS ENTRE PROC Y LAMBDA

#todo A. Argumentos (Strict vs Loose)

    #? Lambda (Estricta): Si le pides 2 argumentos y le das 1, explota (Error). Se comporta como un método real.

    #? Proc (Relajada): Si le pides 2 argumentos y le das 1, rellena el que falta con nil y sigue feliz.

#! PROBLEMA DE RETURN

    #? Lambda: El return solo se sale de la lambda. El código sigue corriendo después.

    #? Proc: El return MATA al método que llamó al Proc. ¡Se sale de todo!

def prueba_proc
    mi_proc = Proc.new { return "Salí desde el Proc" }
    mi_proc.call
    return "Esto NUNCA se va a imprimir" # El Proc mató el método antes de llegar aquí
end

def prueba_lambda
    mi_lambda = -> { return "Salí desde la Lambda" }
    mi_lambda.call
    return "Esto SÍ se imprime" # La lambda volvió aquí y el método siguió
end

puts prueba_proc   # Imprime: "Salí desde el Proc"
puts prueba_lambda # Imprime: "Esto SÍ se imprime"