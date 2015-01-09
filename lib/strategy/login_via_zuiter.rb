class LoginViaZuiter
  ZUITER_SUCESSO = 202
  ZUITER_PENDENTE = 400

  def self.autenticar(parametros)
    parametros[:usuario].downcase!
    resposta = ServicoZuiterLogin.autenticar(parametros)
    status, mensagem = false, 'não foi possível autenticar'

    if resposta == ZUITER_SUCESSO
      status, mensagem = true, 'login com sucesso'
    elsif resposta == ZUITER_PENDENTE
      status, mensagem = false, 'autorização pendente'
    end

    {status: status, mensagem: mensagem}
  end
end
