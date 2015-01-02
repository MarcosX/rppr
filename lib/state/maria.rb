class Maria
  attr_reader :estado_atual

  # estados
  PEQUENA = :pequena
  FLOR_DE_GELO = :flor
  ESTRELA = :estrela
  MORTA = :morta

  def initialize
    @estado_atual = Maria::PEQUENA
  end

  def pegar_flor_de_gelo
    return if @estado_atual == Maria::ESTRELA
    @estado_atual = Maria::FLOR_DE_GELO
  end

  def pegar_estrela
    @estado_atual = Maria::ESTRELA
  end

  def levar_dano
    return if @estado_atual == Maria::ESTRELA
    if @estado_atual == Maria::PEQUENA
      @estado_atual = Maria::MORTA
    else
      @estado_atual = Maria::PEQUENA
    end
  end
end
