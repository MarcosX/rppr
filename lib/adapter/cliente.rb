require 'json'

class Cliente
  attr_reader :id_universal

  def initialize(id_universal)
    @id_universal = id_universal
  end

  def preferencias
    email_xml = obter_preferencias_de_email || ''
    email = Validar.email(email_xml.split(', '))

    endereco_xml = obter_preferencias_de_endereco || ''
    endereco = Validar.endereco(endereco_xml)

    pagamento_xml = obter_preferencias_de_pagamento || ''
    pagamento = Validar.pagamento(pagamento_xml)

    telefone_xml = obter_preferencias_de_telefone || ''
    telefone = Validar.telefone(telefone_xml.split(', '))

    preferencias = mapear_para_hash(email, endereco, pagamento, telefone)
    preferencias.to_json

    preferencias = mapear_para_hash(email, endereco, pagamento, telefone)
    preferencias.to_json
  end

  def mapear_para_hash(email, endereco, pagamento, telefone)
    {
      email: email,
      endereco: endereco,
      pagamento: pagamento,
      telefone: telefone
    }
  end

  def obter_preferencias_de_email
    #chamada soap para obter preferencias de email
  end

  def obter_preferencias_de_endereco
    #chamada soap para obter preferencias de endereco
  end

  def obter_preferencias_de_pagamento
    #chamada soap para obter preferencias de pagamaneto
  end

  def obter_preferencias_de_telefone
    #chamada soap para obter preferencias de telefone
  end
end
