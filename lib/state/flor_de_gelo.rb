class FlorDeGelo
  def pegar_flor_de_gelo
    self
  end

  def pegar_estrela
    Estrela.new
  end

  def levar_dano
    Pequena.new
  end

  def pegar_flor_de_fogo
    FlorDeFogo.new
  end
end
