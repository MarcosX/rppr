require_relative './servico_facenote_login_fake.rb'
require_relative './servico_zuiter_login_fake.rb'

describe Login do
  context 'fazendo login via FaceNote' do
    it 'utiliza LoginViaFaceNote para autenticar' do
      parametros =
        {
          metodo: :facenote,
          dados: {
            usuario: 'Gil'
          }
        }
      expect(LoginViaFaceNote).to receive(:autenticar)
                                    .with(parametros[:dados])
      expect(LoginViaZuiter).to receive(:autenticar).never
      Login.com(parametros)
    end
  end

  context 'fazendo login via Zuiter' do
    it 'utiliza LoginViaZuiter para autenticar' do
      parametros =
        {
          metodo: :zuiter,
          dados: {
            usuario: 'Gil'
          }
        }
      expect(LoginViaZuiter).to receive(:autenticar)
                                    .with(parametros[:dados])
      expect(LoginViaFaceNote).to receive(:autenticar).never
      Login.com(parametros)
    end
  end
end
