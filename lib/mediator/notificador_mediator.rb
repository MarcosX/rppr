class NotificadorMediator
  def self.produtos_em_promocao(produtos)
    NotificadorCliente.produtos_em_promocao(produtos)
    NotificadorFornecedor.produtos_em_promocao(produtos)
  end
end
