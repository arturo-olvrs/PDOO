module Irrgarten
# Author: Joaquin Avilés de la Fuente
# Author: Arturo Olivares Martos

require_relative 'dice'

    # Clase Monster
    # 
    # Clase que representa a los monstruos del juego

    class Monster
        @@INITIAL_HEALTH = 5 # Salud inicial de los monstruos

        @@INVALID_POS = -1 # Posición inválida

        # Constructor de la clase Monster. Inicializa los atributos de la clase.
        # La posición inicial del monstruo es inválida
        #
        # @param name Nombre del monstruo
        # @param intelligence Inteligencia del monstruo
        # @param strength Fuerza del monstruo
        def initialize(name, intelligence, strength)
            @name = name
            @intelligence = intelligence
            @strength = strength
            @health = @@INITIAL_HEALTH

            @row = @@INVALID_POS
            @col = @@INVALID_POS
        end

        # Método que informa si el monstruo ha muerto o no.
        # Un monstruo ha muerto si su salud es menor o igual que 0
        #
        # @return true si el monstruo ha muerto, false en caso contrario
        def dead
            return @health <= 0
        end
        
        # Método que devuelve la intensidad del ataque de un monstruo. Delega en Dice.intensity
        #
        # @return intensidad del ataque
        def attack
            return Dice.intensity(@strength)
        end
        
        def defend(recieved_attack)
            # Sig. Práctica
        end

        # Modificador de la posición del monstruo
        #
        # @param coords coordenadas de la posición del monstruo
        def pos=(coords)
            @row, @col = coords
            # // TODO: Preguntar cómo se pone. Si hay que cambiarlo, cambiar en todo
        end

        # Método que genera una cadena de caracteres con la información del monstruo
        #
        # @return cadena de caracteres con la información del monstruo
        def to_s
            return "M[n:#{@name}, i:#{@intelligence}, s:#{@strength}, h:#{@health}, p:(#{@row}, #{@col})]"
        end

        private

        # Método que reduce la salud del monstruo en 1
        def got_wounded()
            @health -= 1
        end
    end

end