describe Busca do
  context 'para busca normal' do
    it 'retorna 15 resultados, por relevancia e em todas as categorias' do
      parametros = {produto: 'produto qualquer'}
      criterio = Busca.criar_criterio(parametros)
      expect(criterio.por_pagina).to eq(15)
      expect(criterio.ordenar_por).to eq(:relevancia)
      expect(criterio.categoria).to eq(:tudo)
    end

    it 'retorna resultado por página quando especificado' do
      parametros = {produto: 'produto qualquer', resultados_por_pagina: 20}
      criterio = Busca.criar_criterio(parametros)
      expect(criterio.por_pagina).to eq(20)
    end

    it 'retorna ordem quando especificada' do
      parametros = {produto: 'produto qualquer', ordenar_por: :mais_recente}
      criterio = Busca.criar_criterio(parametros)
      expect(criterio.ordenar_por).to eq(:mais_recente)
    end

    it 'retorna categoria quando especificado' do
      parametros = {produto: 'produto qualquer', categoria: 'categoria qualquer'}
      criterio = Busca.criar_criterio(parametros)
      expect(criterio.categoria).to eq('categoria qualquer')
    end
  end

  context 'para busca promocional' do
    it 'retorna 15 resultados ordenado por mais recente na categoria em promocao' do
      parametros = {produto: 'produto qualquer', tipo_de_busca: :promocional}
      criterio = Busca.criar_criterio(parametros)
      expect(criterio.por_pagina).to eq(15)
      expect(criterio.ordenar_por).to eq(:mais_recente)
      expect(criterio.categoria).to eq(:em_promocao)
    end

    it 'retorna resultado por página quando especificado' do
      parametros = {produto: 'produto qualquer', tipo_de_busca: :promocional, resultados_por_pagina: 20}
      criterio = Busca.criar_criterio(parametros)
      expect(criterio.por_pagina).to eq(20)
    end

    it 'sempre ordena por mais recente' do
      parametros = {produto: 'produto qualquer', tipo_de_busca: :promocional, ordenar_por: :relevancia}
      criterio = Busca.criar_criterio(parametros)
      expect(criterio.ordenar_por).to eq(:mais_recente)
    end

    it 'sempre utiliza categoria em promocao' do
      parametros = {produto: 'produto qualquer', tipo_de_busca: :promocional, categoria: :em_promocao}
      criterio = Busca.criar_criterio(parametros)
      expect(criterio.categoria).to eq(:em_promocao)
    end
  end

  context 'para busca por categoria' do
    it 'retorna 15 resultados ordenado por mais recente na categoria especificada' do
      parametros = {produto: 'produto qualquer', tipo_de_busca: :por_categoria, categoria: 'categoria qualquer'}
      criterio = Busca.criar_criterio(parametros)
      expect(criterio.por_pagina).to eq(15)
      expect(criterio.ordenar_por).to eq(:mais_recente)
      expect(criterio.categoria).to eq('categoria qualquer')
    end

    it 'retorna resultado por página quando especificado' do
      parametros = {produto: 'produto qualquer', tipo_de_busca: :por_categoria, categoria: 'categoria qualquer', resultados_por_pagina: 20}
      criterio = Busca.criar_criterio(parametros)
      expect(criterio.por_pagina).to eq(20)
    end

    it 'retorna ordem quando especificado' do
      parametros = {produto: 'produto qualquer', tipo_de_busca: :por_categoria, categoria: 'categoria qualquer', ordenar_por: :relevancia}
      criterio = Busca.criar_criterio(parametros)
      expect(criterio.ordenar_por).to eq(:relevancia)
    end

    it 'usa busca normal quando a categoria não é especificada' do
      parametros = {produto: 'produto qualquer', tipo_de_busca: :por_categoria}
      criterio = Busca.criar_criterio(parametros)
      expect(criterio.ordenar_por).to eq(:relevancia)
      expect(criterio.categoria).to eq(:tudo)
    end
  end
end
