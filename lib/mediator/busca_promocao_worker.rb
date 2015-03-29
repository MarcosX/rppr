class BuscaPromocaoWorker
  def executar(usuario)
    produtos_de_interesse =
      produtos_promocionais & usuario.produtos_de_interesse
    NotificadorCliente.produtos_em_promocao(produtos_de_interesse)
    NotificadorFornecedor.produtos_em_promocao(produtos_de_interesse)
    atualizar_notificao_do_usuario
  end

  private
  def produtos_promocionais; [] end

  def atualizar_notificao_do_usuario; end
end
