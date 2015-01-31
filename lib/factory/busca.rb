class Busca
  def self.por(parametros)
    criterio = criar_criterio(parametros)
    ids_de_resultado = ServicoDeBusca.realizar_busca_com(criterio)
    encontrar_produtos_por_ids(ids_de_resultado)
  end

  def self.criar_criterio(parametros)
    if parametros[:tipo_de_busca] == :promocional
      FabricaDeCriterio.criar_promocional(parametros)
    elsif parametros[:tipo_de_busca] == :por_categoria
      FabricaDeCriterio.criar_por_categoria(parametros)
    else
      FabricaDeCriterio.criar_por_categoria(parametros)
    end
  end

  def self.encontrar_produtos_por_ids(ids)
  end
end
