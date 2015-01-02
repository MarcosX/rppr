class FlorDeFogo
  def pegar_flor_de_gelo
    FlorDeGelo.new
  end

  def pegar_estrela
    Estrela.new
  end

  def levar_dano
    Pequena.new
  end

  def pegar_flor_de_fogo
    self
  end
end
