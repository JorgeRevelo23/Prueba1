require 'tk'

# Solicitar al usuario que ingrese una lista de números separados por comas
puts "Ingrese una lista de números separados por comas: "
input = gets.chomp

# Convertir la lista de números ingresados por el usuario a una matriz de números

numbers = input.split(",").map(&:to_i)

# Calcular la suma total de todos los números ingresados por el usuario
total = números.reducir(:+)

# Calcular el porcentaje de cada número en relación con la suma total
porcentajes = números.mapa { |n| n.to_f / total * 100 }

# Crear una ventana usando la librería Tk y agregar un objeto de lienzo para dibujar el gráfico de sectores
root = TkRoot.new { title "Gráfico de sectores" }
canvas = TkCanvas.new(root) { width 400; height 400; pack }

# Definir el centro del gráfico de sectores y el radio
center_x = 200
center_y = 200
radio = 150

# Iterar sobre la matriz de números y dibujar cada sección del gráfico de sectores utilizando el porcentaje de cada número
start_angle = 0
percentages.each_with_index hacer |porcentaje, i|
 ángulo = porcentaje * 3.6 # 360 grados / 100%
 end_angle = start_angle + ángulo

# Calcular las coordenadas del arco del gráfico de sectores
 x1 = center_x + radio * Math.cos(start_angle * Math::PI / 180)
 y1 = center_y + radio * Math.sin(start_angle * Math::PI / 180)
 x2 = center_x + radio * Math.cos(end_angle * Matemáticas::PI / 180)
 y2 = center_y + radio * Math.sin(end_angle * Math::PI / 180)

# Dibujar el arco en el lienzo
 canvas.create_arc(x1, y1, x2, y2, fill: TkNamedColor.new(Tk.root, Tk::Util.color_sample(i)), start: start_angle, extent: angle)

start_angle = end_angle
fin

# Mostrar la ventana con el gráfico de sectores
Tk.mainloop 