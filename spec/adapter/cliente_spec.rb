require 'json'

describe Cliente do
  context 'preferencias' do
    context 'de email' do
      it 'retorna a lista de emails do cliente' do
        id_universal = 'FG1234'
        cliente = Cliente.new(id_universal)
        emails = 'cliente@cliente.com, cliente@email.com'
        allow(cliente).to receive(:obter_preferencias_de_email) { emails }
        preferencias = JSON.parse(cliente.preferencias)
        emails = preferencias["email"]
        expect(emails.size).to eq(2)
        expect(emails[0]).to eq('cliente@cliente.com')
        expect(emails[1]).to eq('cliente@email.com')
      end

      it 'retorna uma string vazia caso nao existam emails' do
        id_universal = 'FG1234'
        cliente = Cliente.new(id_universal)
        allow(cliente).to receive(:obter_preferencias_de_email)
        preferencias = JSON.parse(cliente.preferencias)
        emails = preferencias["email"]
        expect(emails.size).to eq(0)
      end

      it 'valida o email' do
        id_universal = 'FG1234'
        cliente = Cliente.new(id_universal)
        emails = 'cliente@cliente.com'
        allow(cliente).to receive(:obter_preferencias_de_email) { emails }
        expect(Validar).to receive(:email).with(['cliente@cliente.com'])
        cliente.preferencias
      end
    end

    context 'de endereço' do
      it 'retorna endereço do cliente' do
        id_universal = 'FG1234'
        cliente = Cliente.new(id_universal)
        endereco = 'rua a casa 0'
        allow(cliente).to receive(:obter_preferencias_de_endereco) { endereco }
        preferencias = JSON.parse(cliente.preferencias)
        expect(preferencias['endereco']).to eq('rua a casa 0')
      end

      it 'retorna uma string vazia caso nao existam endereços' do
        id_universal = 'FG1234'
        cliente = Cliente.new(id_universal)
        allow(cliente).to receive(:obter_preferencias_de_endereco)
        preferencias = JSON.parse(cliente.preferencias)
        expect(preferencias['endereco']).to eq('')
      end

      it 'valida o endereço' do
        id_universal = 'FG1234'
        cliente = Cliente.new(id_universal)
        endereco = 'rua a casa 0'
        allow(cliente).to receive(:obter_preferencias_de_endereco) { endereco }
        expect(Validar).to receive(:endereco).with('rua a casa 0')
        cliente.preferencias
      end
    end

    context 'de pagamento' do
      it 'retorna endereço do cliente' do
        id_universal = 'FG1234'
        cliente = Cliente.new(id_universal)
        pagamento = '1234 5678 8765 4321'
        allow(cliente).to receive(:obter_preferencias_de_pagamento) { pagamento }
        preferencias = JSON.parse(cliente.preferencias)
        expect(preferencias['pagamento']).to eq('1234 5678 8765 4321')
      end

      it 'retorna uma string vazia caso nao existam formas de pagamento' do
        id_universal = 'FG1234'
        cliente = Cliente.new(id_universal)
        allow(cliente).to receive(:obter_preferencias_de_pagamento)
        preferencias = JSON.parse(cliente.preferencias)
        expect(preferencias['pagamento']).to eq('')
      end

      it 'valida o pagamento' do
        id_universal = 'FG1234'
        cliente = Cliente.new(id_universal)
        pagamento = '1234 5678 8765 4321'
        allow(cliente).to receive(:obter_preferencias_de_pagamento) { pagamento }
        expect(Validar).to receive(:pagamento).with('1234 5678 8765 4321')
        cliente.preferencias
      end
    end

    context 'de telefone' do
      it 'retorna telefones do cliente' do
        id_universal = 'FG1234'
        cliente = Cliente.new(id_universal)
        telefone = '+0123456789, +1234567890'
        allow(cliente).to receive(:obter_preferencias_de_telefone) { telefone }
        preferencias = JSON.parse(cliente.preferencias)
        telefone = preferencias["telefone"]
        expect(telefone.size).to eq(2)
        expect(telefone[0]).to eq('+0123456789')
        expect(telefone[1]).to eq('+1234567890')
      end

      it 'retorna uma string vazia caso nao existam telefones' do
        id_universal = 'FG1234'
        cliente = Cliente.new(id_universal)
        allow(cliente).to receive(:obter_preferencias_de_telefone)
        preferencias = JSON.parse(cliente.preferencias)
        telefone = preferencias["telefone"]
        expect(telefone.size).to eq(0)
      end

      it 'valida o telefone' do
        id_universal = 'FG1234'
        cliente = Cliente.new(id_universal)
        telefone = '+1234567890'
        allow(cliente).to receive(:obter_preferencias_de_telefone) { telefone }
        expect(Validar).to receive(:telefone).with(['+1234567890'])
        cliente.preferencias
      end
    end
  end
end
