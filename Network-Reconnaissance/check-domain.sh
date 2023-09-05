1 #!/bin/bash
 2
 3 echo "O script verifica a disponibilidade de um nome de domínio. Se o whois não encontrar informações sobre o domínio, ele é considerado disponível para registro."
 4
 5 read -p "Digite o nome de domínio: " dominio
 6
 7 if whois $dominio &> /dev/null; then
 8     echo "$dominio está registrado."
 9 else
10     echo "$dominio está disponível para registro."
11 fi
12
