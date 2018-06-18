class HardWorker
  include Sidekiq::Worker

  def perform(id_ficheiro,cookie_utilizador)
      @ficheiro = Ficheiro.find(id_ficheiro)


      nome = @ficheiro.path.split("/").last.split(".").first
      system "cd public/uploads/ficheiros/"
      cmd = "cd public/uploads/ficheiros/ && tar -zcvf " + nome +".tar.gz "+ nome+"/"

      puts "################################################################################"
      puts "############ DEBUG ############"
      puts cmd
      system "pwd"

      puts "################################################################################"
      system cmd
      puts "done!"
      sleep 2
      @ficheiro.zip=2
      @ficheiro.zip_path="/uploads/ficheiros/"+nome+".tar.gz"
      @ficheiro.save
      ActionCable.server.broadcast 'notificacoes_channel_'+cookie_utilizador,
                             content:"O seu ficheiro está pronto",
                             link:@ficheiro.zip_path,
                             id:@ficheiro.id
      puts "Enviado: "+ 'notificacoes_channel_' + cookie_utilizador

      update = Update.new
      update.cookie = cookie_utilizador
      update.texto = "O seu ficheiro está pronto"
      update.ficheiro_id = @ficheiro.id
      update.save
      puts "Update criado"
  end

end
