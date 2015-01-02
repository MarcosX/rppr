describe Maria do
  context 'quando o estado atual é pequena' do
    it 'pega flor de fogo e muda o estado para flor de fogo' do
      maria = Maria.new
      maria.pegar_flor_de_fogo
      expect(maria.estado_atual).to be_kind_of(FlorDeFogo)
    end

    it 'pega flor de gelo e muda o estado para flor de gelo' do
      maria = Maria.new
      maria.pegar_flor_de_gelo
      expect(maria.estado_atual).to be_kind_of(FlorDeGelo)
    end

    it 'pega estrela e muda o estado para estrela' do
      maria = Maria.new
      maria.pegar_estrela
      expect(maria.estado_atual).to be_kind_of(Estrela)
    end

    it 'leva dano e morre' do
      maria = Maria.new
      maria.levar_dano
      expect(maria.estado_atual).to be_kind_of(Morta)
    end
  end

  context 'quando o estado atual é flor de gelo' do
    it 'pega flor de fogo e muda o estado para flor de fogo' do
      maria = Maria.new
      maria.pegar_flor_de_gelo
      maria.pegar_flor_de_fogo
      expect(maria.estado_atual).to be_kind_of(FlorDeFogo)
    end

    it 'pega flor de gelo e continua no estado flor de gelo' do
      maria = Maria.new
      maria.pegar_flor_de_gelo
      maria.pegar_flor_de_gelo
      expect(maria.estado_atual).to be_kind_of(FlorDeGelo)
    end

    it 'pega estrela e muda o estado para estrela' do
      maria = Maria.new
      maria.pegar_flor_de_gelo
      maria.pegar_estrela
      expect(maria.estado_atual).to be_kind_of(Estrela)
    end

    it 'leva dano e fica pequena' do
      maria = Maria.new
      maria.pegar_flor_de_gelo
      maria.levar_dano
      expect(maria.estado_atual).to be_kind_of(Pequena)
    end
  end

  context 'quando o estado atual é estrela' do
    it 'pega flor de fogo e continua no estado estrela' do
      maria = Maria.new
      maria.pegar_estrela
      maria.pegar_flor_de_fogo
      expect(maria.estado_atual).to be_kind_of(Estrela)
    end

    it 'pega flor de gelo e continua no estado estrela' do
      maria = Maria.new
      maria.pegar_estrela
      maria.pegar_flor_de_gelo
      expect(maria.estado_atual).to be_kind_of(Estrela)
    end

    it 'pega estrela e continua no estado estrela' do
      maria = Maria.new
      maria.pegar_estrela
      maria.pegar_estrela
      expect(maria.estado_atual).to be_kind_of(Estrela)
    end

    it 'leva dano e continua no estado estrela' do
      maria = Maria.new
      maria.pegar_estrela
      maria.levar_dano
      expect(maria.estado_atual).to be_kind_of(Estrela)
    end
  end

  context 'quando o estado atual é flor de fogo' do
    it 'pega flor de fogo e continua no estado flor de fogo' do
      maria = Maria.new
      maria.pegar_flor_de_fogo
      maria.pegar_flor_de_fogo
      expect(maria.estado_atual).to be_kind_of(FlorDeFogo)
    end

    it 'pega flor de gelo e muda o estado para flor de gelo' do
      maria = Maria.new
      maria.pegar_flor_de_fogo
      maria.pegar_flor_de_gelo
      expect(maria.estado_atual).to be_kind_of(FlorDeGelo)
    end

    it 'pega estrela e muda o estado para estrela' do
      maria = Maria.new
      maria.pegar_flor_de_fogo
      maria.pegar_estrela
      expect(maria.estado_atual).to be_kind_of(Estrela)
    end

    it 'leva dano e fica pequena' do
      maria = Maria.new
      maria.pegar_flor_de_fogo
      maria.levar_dano
      expect(maria.estado_atual).to be_kind_of(Pequena)
    end
  end
end
