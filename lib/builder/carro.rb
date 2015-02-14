class Carro
  attr_reader :erros

  attr_reader :modelo, :fabricante, :ano_fabricacao, :placa,
    :cor, :km_rodados, :ano_modelo, :preco_minimo,
    :preco_anunciado

  def initialize(modelo, fabricante, ano_fabricacao, placa,
                 cor, km_rodados, ano_modelo, preco_minimo,
                 preco_anunciado)
    @modelo = modelo
    @fabricante = fabricante
    @ano_fabricacao = ano_fabricacao
    @ano_modelo = ano_modelo
    @placa = placa
    @cor = cor || ''
    @km_rodados = km_rodados || 0
    @preco_minimo = preco_minimo || 0
    @preco_anunciado = preco_anunciado || 0
  end

  def validar!
    @erros ||= []
    if ano_fabricacao && ano_modelo
      @erros << 'ano do modelo nao pode ser anterior ao ano de fabricacao' if ano_fabricacao > ano_modelo
    end
    @erros << 'placa não pode ser nulo' unless @placa
    @erros << 'modelo não pode ser nulo' unless @modelo
    @erros << 'fabricante não pode ser nulo' unless @fabricante
    @erros.empty?
  end
end
