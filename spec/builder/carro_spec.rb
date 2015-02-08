describe Carro do
  context 'validações' do
    it 'nao pode ter ano de modelo menor que ano de fabricacao' do
      ano_fabricacao = Time.new('2000', '1', '1')
      ano_modelo = Time.new('1999', '1', '1')
      carro_invalido = Carro.new('modelo A', 'fabricante A', ano_fabricacao,
                                 'ABC1234', nil, nil, ano_modelo, nil, nil)
      mensagem_de_erro = 'ano do modelo nao pode ser anterior ao ano de fabricacao'
      expect(carro_invalido.validar!).to eq(false)
      expect(carro_invalido.erros.size).to eq(1)
      expect(carro_invalido.erros.first).to eq(mensagem_de_erro)
    end

    it 'deve ter uma placa especificada' do
      carro_invalido = Carro.new('modelo A', 'fabricante A', nil,
                                 nil, nil, nil, nil, nil, nil)
      mensagem_de_erro = 'placa não pode ser nulo'
      expect(carro_invalido.validar!).to eq(false)
      expect(carro_invalido.erros.size).to eq(1)
      expect(carro_invalido.erros.first).to eq(mensagem_de_erro)
    end

    it 'deve ter um modelo especificado' do
      carro_invalido = Carro.new(nil, 'fabricante A', nil,
                                 'ABC1234', nil, nil, nil, nil, nil)
      mensagem_de_erro = 'modelo não pode ser nulo'
      expect(carro_invalido.validar!).to eq(false)
      expect(carro_invalido.erros.size).to eq(1)
      expect(carro_invalido.erros.first).to eq(mensagem_de_erro)
    end

    it 'deve ter um fabricante especificado' do
      carro_invalido = Carro.new('modelo A',nil, nil,
                                 'ABC1234', nil, nil, nil, nil, nil)
      mensagem_de_erro = 'fabricante não pode ser nulo'
      expect(carro_invalido.validar!).to eq(false)
      expect(carro_invalido.erros.size).to eq(1)
      expect(carro_invalido.erros.first).to eq(mensagem_de_erro)
    end
  end
end
