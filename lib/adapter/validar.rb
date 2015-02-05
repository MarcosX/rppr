class Validar
  # a validação é irrelevante para o exemplo
  # portanto vamos apenas retornar os próprios parametro
  class << self
    def email(email_xml)
      email_xml
    end

    def endereco(endereco_xml)
      endereco_xml
    end

    def pagamento(pagamento_xml)
      pagamento_xml
    end

    def telefone(telefone_xml)
      telefone_xml
    end
  end
end
