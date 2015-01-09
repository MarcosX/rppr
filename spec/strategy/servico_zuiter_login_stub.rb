class ServicoZuiterLogin
  def self.autenticar(dados)
    return 202 if dados[:usuario] == 'gil'
    return 400 if dados[:usuario] == 'ana'
    404
  end
end
