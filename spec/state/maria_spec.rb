describe Maria do
  context 'quando o estado atual é pequena' do
    it 'pega flor de gelo e muda o estado para flor de gelo' do
      maria = Maria.new
      maria.pegar_flor_de_gelo
      expect(maria.estado_atual).to eq(Maria::FLOR_DE_GELO)
    end

    it 'pega estrela e muda o estado para estrela' do
      maria = Maria.new
      maria.pegar_estrela
      expect(maria.estado_atual).to eq(Maria::ESTRELA)
    end

    it 'leva dano e morre' do
      maria = Maria.new
      maria.levar_dano
      expect(maria.estado_atual).to eq(Maria::MORTA)
    end
  end

  context 'quando o estado atual é flor de gelo' do
    it 'pega flor de gelo e continua no estado flor de gelo' do
      maria = Maria.new
      maria.pegar_flor_de_gelo
      maria.pegar_flor_de_gelo
      expect(maria.estado_atual).to eq(Maria::FLOR_DE_GELO)
    end

    it 'pega estrela e muda o estado para estrela' do
      maria = Maria.new
      maria.pegar_flor_de_gelo
      maria.pegar_estrela
      expect(maria.estado_atual).to eq(Maria::ESTRELA)
    end

    it 'leva dano e fica pequena' do
      maria = Maria.new
      maria.pegar_flor_de_gelo
      maria.levar_dano
      expect(maria.estado_atual).to eq(Maria::PEQUENA)
    end
  end

  context 'quando o estado atual é estrela' do
    it 'pega flor de gelo e continua no estado estrela' do
      maria = Maria.new
      maria.pegar_estrela
      maria.pegar_flor_de_gelo
      expect(maria.estado_atual).to eq(Maria::ESTRELA)
    end

    it 'pega estrela e continua no estado estrela' do
      maria = Maria.new
      maria.pegar_estrela
      maria.pegar_estrela
      expect(maria.estado_atual).to eq(Maria::ESTRELA)
    end

    it 'leva dano e continua no estado estrela' do
      maria = Maria.new
      maria.pegar_estrela
      maria.levar_dano
      expect(maria.estado_atual).to eq(Maria::ESTRELA)
    end
  end
end
