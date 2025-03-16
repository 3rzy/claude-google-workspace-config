# Konfiguracja Claude Desktop z Google Workspace

To repozytorium zawiera pliki konfiguracyjne, skrypty automatyzacji i szczegółową dokumentację do połączenia Claude Desktop z usługami Google Workspace (Gmail, Google Drive, Calendar).

## Zawartość repozytorium

- `/configs` - pliki konfiguracyjne
- `/docs` - szczegółowa dokumentacja w formacie Markdown
- `/scripts` - skrypty do automatyzacji konfiguracji
- `/knowledge` - baza wiedzy w formie CSV i Markdown

## Szybki start

Aby skonfigurować Claude Desktop z Google Workspace:

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

4. Po zakończeniu konfiguracji uruchom ponownie Claude Desktop.

## Szczegółowa dokumentacja

- [Rozpoczęcie pracy](docs/getting-started.md) - przewodnik konfiguracji krok po kroku
- [Integracja z Gmail](docs/gmail-integration.md) - jak korzystać z emaili w Claude
- [Integracja z Google Drive](docs/drive-integration.md) - jak pracować z plikami w Claude
- [Integracja z Google Calendar](docs/calendar-integration.md) - jak zarządzać kalendarzem w Claude
- [Rozwiązywanie problemów](rozwiazywanie_problemow.md) - najczęstsze problemy i ich rozwiązania

## Struktura katalogów

Wymagana struktura katalogów dla Claude Desktop z Google Workspace:

```
/Users/YOUR_USERNAME/
├── .mcp/
│   ├── google-workspace-mcp/
│   │   ├── accounts.json
│   │   ├── client_secret.json (opcjonalnie)
│   │   └── credentials/ (tworzony automatycznie)
│   └── gdrive-creds/ (dla Google Drive)
├── Documents/
│   └── workspace-mcp-files/ (katalog roboczy dla plików)
└── Library/
    ├── Application Support/
    │   └── Claude/
    │       └── claude_desktop_config.json
    └── Logs/
        └── Claude/
            ├── mcp-server-google-workspace-mcp.log
            ├── mcp-server-gdrive.log
            └── mcp.log
```

Szczegółowy opis struktury katalogów znajduje się w [struktura_katalogow.md](struktura_katalogow.md).

## Skrypty automatyzacji

Repozytorium zawiera następujące skrypty automatyzujące zarządzanie konfiguracją:

- `scripts/restore_config.sh` - przywraca konfigurację Claude
- `scripts/backup_config.sh` - tworzy kopię zapasową aktualnej konfiguracji
- `scripts/validate_config.sh` - sprawdza poprawność konfiguracji

## Wymagania

- Claude Desktop
- Docker
- Node.js i NPM
- Konto Google z włączonymi API (Gmail, Drive, Calendar)
- Utworzony projekt w Google Cloud Console z identyfikatorami OAuth

## Rozwiązywanie problemów

W przypadku problemów:

1. Uruchom skrypt walidacyjny: `./scripts/validate_config.sh`
2. Sprawdź logi w katalogu `~/Library/Logs/Claude/`
3. Zapoznaj się z [poradnikiem rozwiązywania problemów](rozwiazywanie_problemow.md)

## Bezpieczeństwo

**UWAGA**: Nigdy nie umieszczaj rzeczywistych kluczy API, client_id ani client_secret w publicznych repozytoriach!

Pliki konfiguracyjne w tym repozytorium używają placeholderów zamiast rzeczywistych kluczy. Podczas konfiguracji skrypt poprosi o podanie rzeczywistych wartości.

## Licencja

Ten projekt jest udostępniany na licencji MIT. Szczegóły znajdują się w pliku [LICENSE](LICENSE).

## Podziękowania

- Zespół Anthropic za Claude AI
- Zespół Google za Google Workspace API
- Autorzy serwera Google Workspace MCP
