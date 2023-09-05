#!/bin/bash

read -p "Digite o nome de domínio: " dominio

result=$(whois $dominio)

if [[ $result == *"No match"* ]]; then
    echo "$dominio não encontrado."
else
    info=$(echo "$result" | grep -E "Admin|Email|owner|e-mail|person|Phone|Name Server|nserver|Registrant|Registrar|Creation Date|Updated Date|Expiration Date|Status")
    echo "Informações coletadas:  $dominio: $info"
fi








