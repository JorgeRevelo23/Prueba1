require 'tk'

root = TkRoot.new { title "Gráfico de barras" }
#ingresar valores separdos por comas

# Cuadro de texto para ingresar los valores
text_box = TkEntry.new(root) {width 20}.grid(row: 0, column: 0, padx: 10, pady: 10)

# Botón para generar el gráfico de barras
generate_button = TkButton.new(root) {text 'Generar gráfico'}.grid(row: 0, column: 1, padx: 10, pady: 10)

# Función para generar el gráfico de barras
def generate_bar_chart(canvas, values)
  bar_width = 50
  max_value = values.max
  height_ratio = 300.0 / max_value  # Ajustar para que la altura máxima sea 300

  values.each_with_index do |value, index|
    # Calcular las coordenadas del rectángulo correspondiente al valor
    x0 = 100 + index * (bar_width + 10)
    y0 = 400
    x1 = x0 + bar_width
    y1 = y0 - value * height_ratio

    # Dibujar el rectángulo en el canvas
    TkcRectangle.new(canvas, x0, y0, x1, y1, 'width' => 1, 'fill'  => "blue") 

    # Mostrar el valor en la base del rectángulo
    TkcText.new(canvas, x0 + bar_width/2, y0 + 10, 'text' => value.to_s)
  end
end

# Asociar la función al botón
generate_button.command do
  # Obtener los valores ingresados en el cuadro de texto
  values = text_box.value.split(',').map(&:to_i)

  # Crear un canvas para dibujar el gráfico de barras
  canvas = TkCanvas.new(root, width: 600, height: 500).grid(row: 1, column: 0, columnspan: 2, padx: 10, pady: 10)

  # Generar el gráfico de barras
  generate_bar_chart(canvas, values)
end

Tk.mainloop