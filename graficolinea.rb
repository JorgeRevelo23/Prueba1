require 'tk'

root = TkRoot.new { title "Gráfico de líneas" }
#ingresar valores separdos por comas

# Cuadro de texto para ingresar los valores
text_box = TkEntry.new(root) {width 20}.grid(row: 0, column: 0, padx: 10, pady: 10)

# Botón para generar el gráfico de líneas
generate_button = TkButton.new(root) {text 'Generar gráfico'}.grid(row: 0, column: 1, padx: 10, pady: 10)

# Función para generar el gráfico de líneas
def generate_line_chart(canvas, values)
  line_width = 3
  max_value = values.max
  height_ratio = 400.0 / max_value  # Ajustar para que la altura máxima sea 400

  values.each_with_index do |value, index|
    # Calcular las coordenadas del punto correspondiente al valor
    x = 100 + index * (50 + 10)
    y = 400 - value * height_ratio

    # Dibujar el punto en el canvas
    TkcOval.new(canvas, x - line_width/2, y - line_width/2, x + line_width/2, y + line_width/2, 'width' => 1, 'fill' => "green")

    # Unir el punto con el anterior mediante una línea
    if index > 0
      x0 = 100 + (index - 1) * (50 + 10)
      y0 = 400 - values[index - 1] * height_ratio
      TkcLine.new(canvas, x0, y0, x, y, 'width' => line_width, 'fill' => "green")
    end

    # Mostrar el valor en el punto
    TkcText.new(canvas, x, y - 20, 'text' => value.to_s)
  end
end

# Asociar la función al botón
generate_button.command do
  # Obtener los valores ingresados en el cuadro de texto
  values = text_box.value.split(',').map(&:to_i)

  # Crear un canvas para dibujar el gráfico de líneas
  canvas = TkCanvas.new(root, width: 600, height: 500).grid(row: 1, column: 0, columnspan: 2, padx: 10, pady: 10)

  # Generar el gráfico de líneas
  generate_line_chart(canvas, values)
end

Tk.mainloop