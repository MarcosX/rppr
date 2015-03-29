describe NotificadorMediator do
  it 'deve notificar Cliente e Fornecedor sobre produtos promocionais' do
    produtos = ['Super Maria Brothers', 'USB Controller']
    expect(NotificadorCliente).to receive(:produtos_em_promocao).with(produtos)
    expect(NotificadorFornecedor).to receive(:produtos_em_promocao).with(produtos)
    NotificadorMediator.produtos_em_promocao(produtos)
  end
end
