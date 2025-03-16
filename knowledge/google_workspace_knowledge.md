# Wiedza o integracji Claude Desktop z Google Workspace

Ten dokument zawiera kompleksową wiedzę na temat konfiguracji i użytkowania integracji Claude z usługami Google Workspace.

## Konfiguracja

### Pliki konfiguracyjne

- Główny plik konfiguracyjny Claude znajduje się w `/Users/YOUR_USERNAME/Library/Application Support/Claude/claude_desktop_config.json`
- Plik `accounts.json` musi znajdować się w katalogu `/Users/YOUR_USERNAME/.mcp/google-workspace-mcp/`
- Prawidłowa struktura pliku `accounts.json`:
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

### Identyfikatory klienta i sekrety

- Dla Google Workspace MCP należy używać dedykowanego identyfikatora klienta i sekretu
- Dla Google Drive należy używać dedykowanego identyfikatora klienta i sekretu
- Identyfikatory te muszą być utworzone w projekcie Google Cloud Console z włączonymi odpowiednimi API

### Struktura katalogów

- **Katalog konfiguracyjny** dla Google Workspace MCP: `/Users/YOUR_USERNAME/.mcp/google-workspace-mcp/`
- **Katalog roboczy** dla Google Workspace MCP: `/Users/YOUR_USERNAME/Documents/workspace-mcp-files`
- **Katalog kredencjałów** dla Google Drive: `/Users/YOUR_USERNAME/.mcp/gdrive-creds`
- **Katalog logów**: `/Users/YOUR_USERNAME/Library/Logs/Claude/`

### Docker

- Google Workspace MCP używa obrazu Docker: `ghcr.io/aaronsb/google-workspace-mcp:latest`
- Obraz ten musi być dostępny lokalnie lub pobrany podczas pierwszego uruchomienia
- Docker musi być uruchomiony przed korzystaniem z funkcji Google Workspace

### Uwierzytelnianie

- Tokeny uwierzytelniające mogą wygasać i wymagać ponownej autoryzacji
- Po wygaśnięciu tokena konieczne jest przeprowadzenie procesu uwierzytelniania OAuth
- Proces uwierzytelniania wymaga kliknięcia w link autoryzacyjny i wprowadzenia kodu do Claude
- Tokens są przechowywane w katalogu `~/.mcp/google-workspace-mcp/credentials/`

## Funkcjonalność

### Gmail

- **Przeglądanie i wyszukiwanie** wiadomości email według różnych kryteriów
- **Wysyłanie wiadomości** email do pojedynczych i wielu odbiorców
- **Dostęp do załączników** i możliwość ich pobierania
- **Zarządzanie etykietami** i folderami

### Google Drive

- **Przeglądanie i wyszukiwanie** plików według nazwy, typu, zawartości
- **Pobieranie zawartości** plików różnych formatów
- **Przesyłanie nowych** plików na Drive
- **Zarządzanie uprawnieniami** dostępu do plików

### Google Calendar

- **Przeglądanie wydarzeń** w kalendarzu
- **Tworzenie nowych** wydarzeń z określeniem czasu, miejsca i uczestników
- **Modyfikowanie istniejących** wydarzeń
- **Usuwanie wydarzeń** z kalendarza
- **Zarządzanie odpowiedziami** na zaproszenia

## Rozwiązywanie problemów

### Logi

- Logi dla Google Workspace MCP znajdują się w `~/Library/Logs/Claude/mcp-server-google-workspace-mcp.log`
- Logi dla Google Drive znajdują się w `~/Library/Logs/Claude/mcp-server-gdrive.log`
- Logi ogólne MCP znajdują się w `~/Library/Logs/Claude/mcp.log`

### Najczęstsze problemy

#### Błąd "ACCOUNTS_PARSE_ERROR"

Ten błąd występuje, gdy serwer nie może odczytać pliku `accounts.json`. Rozwiązania:

1. Sprawdź czy plik istnieje w odpowiednim katalogu
2. Sprawdź poprawność formatu JSON
3. Upewnij się, że plik ma strukturę z tablicą `accounts`
4. Usuń ewentualne znaki BOM z początku pliku
5. Ustaw odpowiednie uprawnienia (chmod 600)

#### Token wygasł

Jeśli token uwierzytelniający wygasł, Claude poprosi o ponowną autoryzację. Należy:

1. Kliknąć w podany link autoryzacyjny
2. Zalogować się na konto Google
3. Udzielić wymaganych uprawnień
4. Skopiować kod autoryzacyjny do Claude

#### Problemy z Dockerem

Jeśli występują problemy z usługami wymagającymi Dockera:

1. Sprawdź czy Docker jest zainstalowany: `docker --version`
2. Sprawdź czy Docker jest uruchomiony: `docker info`
3. Pobierz wymagany obraz ręcznie: `docker pull ghcr.io/aaronsb/google-workspace-mcp:latest`
4. Sprawdź logi Dockera: `docker logs <container_id>`

#### Problemy z katalogami

Jeśli Claude nie może uzyskać dostępu do wymaganych katalogów:

1. Upewnij się, że wymagane katalogi istnieją: `mkdir -p ~/.mcp/google-workspace-mcp ~/Documents/workspace-mcp-files`
2. Sprawdź uprawnienia: `ls -la ~/.mcp/`
3. Ustaw odpowiednie uprawnienia: `chmod 700 ~/.mcp/google-workspace-mcp`

## Przewodnik po API

Claude korzysta z następujących API Google:

### Gmail API

- `users.messages.list` - pobieranie listy wiadomości
- `users.messages.get` - pobieranie treści wiadomości
- `users.messages.send` - wysyłanie wiadomości
- `users.labels.list` - pobieranie listy etykiet
- `users.labels.create` - tworzenie nowych etykiet
- `users.messages.modify` - modyfikacja etykiet wiadomości

### Google Drive API

- `files.list` - pobieranie listy plików
- `files.get` - pobieranie metadanych pliku
- `files.create` - tworzenie nowego pliku
- `files.update` - aktualizacja istniejącego pliku
- `files.delete` - usuwanie pliku
- `permissions.create` - zarządzanie uprawnieniami pliku

### Google Calendar API

- `calendars.events.list` - pobieranie listy wydarzeń
- `calendars.events.get` - pobieranie szczegółów wydarzenia
- `calendars.events.insert` - tworzenie nowego wydarzenia
- `calendars.events.update` - aktualizacja istniejącego wydarzenia
- `calendars.events.delete` - usuwanie wydarzenia

## Automatyzacja i skrypty

Dla usprawnienia zarządzania konfiguracją dostępne są następujące skrypty:

- `restore_config.sh` - przywraca konfigurację Claude
- `backup_config.sh` - tworzy kopię zapasową aktualnej konfiguracji
- `validate_config.sh` - sprawdza poprawność konfiguracji

Te skrypty znajdują się w katalogu `/scripts` w tym repozytorium.