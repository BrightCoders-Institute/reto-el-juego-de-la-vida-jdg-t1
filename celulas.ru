#?Reglas
#?Rule 1 Cualquier célula viva con menos de dos vecinos vivos muere, como si fuera por falta de población.
#?Rule 2 Cualquier célula viva con más de tres vecinos vivos muere, como si fuera por sobre-población.
#?Rule 3 Cualquier célula viva con dos o tres vecinos vivos sobrevive a la siguiente generación.
#?Rule 4 Cualquier célula muerta con  vivos se convierte en una célula viva.exactamente tres vecinos

class Cells
    #?Initializing properties
    @numColumns = 0
    @numRows = 0
    @numCells = 0

    #?Contructor
    def initialize()
        #?Requesting the data from the user when the object is called
        requestData()
    end

    def requestData()
        #?Pedimos datos de entrada al usuario
        #!Numero de columnas
        #!Numero de filas
        #!Numero de celulas
        puts "Enter the num of columns of your matrix"
        puts "->"
        numColumns = gets.chomp.to_i
        
        puts "Enter the num of rows of your matrix"
        puts "->"
        numRows = gets.chomp.to_i
        
        puts "Enter the num of cells"
        puts "->"
        numCells = gets.chomp.to_i

        @numColumns = numColumns
        @numRows = numRows
        @numCells = numCells
    end

    #?Metodo para crear la matriz
    def createMatriz()
        #?Esta es una variable el cual contiene un objeto de la clase Array, el cual crea la matriz, dado el numero de columas y filas al ingresar a la clase "Cells"
        matrix = Array.new(@numRows) { Array.new(@numColumns, '.') }

        matrix.each do |row|
            puts row.join(" ")
        end

        print matrix
    end

    #?Metodo generar celula
    def generarPosicionCelula()

    end

    #?Metodo para contruir nuestra poblacion de celulas
    def construirPoblacionCelulas()

    end

     #?Metodo para revisar reglas del juego
    def reglas()

    end
end

poblacion1 = Cells.new()
poblacion1.createMatriz()
