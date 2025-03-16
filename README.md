# Konfiguracja Claude Desktop z Google Workspace

To repozytorium zawiera pliki konfiguracyjne do połączenia Claude Desktop z usługami Google Workspace (Gmail, Google Drive, Calendar).

## Pliki konfiguracyjne

- `claude_desktop_config.json` - główna konfiguracja Claude Desktop
- `accounts.json` - konfiguracja kont Google Workspace

## Wymagane kroki konfiguracyjne

1. Zainstaluj Claude Desktop
2. Zainstaluj Docker (wymagany dla Google Workspace MCP)
3. Stwórz projekt w Google Cloud Console i aktywuj wymagane API
4. Pobierz identyfikatory OAuth (client_id i client_secret)
5. Stwórz poniższe katalogi:
   - `/Users/YOUR_USERNAME/.mcp/google-workspace-mcp/`
   - `/Users/YOUR_USERNAME/Documents/workspace-mcp-files`
6. Umieść plik `accounts.json` w katalogu `/Users/YOUR_USERNAME/.mcp/google-workspace-mcp/`
7. Umieść zaktualizowany plik `claude_desktop_config.json` w `/Users/YOUR_USERNAME/Library/Application Support/Claude/`
8. Uruchom ponownie Claude Desktop
9. Przeprowadź autoryzację OAuth gdy Claude o to poprosi

## Rozwiązywanie problemów

Sprawdź logi w katalogach:
- `~/Library/Logs/Claude/mcp-server-google-workspace-mcp.log`
- `~/Library/Logs/Claude/mcp-server-gdrive.log`

Jeśli występuje błąd "ACCOUNTS_PARSE_ERROR", sprawdź format pliku `accounts.json`.

Prawidłowa struktura pliku `accounts.json`:
```json
{
  "accounts": [
    {
      "email": "your.email@gmail.com",
      "category": "personal",
      "description": "Konto osobiste"
    }
  ]
}
```

## Uwaga

**Nigdy nie umieszczaj prawdziwych kluczy API, client_id ani client_secret w publicznych repozytoriach!**

Przed udostępnieniem konfiguracji, zastąp wszystkie poufne dane oznaczeniami (np. YOUR_CLIENT_ID).
