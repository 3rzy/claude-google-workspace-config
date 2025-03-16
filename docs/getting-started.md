# Rozpoczęcie pracy z Claude i Google Workspace

Ten przewodnik pomoże Ci skonfigurować Claude Desktop do współpracy z usługami Google Workspace, takimi jak Gmail, Google Drive i Google Calendar.

## Wymagania wstępne

Przed rozpoczęciem upewnij się, że masz:

1. Zainstalowany Claude Desktop
2. Zainstalowany Docker
3. Zainstalowany Node.js i NPM
4. Konto Google z dostępem do Gmail, Google Drive i/lub Calendar
5. Utworzony projekt w Google Cloud Console z aktywowanymi odpowiednimi API

## Krok 1: Przygotowanie projektu Google Cloud

1. Przejdź do [Google Cloud Console](https://console.cloud.google.com/)
2. Utwórz nowy projekt lub wybierz istniejący
3. Włącz następujące API:
   - Gmail API
   - Google Drive API
   - Google Calendar API
4. Utwórz identyfikatory OAuth:
   - Typ aplikacji: Aplikacja desktopowa
   - Zapisz plik JSON z identyfikatorem klienta i kluczem tajnym

## Krok 2: Konfiguracja Claude Desktop

Istnieją dwa sposoby konfiguracji Claude Desktop do pracy z Google Workspace:

### Opcja A: Automatyczna konfiguracja przy użyciu skryptu (zalecana)

1. Sklonuj to repozytorium:
   ```bash
   git clone https://github.com/3rzy/claude-google-workspace-config.git
   cd claude-google-workspace-config
   ```

2. Uruchom skrypt konfiguracyjny:
   ```bash
   chmod +x scripts/restore_config.sh
   ./scripts/restore_config.sh your.email@gmail.com
   ```

3. Postępuj zgodnie z instrukcjami wyświetlanymi przez skrypt.

### Opcja B: Ręczna konfiguracja

1. Utwórz wymagane katalogi:
   ```bash
   mkdir -p ~/.mcp/google-workspace-mcp
   mkdir -p ~/.mcp/gdrive-creds
   mkdir -p ~/Documents/workspace-mcp-files
   ```

2. Utwórz plik `~/.mcp/google-workspace-mcp/accounts.json`:
   ```json
   {"accounts":[{"email":"your.email@gmail.com","category":"personal","description":"Konto osobiste"}]}
   ```

3. Skopiuj plik `configs/claude_desktop_config.json` do `~/Library/Application Support/Claude/`:
   ```bash
   cp configs/claude_desktop_config.json ~/Library/Application\ Support/Claude/
   ```

4. Edytuj plik konfiguracyjny Claude Desktop, zastępując:
   - `YOUR_USERNAME` swoją nazwą użytkownika
   - `YOUR_GOOGLE_DRIVE_CLIENT_ID` i `YOUR_GOOGLE_DRIVE_CLIENT_SECRET` swoimi danymi Google Drive
   - `YOUR_GOOGLE_WORKSPACE_CLIENT_ID` i `YOUR_GOOGLE_WORKSPACE_CLIENT_SECRET` swoimi danymi Google Workspace

## Krok 3: Autoryzacja i weryfikacja

1. Uruchom ponownie Claude Desktop
2. Claude poprosi o autoryzację dostępu do Twojego konta Google:
   - Kliknij w link autoryzacyjny
   - Zaloguj się na swoje konto Google
   - Udziel wymaganych uprawnień
   - Skopiuj kod autoryzacyjny do Claude

3. Sprawdź, czy połączenie działa:
   - Poproś Claude o wyświetlenie listy plików z Google Drive
   - Poproś Claude o sprawdzenie wiadomości email
   - Poproś Claude o wyświetlenie wydarzeń z kalendarza

## Rozwiązywanie problemów

Jeśli napotkasz problemy, skorzystaj z naszych narzędzi:

1. Skrypt walidacyjny: `./scripts/validate_config.sh` - sprawdza poprawność konfiguracji
2. Logi Claude: sprawdź pliki w katalogu `~/Library/Logs/Claude/`
3. Przeczytaj [przewodnik rozwiązywania problemów](../rozwiazywanie_problemow.md)

## Co dalej?

Po pomyślnej konfiguracji możesz:

- [Zarządzać swoimi emailami](./gmail-integration.md) za pomocą Claude
- [Pracować z plikami na Google Drive](./drive-integration.md)
- [Zarządzać kalendarzem](./calendar-integration.md)
