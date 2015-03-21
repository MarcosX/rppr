describe EmailWorker do
  it 'deve mandar um email para cada destinatario' do
    id_usuario = 1
    lista_de_destinatarios = ['email@email.com',
                              'outro_email@email.com',
                              'email_qualquer@email.com']
    assunto = 'convite enviado por Usuario 1'
    email = EmailWorker.enviar(
              usuario: id_usuario,
              destinatarios: lista_de_destinatarios,
              mensagem: :convite)
    expect(email[:para]).to eq(lista_de_destinatarios)
    expect(email[:assunto]).to eq(assunto)
    expect(email[:emails_enviados]).to eq(3)
  end

  it 'deve gerenciar erros de timeout' do
    allow(EmailWorker).to receive(:enviar_email).and_raise(Timeout::Error)
    id_usuario = 1
    lista_de_destinatarios = ['email@email.com']
    expect {
      EmailWorker.enviar(
        usuario: id_usuario,
        destinatarios: lista_de_destinatarios,
        mensagem: :convite) }.not_to raise_error
  end

  it 'deve logar erros ao enviar email' do
    allow(EmailWorker).to receive(:enviar_email).and_raise(Timeout::Error)
    id_usuario = 1
    lista_de_destinatarios = ['email@email.com']
    log_esperado = 'Timeout::Error em EmailWorker.enviar_email'
    expect(Logger).to receive(:error).with(log_esperado).at_least(1).times
    EmailWorker.enviar(
      usuario: id_usuario,
      destinatarios: lista_de_destinatarios,
      mensagem: :convite)
  end

  it 'deve enviar email mesmo apos 4 falhas' do
    expect(EmailWorker).to receive(:enviar_email).exactly(4).times.and_raise(Timeout::Error)
    expect(EmailWorker).to receive(:enviar_email).once
    id_usuario = 1
    lista_de_destinatarios = ['email@email.com']
    log_esperado = 'Timeout::Error em EmailWorker.enviar_email'
    EmailWorker.enviar(
      usuario: id_usuario,
      destinatarios: lista_de_destinatarios,
      mensagem: :convite)
  end
end
