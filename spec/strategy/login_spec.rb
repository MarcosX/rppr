require_relative './servico_facenote_login_stub.rb'
require_relative './servico_zuiter_login_stub.rb'

describe Login do
  context 'fazendo login via FaceNote' do
    it 'retorna sucesso para o usuário Gil' do
      parametros = {
        metodo: :facenote,
        dados: {
          usuario: 'Gil'
        }
      }
      resposta = Login.com(parametros)
      expect(resposta[:status]).to be true
      expect(resposta[:mensagem]).to eq('login com sucesso')
    end

    it 'retorna acesso revocado para usuario Ana' do
      parametros = {
        metodo: :facenote,
        dados: {
          usuario: 'Ana'
        }
      }
      resposta = Login.com(parametros)
      expect(resposta[:status]).to be false
      expect(resposta[:mensagem]).to eq('acesso revocado')
    end

    it 'retorna acesso bloqueado para usuario Celso' do
      parametros = {
        metodo: :facenote,
        dados: {
          usuario: 'Celso'
        }
      }
      resposta = Login.com(parametros)
      expect(resposta[:status]).to be false
      expect(resposta[:mensagem]).to eq('aplicação bloqueada')
    end
  end

  context 'fazendo login via Zuiter' do
    it 'retorna sucesso para o usuário Gil' do
      parametros = {
        metodo: :zuiter,
        dados: {
          usuario: 'Gil'
        }
      }
      resposta = Login.com(parametros)
      expect(resposta[:status]).to be true
      expect(resposta[:mensagem]).to eq('login com sucesso')
    end

    it 'retorna autorização pendente para usuario Ana' do
      parametros = {
        metodo: :zuiter,
        dados: {
          usuario: 'Ana'
        }
      }
      resposta = Login.com(parametros)
      expect(resposta[:status]).to be false
      expect(resposta[:mensagem]).to eq('autorização pendente')
    end
  end
end
