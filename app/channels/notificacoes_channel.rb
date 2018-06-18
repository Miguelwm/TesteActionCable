class NotificacoesChannel < ApplicationCable::Channel
  def subscribed
    puts "*********************************************************"
    puts params[:room]
    puts "*********************************************************"
    stream_from "notificacoes_channel_#{params[:room]}"

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
