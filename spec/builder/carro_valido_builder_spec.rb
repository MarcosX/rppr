describe CarroValidoBuilder do
  context 'com valores padrão' do
    it 'deve criar um carro válido' do
      builder = CarroValidoBuilder.new
      carro = builder.construir_carro
      expect(carro.validar!).to eq(true)
    end
  end

  context 'com valores extras' do
    it 'deve configurar um carro com uma cor e quilometragem' do
      builder = CarroValidoBuilder.new.com_cor('azul').com_quilometragem(100)
      carro = builder.construir_carro
      expect(carro.cor).to eq('azul')
      expect(carro.km_rodados).to eq(100)
    end

    it 'deve configurar um carro com preco mínimo e anunciado' do
      builder = CarroValidoBuilder.new.com_preco_minimo(20_000).com_preco_anunciado(22_000)
      carro = builder.construir_carro
      expect(carro.preco_minimo).to eq(20_000)
      expect(carro.preco_anunciado).to eq(22_000)
    end

    it 'deve configurar um carro com ano de modelo e de fabricacao' do
      builder = CarroValidoBuilder.new.com_ano_modelo(2015).com_ano_fabricacao(2014)
      carro = builder.construir_carro
      expect(carro.ano_modelo).to eq(2015)
      expect(carro.ano_fabricacao).to eq(2014)
    end

    it 'deve criar um carro com fabricante, modelo e placa' do
      builder = CarroValidoBuilder.new
                  .com_fabricante('Fabricante DCBA')
                  .com_modelo('Modelo B321')
                  .com_placa('CBA4321')
      carro = builder.construir_carro
      expect(carro.fabricante).to eq('Fabricante DCBA')
      expect(carro.modelo).to eq('Modelo B321')
      expect(carro.placa).to eq('CBA4321')
    end
  end
end
