class Maria
  attr_reader :estado_atual
  def initialize
    @estado_atual = Pequena.new
  end

  def pegar_flor_de_gelo
    @estado_atual = @estado_atual.pegar_flor_de_gelo
  end

  def pegar_flor_de_fogo
    @estado_atual = @estado_atual.pegar_flor_de_fogo
  end

  def pegar_estrela
    @estado_atual = @estado_atual.pegar_estrela
  end

  def levar_dano
    @estado_atual = @estado_atual.levar_dano
  end
end
