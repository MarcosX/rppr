describe BuscaPromocaoWorker do
  it 'deve notificar sobre produto em promocao' do
    produtos = ['Super Maria Brothers', 'USB Controller']
    usuario = Usuario.new(email: 'usuario@email.com',
                          produtos_de_interesse: produtos)

    worker = BuscaPromocaoWorker.new
    allow(worker).to receive(:produtos_promocionais).and_return(produtos)

    expect(NotificadorCliente).to receive(:produtos_em_promocao).with(produtos)
    expect(NotificadorFornecedor).to receive(:produtos_em_promocao).with(produtos)

    worker.executar(usuario)
  end

  it 'deve notificar apenas produtos de interesse do usuario' do
    produtos_do_usuario = ['Super Maria Brothers', 'USB keyboard']
    usuario = Usuario.new(email: 'usuario@email.com',
                          produtos_de_interesse: produtos_do_usuario)

    worker = BuscaPromocaoWorker.new
    produtos_promocionais = ['Super Maria Brothers', 'USB Controller']
    allow(worker).to receive(:produtos_promocionais).and_return(produtos_promocionais)

    expect(NotificadorCliente).to receive(:produtos_em_promocao).with(['Super Maria Brothers'])
    expect(NotificadorFornecedor).to receive(:produtos_em_promocao).with(['Super Maria Brothers'])
    worker.executar(usuario)
  end
end
