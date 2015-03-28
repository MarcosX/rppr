describe TemplateWorker do
  it 'deve executar os métodos especificados e logar erros' do
    e = StandardError.new
    mensagem_de_erro = "StandardError ao executar TemplateWorker"
    worker = TemplateWorker.new

    expect(Logger).to receive(:error).with(mensagem_de_erro)
    expect(worker).to receive(:trabalhar).with({}).and_raise(e)
    expect(worker).to receive(:deve_tentar_novamente).with(e, {})

    worker.executar({})
  end
end
