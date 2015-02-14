describe Carro do
  context 'validações' do
    it 'nao pode ter ano de modelo menor que ano de fabricacao' do
      ano_fabricacao = 2000
      ano_modelo = 1999
      builder = CarroValidoBuilder.new
                  .com_ano_fabricacao(ano_fabricacao)
                  .com_ano_modelo(ano_modelo)
      carro_invalido = builder.construir_carro
      mensagem_de_erro = 'ano do modelo nao pode ser anterior ao ano de fabricacao'
      expect(carro_invalido.validar!).to eq(false)
      expect(carro_invalido.erros.size).to eq(1)
      expect(carro_invalido.erros.first).to eq(mensagem_de_erro)
    end

    it 'deve ter uma placa especificada' do
      builder = CarroValidoBuilder.new.com_placa(nil)
      carro_invalido = builder.construir_carro
      mensagem_de_erro = 'placa não pode ser nulo'
      expect(carro_invalido.validar!).to eq(false)
      expect(carro_invalido.erros.size).to eq(1)
      expect(carro_invalido.erros.first).to eq(mensagem_de_erro)
    end

    it 'deve ter um modelo especificado' do
      builder = CarroValidoBuilder.new.com_modelo(nil)
      carro_invalido = builder.construir_carro
      mensagem_de_erro = 'modelo não pode ser nulo'
      expect(carro_invalido.validar!).to eq(false)
      expect(carro_invalido.erros.size).to eq(1)
      expect(carro_invalido.erros.first).to eq(mensagem_de_erro)
    end

    it 'deve ter um fabricante especificado' do
      builder = CarroValidoBuilder.new.com_fabricante(nil)
      carro_invalido = builder.construir_carro
      mensagem_de_erro = 'fabricante não pode ser nulo'
      expect(carro_invalido.validar!).to eq(false)
      expect(carro_invalido.erros.size).to eq(1)
      expect(carro_invalido.erros.first).to eq(mensagem_de_erro)
    end
  end
end
