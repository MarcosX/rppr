class Usuario
  attr_accessor :email, :produtos_de_interesse

  def initialize(params)
    @email = params[:email]
    @produtos_de_interesse = params[:produtos_de_interesse]
  end
end
