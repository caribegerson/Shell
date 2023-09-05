!/bin/bash

echo "A funcionalidade principal do script é realizar consultas DNS para um domínio e permite ao usuário escolher quais tipos de registros DNS deseja consultar."

echo "§§________________________________________________§§"
echo "§§________________________________________________§§"
echo "_§§_____________________________________________§§__"
echo "___§§§_______________________________________§§§____"
echo "_____§§§§_______________§§§§§§_____________§§§§_____"
echo "______§§§§§§§_________§§§§§§§§§§________§§§§§§______"
echo "_________§§§§§§§_____§§§§§§§§§§§___§§§§§§§§§________"
echo "___________§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§___________"
echo "_______________§§§§§§§§§§§§§§§§§§§§§§§§§____________"
echo "________________§§§§§§§§§§§§§§§§§§§§§_______________"
echo "________________§§§§§§§§§§§§§§§§§§§§§_______________"
echo "________________§§§§§§§§§§§§§§§§§§§§§_______________"
echo "_______________§§§§§§§§§§§§§§§§§§§§§§§______________"
echo "_______________§§§§§§§§§§§§§§§§§§§§§§§______________"
echo "_______________§§§§§§§§§§§§§§§§§§§§§§§§_____________"
echo "______________§§§§§§§§§§§§§§§§§§§§§§§§§_____________"
echo "______________§§§§§§§§§§§§§§§§§§§§§§§§§§____________"
echo "______________§§§§__§§§§§§§§§§§§§___§§______________"
echo "____________________§§§§§§§§§§§§§___________________"
echo "____________________§§§§§§§§§§§§§___________________"
echo "____________________§§§§§§§§§§§§____________________"
echo "_____________________§§§§§§§§§§§____________________"
echo "_____________________§§§§§§§§§§§____________________"
echo "______________________§§§§§§§§§_____________________"
echo "______________________§§§§§§§§______________________"
echo "_______________________§§§§§§§______________________"
echo "_______________________§§§§§§_______________________"
echo "_______________________§§§§§§_______________________"
echo "______________________§§§§§§§§______________________"
echo "______________________§§§§§§§§______________________"
echo "_____________________§§§§§§§§§§_____________________"
echo "____________________§§§§§§§§§§§_____________________"
echo "___________________§§§§§§_§§§§§§____________________"
echo "___________________§§§§§§_§§§§§§____________________"
echo "___________________§§§§_____§§§§____________________"
echo "__________________§§§§§§___§§§§§§___________________"
# Função para exibir a ajuda
function exibir_ajuda() {
    echo "Uso: $0 [-a] [-m] [-t] [-c] [-x] [-p] [-r] [-h]"
    echo "  -a: Consultar registros A (endereço IPv4)"
    echo "  -m: Consultar registros MX (servidores de email)"
    echo "  -t: Consultar registros TXT (texto)"
    echo "  -c: Consultar registros CNAME (alias de domínio)"
    echo "  -x: Consultar registros AAAA (endereço IPv6)"
    echo "  -p: Consultar registros PTR (DNS reverso)"
    echo "  -r: Consultar registros SOA (autoridade da zona)"
    echo "  -h: Exibir esta mensagem de ajuda"
    exit 1
}

# Verifica se não foram fornecidos argumentos
if [ $# -eq 0 ]; then
    echo "É necessário fornecer pelo menos uma opção. Use -h para exibir a ajuda."
    exit 1
fi

# Inicializa variáveis
dominio=""
consultas=()

# Processa os argumentos
while getopts "amtcxprh" opcao; do
    case "${opcao}" in
        a) consultas+=("A: endereço IPv4");;
        m) consultas+=("MX: servidores de email");;
        t) consultas+=("TXT: texto");;
        c) consultas+=("CNAME: alias de domínio");;
        x) consultas+=("AAAA: endereço IPv6");;
        p) consultas+=("PTR: DNS reverso");;
        r) consultas+=("SOA: autoridade da zona");;
        h) exibir_ajuda;;
        *) echo "Opção inválida. Use -h para exibir a ajuda."; exit 1;;
    esac
done

# Remove os argumentos processados
shift $((OPTIND-1))

# Solicita o nome de domínio
read -p "Digite o nome de domínio para consulta: " dominio

# Realiza as consultas selecionadas
for consulta in "${consultas[@]}"; do
    echo "Consultando $consulta para o domínio $dominio:"
    resultado=$(dig +short $dominio $consulta)
    if [ -z "$resultado" ]; then
        echo "Nenhum resultado encontrado."
    else
        echo "$resultado"
    fi
    echo ""
done



