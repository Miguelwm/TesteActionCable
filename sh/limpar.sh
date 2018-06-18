#!/bin/bash
# Limpar os dados
SRC=/home/wiremaze/Documents/Rails/Teste/
echo "Apagar ficheiros desnecessários"
cd $SRC && rm -r public/uploads/ficheiros/*
echo "Apagar ficheiros desnecessários[COMPLETED]"
echo "Reconstruir Base de dados"
cd $SRC && rake db_m:rebuild
echo "Reconstruir Base de dados[COMPLETED]"
echo "Feito :)"
echo "Começar Servidor Rails"
cd $SRC && rails s
