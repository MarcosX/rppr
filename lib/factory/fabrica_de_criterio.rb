class FabricaDeCriterio
  def self.criar_promocional(parametros)
    criterio = CriterioDeBusca.new
    criterio.por_pagina = parametros[:resultados_por_pagina] || 15
    criterio.categoria = :em_promocao
    criterio.ordenar_por = :mais_recente
    criterio
  end

  def self.criar_por_categoria(parametros)
    return criar_busca_normal(parametros) if parametros[:categoria].nil?
    criterio = CriterioDeBusca.new
    criterio.por_pagina = parametros[:resultados_por_pagina] || 15
    criterio.categoria = parametros[:categoria]
    criterio.ordenar_por = parametros[:ordenar_por] || :mais_recente
    criterio
  end

  def self.criar_busca_normal(parametros)
    criterio = CriterioDeBusca.new
    criterio.por_pagina = parametros[:resultados_por_pagina] || 15
    criterio.categoria = parametros[:categoria] || :tudo
    criterio.ordenar_por = parametros[:ordenar_por] || :relevancia
    criterio
  end
end
