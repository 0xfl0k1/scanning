param($ip)

if(!$ip){
    echo "PortScan-PowerShell"
    echo "Modo de uso: .\portscan.ps1 192.168.0.1"
} else {
    $topports = 21,22,3306,80,443

    foreach ($porta in $topports){
        try {
            if (Test-NetConnection $ip -Port $porta -WarningAction SilentlyContinue -InformationLevel Quiet) {
                echo "Porta $porta aberta"
            } else {
                echo "Porta $porta fechada"
            }
        } catch {}
    }
}
