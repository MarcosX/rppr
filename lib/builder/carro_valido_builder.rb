class CarroValidoBuilder
  attr_reader :modelo, :fabricante, :ano_fabricacao, :placa,
    :cor, :km_rodados, :ano_modelo, :preco_minimo,
    :preco_anunciado

  def initialize
    @modelo = 'Modelo A123'
    @fabricante = 'Fabricante ABCD'
    @placa = 'ABC1234'
    @ano_fabricacao = 2000
    @ano_modelo = 2001
  end

  def construir_carro
    Carro.new(@modelo, @fabricante, @ano_fabricacao, @placa,
              @cor, @km_rodados, @ano_modelo, @preco_minimo,
              @preco_anunciado)
  end

  def com_cor(cor)
    @cor = cor
    self
  end

  def com_preco_minimo(preco_minimo)
    @preco_minimo = preco_minimo
    self
  end

  def com_preco_anunciado(preco_anunciado)
    @preco_anunciado = preco_anunciado
    self
  end

  def com_quilometragem(km_rodados)
    @km_rodados = km_rodados
    self
  end

  def com_placa(placa)
    @placa = placa
    self
  end

  def com_modelo(modelo)
    @modelo = modelo
    self
  end

  def com_fabricante(fabricante)
    @fabricante = fabricante
    self
  end

  def com_ano_modelo(ano_modelo)
    @ano_modelo = ano_modelo
    self
  end

  def com_ano_fabricacao(ano_fabricacao)
    @ano_fabricacao = ano_fabricacao
    self
  end
end
