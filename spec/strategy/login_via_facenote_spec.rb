require_relative './servico_facenote_login_fake.rb'

describe LoginViaFaceNote do
  it 'retorna sucesso para o usuário Gil' do
    parametros = {
      usuario: 'Gil'
    }
    resposta = LoginViaFaceNote.autenticar(parametros)
    expect(resposta[:status]).to be true
    expect(resposta[:mensagem]).to eq('login com sucesso')
  end

  it 'retorna acesso revocado para usuario Ana' do
    parametros = {
      usuario: 'Ana'
    }
    resposta = LoginViaFaceNote.autenticar(parametros)
    expect(resposta[:status]).to be false
    expect(resposta[:mensagem]).to eq('acesso revocado')
  end

  it 'retorna acesso bloqueado para usuario Celso' do
    parametros = {
      usuario: 'Celso'
    }
    resposta = LoginViaFaceNote.autenticar(parametros)
    expect(resposta[:status]).to be false
    expect(resposta[:mensagem]).to eq('aplicação bloqueada')
  end
end
