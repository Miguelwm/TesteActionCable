class TesteWorker
  include Sidekiq::Worker

  def perform(teste)
    ActionCable.server.broadcast 'notificacoes_channel_'+teste,
                           content:"Teste realizado",
                           cookie:"xx"
  end
end
