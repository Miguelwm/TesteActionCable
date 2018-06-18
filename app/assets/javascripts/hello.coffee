# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# FUNÇÕES
# sleep = (ms) ->
#   start = new Date().getTime()
#   continue while new Date().getTime() - start < ms
#
# $(document).ready ->
#   i=0
#   console.log "errrrrrr teste?"
#   $(".fazerzip").on "mouseup", ->
#       sleep(1000  )
#       console.log("teste "+i+" Cookie:"+Cookies.get("pid"))
#       i+=1
#       App.notificacoes = App.cable.subscriptions.create { channel: "NotificacoesChannel", room: Cookies.get("pid") },
#       connected: ->
#         console.log("connected - "+Cookies.get("pid"))
#
#       disconnected: ->
#         console.log("disconnected - "+Cookies.get("pid"))
#
#       received: (data) ->
#           alert data.content
