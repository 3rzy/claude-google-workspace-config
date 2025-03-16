# Rozwiązywanie problemów z integracją Claude i Google Workspace

Ten dokument zawiera wskazówki dotyczące rozwiązywania typowych problemów związanych z integracją Claude Desktop z usługami Google Workspace.

## Najczęstsze problemy

### 1. Nieprawidłowy format pliku accounts.json

**Objawy:**
- Komunikat błędu: "ACCOUNTS_PARSE_ERROR"
- Serwer Google Workspace MCP nie uruchamia się

**Rozwiązanie:**
- Sprawdź format pliku accounts.json. Prawidłowa struktura to:

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

- Upewnij się, że plik nie zawiera znaków BOM (Byte Order Mark)
- Zapisz plik używając kodowania UTF-8

### 2. Wygaśnięcie tokena uwierzytelniającego

**Objawy:**
- Błąd "NO_TOKEN" lub "TOKEN_EXPIRED"
- Claude prosi o ponowną autoryzację

**Rozwiązanie:**
- Przejdź przez proces autoryzacji OAuth klikając w podany link
- Skopiuj kod autoryzacyjny i wklej go do Claude

### 3. Problem z dostępem do katalogów

**Objawy:**
- Komunikat o braku dostępu do katalogów
- Błędy związane z uprawnieniami

**Rozwiązanie:**
- Upewnij się, że katalogi ~/.mcp/google-workspace-mcp/ i ~/Documents/workspace-mcp-files/ istnieją
- Sprawdź uprawnienia do tych katalogów (chmod 755)

### 4. Problem z Dockerem

**Objawy:**
- Błąd "Docker not running" lub podobny
- Serwer Google Workspace MCP nie uruchamia się

**Rozwiązanie:**
- Upewnij się, że Docker jest zainstalowany i uruchomiony
- Pobierz obraz docker: `docker pull ghcr.io/aaronsb/google-workspace-mcp:latest`

## Sprawdzanie logów

Sprawdź logi w następujących lokalizacjach:

```
~/Library/Logs/Claude/mcp-server-google-workspace-mcp.log
~/Library/Logs/Claude/mcp-server-gdrive.log
```

Możesz użyć poniższych komend, aby wyświetlić ostatnie 50 linii logów:

```bash
tail -n 50 ~/Library/Logs/Claude/mcp-server-google-workspace-mcp.log
tail -n 50 ~/Library/Logs/Claude/mcp-server-gdrive.log
```

## Resetowanie konfiguracji

Jeśli wszystkie inne metody zawiodą, możesz zresetować całą konfigurację:

1. Zatrzymaj Claude Desktop
2. Usuń katalog ~/.mcp/google-workspace-mcp/credentials/
3. Wykonaj kopię zapasową i usuń plik ~/.mcp/google-workspace-mcp/accounts.json
4. Utwórz nowy plik accounts.json z prawidłową strukturą
5. Uruchom Claude Desktop ponownie
6. Przeprowadź nową autoryzację OAuth

## Ręczne testowanie połączenia

Możesz ręcznie przetestować połączenie uruchamiając kontener Docker:

```bash
docker run --rm -i -v "/Users/YOUR_USERNAME/.mcp/google-workspace-mcp:/app/config" -v "/Users/YOUR_USERNAME/Documents/workspace-mcp-files:/app/workspace" -e "GOOGLE_CLIENT_ID=YOUR_CLIENT_ID" -e "GOOGLE_CLIENT_SECRET=YOUR_CLIENT_SECRET" -e "LOG_MODE=strict" ghcr.io/aaronsb/google-workspace-mcp:latest
```

Jeśli kontener uruchomi się poprawnie, zobaczysz komunikat "Google Workspace MCP server running on stdio".
