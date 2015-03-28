describe EmailWorker do
  it 'deve mandar um email para cada destinatario' do
    id_usuario = 1
    lista_de_destinatarios = ['email@email.com',
                              'outro_email@email.com',
                              'email_qualquer@email.com']
    assunto = 'convite enviado por Usuario 1'
    email = EmailWorker.new.executar(
              usuario: id_usuario,
              destinatarios: lista_de_destinatarios,
              mensagem: :convite)
    expect(email[:para]).to eq(lista_de_destinatarios)
    expect(email[:assunto]).to eq(assunto)
    expect(email[:emails_enviados]).to eq(3)
  end

  it 'deve gerenciar erros de timeout' do
    worker = EmailWorker.new
    allow(worker).to receive(:enviar_email).and_raise(Timeout::Error)
    allow(worker).to receive(:deve_tentar_novamente).and_return(false)
    id_usuario = 1
    lista_de_destinatarios = ['email@email.com']
    expect {
      worker.executar(
        usuario: id_usuario,
        destinatarios: lista_de_destinatarios,
        mensagem: :convite) }.not_to raise_error
  end

  it 'deve logar erros ao enviar email' do
    worker = EmailWorker.new
    allow(worker).to receive(:enviar_email).and_raise(Timeout::Error)
    allow(worker).to receive(:deve_tentar_novamente).and_return(false)
    id_usuario = 1
    lista_de_destinatarios = ['email@email.com']
    log_esperado = 'Timeout::Error ao executar EmailWorker'
    expect(Logger).to receive(:error).with(log_esperado).at_least(1).times
    worker.executar(
      usuario: id_usuario,
      destinatarios: lista_de_destinatarios,
      mensagem: :convite)
  end

  it 'deve enviar email mesmo apos 4 falhas' do
    worker = EmailWorker.new
    expect(worker).to receive(:enviar_email).exactly(4).times.and_raise(Timeout::Error)
    expect(worker).to receive(:enviar_email).once
    id_usuario = 1
    lista_de_destinatarios = ['email@email.com']
    log_esperado = 'Timeout::Error em EmailWorker.enviar_email'
    worker.executar(
      usuario: id_usuario,
      destinatarios: lista_de_destinatarios,
      mensagem: :convite)
  end
end
