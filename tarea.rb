require 'tk'
root = TkRoot.new
root.configure(background: "grey")

# Ingreso de valores
valores = TkLabel.new(root) do
   text 'Ingrese los valores separados por coma:'
   background 'skyblue'
   pack { padx 15; pady 15; side 'left' }
end

# Entrada de texto
entrada_texto = TkEntry.new(root) do
background 'grey'
  justify 'center'
  width 50
  pack { padx 15; pady 15; side 'left' }
end

# Botón para mostrar los valores ingresados
mostrar_valores = TkButton.new(root) do
  text 'Mostrar valores'
  background 'green'
  command {
    resultado = TkLabel.new(root) do
      text "Los valores ingresados son: #{entrada_texto.get}"
      pack { padx 15; pady 15; side 'left' }
    end
  }
  pack { padx 15; pady 15; side 'left' }
end

# Botón para calcular la media aritmética
media_aritmetica = TkButton.new(root) do
  text 'Calcular media aritmética'
  background 'green'
  command {
    valores = entrada_texto.get.split(',').map(&:to_f)
    total = valores.inject(0){|sum,x| sum + x }
    media = total/valores.length
    resultado_media = TkLabel.new(root) do
      text "Media aritmética: #{media}"
      pack { padx 15; pady 15; side 'left' }
    end
  }
  pack { padx 15; pady 15; side 'left' }
end

# Botón para calcular la mediana
mediana = TkButton.new(root) do
  text 'Calcular mediana'
  background 'yellow'
  command {
    valores = entrada_texto.get.split(',').map(&:to_f).sort
    if valores.length % 2 == 1
      mediana = valores[valores.length/2]
    else
      mediana = (valores[valores.length/2 - 1] + valores[valores.length/2]) / 2
    end
    resultado_mediana = TkLabel.new(root) do
      text "Mediana: #{mediana}"
      pack { padx 15; pady 15; side 'left' }
    end
  }
  pack { padx 15; pady 15; side 'left' }
end

# Botón para calcular la moda
moda = TkButton.new(root) do
  text 'Calcular moda'
  background 'yellow'
  command {
    valores = entrada_texto.get.split(',').map(&:to_f)
    modas = valores.inject(Hash.new(0)) { |hash, v| hash[v] += 1; hash }
    moda = valores.max_by { |v| modas[v] }
    resultado_moda = TkLabel.new(root) do
      text "Moda: #{moda}"
      pack { padx 15; pady 15; side 'left' }
    end
  }
  pack { padx 15; pady 15; side 'left' }
end

# Botón para calcular la varianza
varianza = TkButton.new(root) do
  text 'Calcular varianza'
  background 'red'
  command {
    valores = entrada_texto.get.split(',').map(&:to_f)
    total = valores.inject(0){|sum,x| sum + x }
    media = total/valores.length
    suma_de_diferencias_al_cuadrado = valores.inject(0) { |sum, x| sum + (x - media)**2 }
    varianza = suma_de_diferencias_al_cuadrado/(valores.length - 1)
    resultado_varianza = TkLabel.new(root) do
      text "Varianza: #{varianza}"
      pack { padx 15; pady 15; side 'left' }
    end
  }
  pack { padx 15; pady 15; side 'left' }
end

# Botón para calcular la desviación estándar
desviacion_estandar = TkButton.new(root) do
  text 'Calcular desviación estándar'
  background 'red'
  command {
    valores = entrada_texto.get.split(',').map(&:to_f)
    total = valores.inject(0){|sum,x| sum + x }
    media = total/valores.length
    suma_de_diferencias_al_cuadrado = valores.inject(0) { |sum, x| sum + (x - media)**2 }
    varianza = suma_de_diferencias_al_cuadrado/(valores.length - 1)
    desviacion_estandar = Math.sqrt(varianza)
    resultado_desviacion_estandar = TkLabel.new(root) do
      text "Desviación estándar: #{desviacion_estandar}"
      pack { padx 15; pady 15; side 'left' }
    end
  }
  pack { padx 15; pady 15; side 'left' }
end

# Botón para limpiar
limpiar = TkButton.new(root) do
  text 'Limpiar'
  background 'orange'
  command {
    entrada_texto.delete(0, 'end')
	
	
	
  }
  pack { padx 15; pady 15; side 'left' }
end

Tk.mainloop