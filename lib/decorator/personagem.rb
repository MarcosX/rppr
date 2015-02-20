class Personagem
  attr_reader :dano_base, :arma_atual, :velocidade

  def initialize(dano_base: dano_base, velocidade: velocidade)
    @dano_base = dano_base
    @velocidade = velocidade
  end

  def equipar_arma(arma)
    @arma_atual = arma
  end

  def forca_de_ataque
    @dano_base + @arma_atual.dano
  end

  def velocidade_de_ataque
    @velocidade + @arma_atual.bonus_velocidade
  end
end
