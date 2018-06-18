$(document).on 'turbolinks:load',
  if Cookies.get("pid")
    # alert(Cookies.get("pid"))
      App.notificacoes = App.cable.subscriptions.create { channel: "NotificacoesChannel", room: Cookies.get("pid") },
      connected: ->
        $.ajax "/update/pending/"+Cookies.get("pid"),
		      type: 'get'
		      dataType: 'json'
		      error: (jqXHR, textStatus, errorThrown) ->
            console.log("erro")
		      success: (data, textStatus, jqXHR) ->
            if data.status is "sucess"
              console.log("Sucesso "+data.status)
              $.ajax({url: "/update/"+Cookies.get("pid")})
              fAlerta(data.response.text,data.response.link)
            else if data.status is "fail"
              console.log("sem novidades")
        console.log("connected - "+Cookies.get("pid"))

      disconnected: ->
        console.log("disconnected - "+Cookies.get("pid"))

      received: (data) ->
          $.ajax({url: "/update/"+Cookies.get("pid")})
          fAlerta(data.content,data.link)
          x = '<a download="'+data.link+'" href="'+data.link+'">Download zip</a><br><br>'
          $("#ficheiro"+data.id).find("span").remove()
          $("#ficheiro"+data.id).append(x)
