require 'json'

class Cliente
  attr_reader :id_universal, :adaptador

  def initialize(id_universal, adaptador)
    @id_universal = id_universal
    @adaptador = adaptador
  end

  def preferencias
    preferencias = @adaptador.preferencias
    preferencias.to_json
  end
end
