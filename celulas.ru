# ?Reglas
# ?Rule 1 Cualquier célula viva con menos de dos vecinos vivos muere, como si fuera por falta de población.
# ?Rule 2 Cualquier célula viva con más de tres vecinos vivos muere, como si fuera por sobre-población.
# ?Rule 3 Cualquier célula viva con dos o tres vecinos vivos sobrevive a la siguiente generación.
# ?Rule 4 Cualquier célula muerta con vivos se convierte en una célula viva.exactamente tres vecinos

# ?Requesting data from the class
class RequestData
  attr_reader :numColumns, :numRows, :numCells

  # Contructor
  def initialize
    # ?Requesting the data from the user when the object is called
    @numColumns = 0
    @numRows = 0
    @numCells = 0
  end

  # Requesting data from user
  def requestDataFromUser
    puts 'Enter the num of columns of your matrix'
    puts '->'
    @numColumns = gets.chomp.to_i

    puts 'Enter the num of rows of your matrix'
    puts '->'
    @numRows = gets.chomp.to_i

    puts 'Enter the num of cells'
    puts '->'
    @numCells = gets.chomp.to_i
  end
end

# ?Create matrix class
class CreateMatrix
  def initialize(numColumns, numRows)
    @numColumns = numColumns
    @numRows = numRows
  end

  def createMatrixUser
    Array.new(@numRows) { Array.new(@numColumns, '.') }
  end
end

# ?Read matrix class
class ReadMatrix
  def initialize(matrix)
    @coordCelMuerta= []
    @coordCelViva = []
    @matrix = matrix
    @matrixVacia= matrix

  end

  def printNeighbours
    # Celulas prueba
    # matrix[fila][columna]
    @matrix[1][4] = '*'
    @matrix[2][5] = '*'
    @matrix[2][6] = '*'


    rowlimit = 4
    collimit = 8

    #?Imprimir matriz demostrativa
    @matrix.each do |row|
      puts row.join(' ')
    end

    @matrix.each_with_index do |row, row_index|
      row.each_with_index do |element, col_index|
        # Access the element and its position
        puts "Element #{element} at position (#{row_index}, #{col_index})"
        celulaViva = '*'
        celulaMuerta = '.'

        # Imprime los vecinos
        ranterior = row_index - 1
        rsiguiente = row_index + 1
        canterior = col_index - 1
        csiguiente = col_index + 1

        superior = @matrix[ranterior][col_index] if ranterior >= 0
        diagonalDS = @matrix[ranterior][csiguiente] if ranterior >= 0 && csiguiente < collimit
        derecha =  @matrix[row_index][csiguiente] if csiguiente < collimit
        diagonalDI = @matrix[rsiguiente][csiguiente] if rsiguiente < rowlimit && csiguiente < collimit
        abajo = @matrix[rsiguiente][col_index] if rsiguiente < rowlimit
        diagonalII = @matrix[rsiguiente][canterior] if rsiguiente < rowlimit && canterior >= 0
        izquierda = @matrix[row_index][canterior] if canterior >= 0
        diagonalIS = @matrix[ranterior][canterior] if ranterior >= 0 && canterior >= 0

        # Contador de vecinos
        neighbourCount = 0

        if row_index == 0 && col_index == 0
          neighbourCount += 1 if derecha == '*'
          neighbourCount += 1 if diagonalDI == '*'
          neighbourCount += 1 if abajo == '*'
        elsif row_index == rowlimit && col_index == collimit # Verifica arriba, diagonalSI, izquierda
          neighbourCount += 1 if superior == '*'
          neighbourCount += 1 if diagonalIS == '*'
          neighbourCount += 1 if izquierda == '*'
        elsif row_index == 0 # Verifica derecha, izquierda, diagonalIZ, abajo, diagonalID
          neighbourCount += 1 if derecha == '*'
          neighbourCount += 1 if izquierda == '*'
          neighbourCount += 1 if diagonalII == '*'
          neighbourCount += 1 if abajo == '*'
          neighbourCount += 1 if diagonalDI == '*'
        elsif col_index == 0 # verifica arriba, diagonalSD, derecha, diagonalID, abajo
          neighbourCount += 1 if superior == '*'
          neighbourCount += 1 if diagonalDS == '*'
          neighbourCount += 1 if derecha == '*'
          neighbourCount += 1 if diagonalDI == '*'
          neighbourCount += 1 if abajo == '*'
        elsif row_index == rowlimit # Verifica derecha, izquierda, diagonalSI, arriba, diagonalSD
          neighbourCount += 1 if derecha == '*'
          neighbourCount += 1 if izquierda == '*'
          neighbourCount += 1 if diagonalSD == '*'
          neighbourCount += 1 if diagonalIS == '*'
          neighbourCount += 1 if superior == '*'
        elsif col_index == collimit # verifica arriba, diagonalSI, izquierda, diagonalID, abajo
          neighbourCount += 1 if superior == '*'
          neighbourCount += 1 if diagonalIS == '*'
          neighbourCount += 1 if izquierda == '*'
          neighbourCount += 1 if diagonalII == '*'
          neighbourCount += 1 if abajo == '*'
        else
          neighbourCount += 1 if superior == '*'
          neighbourCount += 1 if diagonalDS == '*'
          neighbourCount += 1 if derecha == '*'
          neighbourCount += 1 if diagonalDI == '*'
          neighbourCount += 1 if abajo == '*'
          neighbourCount += 1 if diagonalII == '*'
          neighbourCount += 1 if izquierda == '*'
          neighbourCount += 1 if diagonalIS == '*'
        end
        puts neighbourCount

        if element == celulaViva
          if neighbourCount < 2 || neighbourCount > 3
            # ?Rule 1 Cualquier célula viva con menos de dos vecinos vivos muere, como si fuera por falta de población.
            # ?Rule 2 Cualquier célula viva con más de tres vecinos vivos muere, como si fuera por sobre-población.
            #muere celula
            
            @coordCelMuerta.push(row_index, col_index)
            #@matrix[row_index][col_index] = '.'

          end
          if neighbourCount == 2 || neighbourCount == 3
            # ?Rule 3 Cualquier célula viva con dos o tres vecinos vivos sobrevive a la siguiente generación.
            #Sobrevive
            # @matrix[row_index][col_index] = '*'
            @coordCelViva.push(row_index, col_index)
          end
        end

        if element == celulaMuerta
          # ?Rule 4 Cualquier célula muerta con vivos se convierte en una célula viva.exactamente tres vecinos
          if neighbourCount == 3
            #Celula vive
            #@matrix[row_index][col_index] = '*'
            @coordCelViva.push(row_index, col_index)
          end 
        end

        @matrix.each do |row|
          puts row.join(' ')
        end

      end
    end
     finalMatrix(@coordCelViva, @coordCelMuerta)
  end

  def finalMatrix(coordCelViva, coordCelMuerta)

    matrixVacia= Array.new(4) { Array.new(8, '.') }
 
    @coordCelViva.each_slice(2) do |row_index, col_index|
        matrixVacia[row_index][col_index] = '*'
     end

     matrixVacia.each do |row|
        puts row.join(' ')
        
      end
      print coordCelMuerta
      print coordCelViva

  end

end


# dataRequested = RequestData.new.requestDataFromUser
matrixCreated = CreateMatrix.new(8, 4).createMatrixUser
matrixReaded = ReadMatrix.new(matrixCreated).printNeighbours
