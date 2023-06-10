[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/OKSA7dn9)
![BrightCoders Logo](img/logo.png)

# El juego de la vida

## Tabla de contenidos
* Descripción
* Instrucciones
* Resultados
* Créditos
* Ubicación del repositorio
* Recursos
---

### **Descripción**
Este Desafío de Codificación se trata de calcular la siguiente generación del juego de la vida de Conway, dada cualquier posición inicial.

Comienzas con una cuadrícula bidimensional de células, donde cada célula está viva o muerta. En esta versión del problema, la cuadrícula es finita y ninguna vida puede existir más allá de los bordes. Al calcular la siguiente generación de la cuadrícula, sigue estas reglas:

1. Cualquier célula viva con menos de dos vecinos vivos muere, como si fuera por falta de población.
2. Cualquier célula viva con más de tres vecinos vivos muere, como si fuera por sobre-población.
3. Cualquier célula viva con dos o tres vecinos vivos sobrevive a la siguiente generación.
4. Cualquier célula muerta con exactamente tres vecinos vivos se convierte en una célula viva.
---
### **Instrucciones**
- Debes escribir un programa que acepte una cuadrícula arbitraria de células y muestre como resultado una cuadrícula similar que muestre la siguiente generación.
Utilizando Ruby, se desarrollará una solución completa para el juego de la vida.
- Se utilizará RuboCop para garantizar la consistencia y legibilidad del código, siguiendo las mejores prácticas y convenciones de estilo de Ruby.
- La solución deberá seguir el enfoque orientado a objetos.
- Se fomentará la rotación de los participantes en los commits, promoviendo una participación equitativa y una responsabilidad compartida.
- En cada commit realizado, se registrarán todos los participantes activos a través de co-author commits.
- Se pondrá en práctica el concepto de desarrollo basado en pruebas utilizando RSpec o MiniTest.
- Se aplicará el concepto de commits significativos.
---
### **Resultados**

El porgrama recibe los siguinetes parámetros del usuario; número de filas, numero de columnas y la cantidad de céluas vivas con las que desea iniciar. El programa crea la matriz con las dimensiones asignadas por el usuario. Genera una posición aletoria para cada una de las células agregadas.

Después evalua una serie de reglas establecidas en los requerimientos y decide cuáles cálulas viven y cuales mueren. Se genera una nueva matriz y se reemplazan los valores. Así por cada generación.

---

### **Créditos**

* Cárdenas Jonathan @jcardenas0
* López José @JoseLopezSolis
---

### 📚 Recursos

- Desarrollo Basado en Pruebas
- RuboCop
- Principios SOLID y Polimorfismo
- Git & Github
- Principios SOLID, DRY, KISS & YAGNI


### **Ubicación del repositorio**
https://github.com/BrightCoders-Institute/reto-el-juego-de-la-vida-jdg-t1
