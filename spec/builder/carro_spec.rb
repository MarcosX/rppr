describe Carro do
  context 'validações' do
    it 'nao pode ter ano de modelo menor que ano de fabricacao' do
      ano_fabricacao = 2000
      ano_modelo = 1999
      carro_invalido = Carro.new('modelo A', 'fabricante A', ano_fabricacao,
                                 'ABC1234', nil, nil, ano_modelo, nil, nil)
      erro = 'ano do modelo nao pode ser anterior ao ano de fabricacao'
      expect(carro_invalido.validar!).to eq(false)
      expect(carro_invalido.erros.size).to eq(1)
      expect(carro_invalido.erros.first).to eq(erro)
    end

    it 'deve ter uma placa especificada' do
      carro_invalido = Carro.new('modelo A', 'fabricante A', nil,
                                 nil, nil, nil, nil, nil, nil)
      erro = 'placa não pode ser nulo'
      expect(carro_invalido.validar!).to eq(false)
      expect(carro_invalido.erros.size).to eq(1)
      expect(carro_invalido.erros.first).to eq(erro)
    end

    it 'deve ter um modelo especificado' do
      carro_invalido = Carro.new(nil, 'fabricante A', nil,
                                 'ABC1234', nil, nil, nil, nil, nil)
      erro = 'modelo não pode ser nulo'
      expect(carro_invalido.validar!).to eq(false)
      expect(carro_invalido.erros.size).to eq(1)
      expect(carro_invalido.erros.first).to eq(erro)
    end

    it 'deve ter um fabricante especificado' do
      carro_invalido = Carro.new('modelo A',nil, nil,
                                 'ABC1234', nil, nil, nil, nil, nil)
      erro = 'fabricante não pode ser nulo'
      expect(carro_invalido.validar!).to eq(false)
      expect(carro_invalido.erros.size).to eq(1)
      expect(carro_invalido.erros.first).to eq(erro)
    end
  end
end
