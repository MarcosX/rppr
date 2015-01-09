class Login
  def self.com(parametros)
    if parametros[:metodo] == :facenote
      LoginViaFaceNote.autenticar(parametros[:dados])
    elsif parametros[:metodo] == :zuiter
      LoginViaZuiter.autenticar(parametros[:dados])
    end
  end
end
