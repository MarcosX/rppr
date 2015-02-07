context 'preferencias' do
  context 'de email' do
    it 'retorna a lista de emails do cliente' do
      id_universal = 'FG1234'
      adaptador = AdaptadorSoap.new(id_universal)
      cliente = Cliente.new(id_universal, adaptador)
      preferencias = {
        email: ['cliente@cliente.com'],
        endereco: 'rua 0 casa 1',
        pagamento: '1234 5678 8765 4321',
        telefone: ['+0123456789']
      }
      allow(adaptador).to receive(:preferencias) { preferencias }
      preferencias = JSON.parse(cliente.preferencias)
      expect(preferencias["email"][0]).to eq('cliente@cliente.com')
      expect(preferencias["endereco"]).to eq('rua 0 casa 1')
      expect(preferencias["pagamento"]).to eq('1234 5678 8765 4321')
      expect(preferencias["telefone"][0]).to eq('+0123456789')
    end
  end
end
