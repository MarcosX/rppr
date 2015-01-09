class ServicoFaceNoteLogin
  def self.autenticar(dados)
    return 200 if dados[:usuario] == 'Gil'
    return 403 if dados[:usuario] == 'Ana'
    return 408 if dados[:usuario] == 'Celso'
    404
  end
end
