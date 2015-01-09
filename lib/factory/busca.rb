class Busca
  def self.por(parametros)
    criterio = criar_criterio(parametros)
    ids_de_resultado = ServicoDeBusca.realizar_busca_com(criterio)
    encontrar_produtos_por_ids(ids_de_resultado)
  end

  def self.criar_criterio(parametros)
    criterio = CriterioDeBusca.new
    criterio.por_pagina = parametros[:resultados_por_pagina] || 15
    criterio.categoria = parametros[:categoria] || :tudo

    if parametros[:tipo_de_busca] == :promocional
      criterio.categoria = :em_promocao
      criterio.ordenar_por = :mais_recente
    elsif parametros[:tipo_de_busca] == :por_categoria
      if parametros[:categoria]
        criterio.ordenar_por = parametros[:ordenar_por] || :mais_recente
      else # volta para busca normal
        criterio.ordenar_por = parametros[:ordenar_por] || :relevancia
      end
    else # busca normal
      criterio.ordenar_por = parametros[:ordenar_por] || :relevancia
    end

    criterio
  end

  def self.encontrar_produtos_por_ids(ids)
  end
end
