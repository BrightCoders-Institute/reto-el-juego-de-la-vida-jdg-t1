#?This class will reques the paramethers of number of columns, number of rows, and numbers of cells to create in the matrix
class RequestData
  attr_reader :numColumns, :numRows, :numCells

  def initialize
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

class GenerateRandomPositions
  def initialize(numberOfCells,lastPositionRow, lastPositionCol)
    @numberOfCells = numberOfCells
    @lastPositionRow = lastPositionRow - 1 #Because in programming we start with 0
    @lastPositionCol = lastPositionCol - 1 #Because in programming we start with 0
  end

  def generateRandomPositionCell
    randomPositionRow = 0
    randomPositionColumn = 0
    positions = []
    @numberOfCells
    for i in 1..@numberOfCells
      randomPositionRow = rand(0..@lastPositionRow)
      randomPositionColumn = rand(0..@lastPositionCol)
      positions.push([randomPositionRow,randomPositionColumn])
    end
    positions
  end
end


# ?Create matrix class
class GenerateEmptyMatrix
  def initialize(numRows,numColumns)
    @numRows = numRows
    @numColumns = numColumns
  end

  def createMatrixUser
    Array.new(@numRows) { Array.new(@numColumns, '.') }
  end
end

# ?Read matrix class
class ReadMatrix
  def initialize(positionCells)
    # @rowLimit = rowLimit - 1
    # @colLimit = colLimit - 1
    @positionCells = positionCells
  end

  def getCellStatusPosition()
    coordCelMuerta = []
    coordCelViva = []

    matrix = Array.new(4) { Array.new(8,'.') }

    #?THIS CODE IS GOOD
    @positionCells.each do |row, col|
      matrix[row][col] = '*'
    end
    #?

    # @matrix[1][4] = '*'
    # @matrix[2][5] = '*'
    # @matrix[2][6] = '*'


    rowlimit = 4
    collimit = 8

    #?Imprimir matriz demostrativa
    matrix.each do |row|
      puts row.join(' ')
    end
    if @positionCells.length != 0
      matrix.each_with_index do |row, row_index|
        row.each_with_index do |celula, col_index|
          # Access the celula and its position
          # puts "Celula #{celula} at position (#{row_index}, #{col_index})"
          celulaViva = '*'
          celulaMuerta = '.'

          # Imprime los vecinos
          ranterior = row_index - 1
          rsiguiente = row_index + 1
          canterior = col_index - 1
          csiguiente = col_index + 1

          superior = matrix[ranterior][col_index] if ranterior >= 0
          diagonalDS = matrix[ranterior][csiguiente] if ranterior >= 0 && csiguiente < collimit
          derecha = matrix[row_index][csiguiente] if csiguiente < collimit
          diagonalDI = matrix[rsiguiente][csiguiente] if rsiguiente < rowlimit && csiguiente < collimit
          abajo = matrix[rsiguiente][col_index] if rsiguiente < rowlimit
          diagonalII = matrix[rsiguiente][canterior] if rsiguiente < rowlimit && canterior >= 0
          izquierda = matrix[row_index][canterior] if canterior >= 0
          diagonalIS = matrix[ranterior][canterior] if ranterior >= 0 && canterior >= 0

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
          else #Revisa todos los lados
            neighbourCount += 1 if superior == '*'
            neighbourCount += 1 if diagonalDS == '*'
            neighbourCount += 1 if derecha == '*'
            neighbourCount += 1 if diagonalDI == '*'
            neighbourCount += 1 if abajo == '*'
            neighbourCount += 1 if diagonalII == '*'
            neighbourCount += 1 if izquierda == '*'
            neighbourCount += 1 if diagonalIS == '*'
          end
          # puts neighbourCount

          # ?Rule 1 Cualquier célula viva con menos de dos vecinos vivos muere, como si fuera por falta de población.
          # ?Rule 2 Cualquier célula viva con más de tres vecinos vivos muere, como si fuera por sobre-población.
          # ?Rule 3 Cualquier célula viva con dos o tres vecinos vivos sobrevive a la siguiente generación.
          # ?Rule 4 Cualquier célula muerta con vivos se convierte en una célula viva.exactamente tres vecinos

          #?Reglas para celula viva
          if celula == celulaViva 
            if neighbourCount < 2 || neighbourCount > 3
              #!muere celula
              coordCelMuerta.push(row_index, col_index)
              # @matrix[row_index][col_index] = '.'
            end
            if neighbourCount == 2 || neighbourCount == 3
              #?Sobrevive
              # @matrix[row_index][col_index] = '*'
              coordCelViva.push(row_index, col_index)
            end
          end

          #?Reglas para celula muerta
          if celula == celulaMuerta
            if neighbourCount == 3
              #Celula vive
              # @matrix[row_index][col_index] = '*'
              coordCelViva.push(row_index, col_index)
            end 
          end

          # @matrix.each do |row|
          #   puts row.join(' ')
          # end
        end
      end
    return coordCelViva, coordCelMuerta
    end
  end
end


class IterateMatrix
  def initialize(coordCelAlive,coordCelDead,emptyMatrix)
    @coordCelAlive = coordCelAlive
    @coordCelDead = coordCelDead
  end

  def iteratePoblacionCells()
    count = 0
    while @coordCelAlive
      lastIterationMatrix = Array.new(4) { Array.new(8,'.') }
  
      @coordCelAlive.each_slice(2) do |row_index, col_index|
        lastIterationMatrix[row_index][col_index] = '*'
      end

      if (@coordCelAlive)
        coordsCellAlive = @coordCelAlive.each_slice(2).to_a
        readMatrixIteration = ReadMatrix.new(coordsCellAlive)
        @coordCelAlive, @coordCelDead = readMatrixIteration.getCellStatusPosition()
        count += 1
        puts("Iteration #{count}")
        if count > 20 
          break
        end
      end
    end
  end
end

#?Requesting the data from user
# userAnswers = RequestData.new
# userAnswers.requestDataFromUser()

# #?Generating the random position 
# randomCellsPosition = GenerateRandomPositions.new(userAnswers.numCells,userAnswers.numRows,userAnswers.numColumns)
# print randomCellsPosition.generateRandomPositionCell()

# #?Generating the empty matrix
# generateEmptyMatrix = GenerateEmptyMatrix.new(userAnswers.numRows,userAnswers.numColumns)
# generateEmptyMatrix.createMatrixUser() #Empty matrix generated

#!TESTING 
matrix = GenerateEmptyMatrix.new(4,8)
matrixCreated = matrix.createMatrixUser()
readMatrix = ReadMatrix.new([[1,4],[1,5],[1,6]])
aliveCellPosition, deadCellPosition = readMatrix.getCellStatusPosition()
test1 = IterateMatrix.new(aliveCellPosition,deadCellPosition,matrixCreated)
test1.iteratePoblacionCells()