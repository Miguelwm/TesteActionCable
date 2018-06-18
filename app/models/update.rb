class Update < ApplicationRecord

  def self.update
    ActionCable.server.broadcast 'notificacoes_channel',
                           content:"O seu ficheiro está pronto",
                           username:"xx"

  end
end
