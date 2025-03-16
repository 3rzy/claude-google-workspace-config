# Struktura katalogów dla integracji Claude z Google Workspace

Poniżej przedstawiona jest wymagana struktura katalogów dla poprawnego działania integracji Claude Desktop z usługami Google Workspace.

## Główne katalogi konfiguracyjne

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

## Opis katalogów

- `/Users/YOUR_USERNAME/.mcp/google-workspace-mcp/` - Katalog konfiguracyjny dla Google Workspace MCP
  - `accounts.json` - Plik z konfiguracją kont Google
  - `client_secret.json` - Plik z kluczami OAuth (opcjonalnie)
  - `credentials/` - Katalog z tokenami uwierzytelniającymi (tworzony automatycznie)

- `/Users/YOUR_USERNAME/.mcp/gdrive-creds/` - Katalog kredencjałów dla Google Drive

- `/Users/YOUR_USERNAME/Documents/workspace-mcp-files/` - Katalog roboczy dla plików

- `/Users/YOUR_USERNAME/Library/Application Support/Claude/` - Katalog konfiguracyjny Claude Desktop
  - `claude_desktop_config.json` - Główny plik konfiguracyjny Claude Desktop

- `/Users/YOUR_USERNAME/Library/Logs/Claude/` - Katalog z plikami logów
  - `mcp-server-google-workspace-mcp.log` - Logi serwera Google Workspace MCP
  - `mcp-server-gdrive.log` - Logi serwera Google Drive
  - `mcp.log` - Ogólne logi MCP

## Tworzenie katalogów

Aby utworzyć wymagane katalogi, możesz użyć poniższych komend w terminalu:

```bash
mkdir -p ~/.mcp/google-workspace-mcp
mkdir -p ~/.mcp/gdrive-creds
mkdir -p ~/Documents/workspace-mcp-files
```

Katalogi w `Library/` są tworzone automatycznie podczas instalacji Claude Desktop.
