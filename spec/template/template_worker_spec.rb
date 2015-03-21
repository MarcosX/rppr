describe TemplateWorker do
  it 'deve executar os métodos especificados e logar erros' do
    e = StandardError.new
    mensagem_de_erro = "StandardError ao executar TemplateWorker"

    expect(Logger).to receive(:error).with(mensagem_de_erro)
    expect(TemplateWorker).to receive(:antes_execuacao).with({})
    expect(TemplateWorker).to receive(:trabalhar).with({}).and_raise(e)
    expect(TemplateWorker).to receive(:deve_tentar_novamente).with(e, {})
    expect(TemplateWorker).to receive(:final_execucao).with({})

    TemplateWorker.executar({})
  end
end
