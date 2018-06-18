console.log("teste "+i+" Cookie:"+Cookies.get("pid"))
i+=1
App.notificacoes = App.cable.subscriptions.create { channel: "NotificacoesChannel", room: Cookies.get("pid") },
  connected: ->
    console.log("connected - "+Cookies.get("pid"))

  disconnected: ->
    console.log("disconnected - "+Cookies.get("pid"))

  received: (data) ->
    alert data.content
