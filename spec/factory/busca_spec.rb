describe Busca do
  it 'utiliza FabricaDeCriterio para criar criterio de busca' do
    params = {tipo_de_busca: :por_categoria}
    expect(FabricaDeCriterio).to receive(:criar_criterio).with(params)
    Busca.por(params)
  end
end
