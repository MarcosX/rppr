require_relative './servico_zuiter_login_fake.rb'

describe LoginViaZuiter do
  it 'retorna sucesso para o usuário Gil' do
    parametros = {
      usuario: 'Gil'
    }
    resposta = LoginViaZuiter.autenticar(parametros)
    expect(resposta[:status]).to be true
    expect(resposta[:mensagem]).to eq('login com sucesso')
  end

  it 'retorna autorização pendente para usuario Ana' do
    parametros = {
      usuario: 'Ana'
    }
    resposta = LoginViaZuiter.autenticar(parametros)
    expect(resposta[:status]).to be false
    expect(resposta[:mensagem]).to eq('autorização pendente')
  end
end
