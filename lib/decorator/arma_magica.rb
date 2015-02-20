class ArmaMagica

  attr_reader :arma

  def initialize(arma)
    @arma = arma
  end

  def dano
    @arma.dano + 5
  end

  def bonus_velocidade
    @arma.bonus_velocidade + 4
  end
end
