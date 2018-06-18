class HelloController < ApplicationController


# Zip 0 = nenhum zip
# Zip 1 = zip a ser feito
# Zip 2 = zip feito

  def index
    # HardWorker.perform_async("cmd")
    @teste="um bom teste"
    @ficheiros=Ficheiro.all
  end

  def teste
    # ActionCable.server.broadcast 'notificacoes_channel',
    #                        content:"O seu ficheiro está pronto",
    #                        username:"xx"
    user = UserP.find_by(cookie:"88e9b949aa42736cc53f833f0341460a")
    Update.update
  end

  def btnteste
    TesteWorker.perform_async(cookies[:pid])
  end

  def upload_file
    @ficheiro = Ficheiro.new
    @ficheiro.path = DataFile.save_file(params[:upload])
    @ficheiro.save
    redirect_to root_path

  end

  def zip
    @random = SecureRandom.hex
    cookies[:pid] = { value: @random, expires: 2.hour }
    @ficheiro = Ficheiro.find(params[:id])
    @ficheiro.zip=1
    @ficheiro.save

    HardWorker.perform_async(params[:id],@random)

    respond_to do |format|
      format.json
      format.html {redirect_to root_path}
    end
  end

  def pending

    @update = Update.find_by(cookie:params[:id])
    if(!@update.nil?)
      @ficheiro = Ficheiro.find(@update.ficheiro_id)
      @texto = @update.texto
      @estado= "sucess"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json
      end
    else
      @estado= "fail"
      @texto= "nothing pending"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json
      end
    end


  end

  def update

    @update = Update.find_by(cookie:params[:id])
    if (!@update.nil?)
      @update.destroy
    end


    # Método Antigo
    # @update = Update.find_by(cookie:params[:id])
    # if (!@update.nil?)
    #   @texto = @update.texto.split("/").first
    #   if(@update.contador<2)
    #     @update.contador=@update.contador+1
    #     @update.save
    #   else
    #     cookies.delete :pid
    #     @update.destroy
    #   end
    #   @estado = "sucess!"
    #   respond_to do |format|
    #     format.html { redirect_to root_path }
    #     format.json
    #   end
    # else
    #   @estado = "fail"
    #   @texto = "nenhum update"
    #   respond_to do |format|
    #     format.html { redirect_to root_path }
    #     format.json
    #   end
    # end
  end



end
