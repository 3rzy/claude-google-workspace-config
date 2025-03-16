# Integracja Claude z Gmail

Ten dokument opisuje, jak używać Claude z usługą Gmail po skonfigurowaniu integracji Google Workspace.

## Możliwości

Po poprawnej konfiguracji, Claude może:

1. **Przeglądać i wyszukiwać wiadomości**
   - Wyszukiwać według nadawcy, odbiorcy, tematu, zawartości
   - Filtrować według dat, etykiet, czy wiadomość ma załączniki

2. **Czytać i analizować treść emaili**
   - Odczytywać pełną treść wiadomości
   - Analizować zawartość emaili
   - Wyodrębniać kluczowe informacje

3. **Wysyłać wiadomości email**
   - Tworzyć nowe wiadomości
   - Odpowiadać na istniejące wiadomości
   - Dodawać załączniki

4. **Zarządzać etykietami**
   - Tworzyć nowe etykiety
   - Stosować etykiety do wiadomości
   - Usuwać etykiety z wiadomości

## Przykłady użycia

### 1. Przeglądanie wiadomości

```
Pokaż mi ostatnie 5 nieprzeczytanych wiadomości z mojej skrzynki odbiorczej.
```

```
Znajdź wszystkie emaile od [nazwa@firma.com] z ostatniego miesiąca.
```

```
Wyszukaj wiadomości zawierające słowo "spotkanie" z ostatniego tygodnia.
```

### 2. Analiza emaili

```
Podsumuj mi treść ostatniego emaila od [nazwa@firma.com].
```

```
Znajdź wszystkie daty spotkań wymienione w moich nieprzeczytanych wiadomościach.
```

```
Zbierz wszystkie linki z ostatnich 10 wiadomości.
```

### 3. Wysyłanie wiadomości

```
Napisz email do [nazwa@firma.com] z podziękowaniem za spotkanie wczoraj.
```

```
Odpowiedz na ostatnią wiadomość od [nazwa@firma.com] i poinformuj, że potrzebuję więcej czasu na analizę propozycji.
```

```
Napisz krótką wiadomość do zespołu informującą o przełożeniu spotkania na przyszły tydzień.
```

### 4. Zarządzanie etykietami

```
Utwórz nową etykietę "Projekty" dla moich wiadomości.
```

```
Oznacz ostatnią wiadomość od [nazwa@firma.com] etykietą "Do przeczytania".
```

```
Pokaż mi wszystkie wiadomości z etykietą "Ważne".
```

## Zaawansowane wyszukiwanie

Claude obsługuje zaawansowaną składnię wyszukiwania Gmail. Przykłady:

- `from:nazwa@firma.com` - wiadomości od określonego nadawcy
- `to:nazwa@firma.com` - wiadomości do określonego odbiorcy
- `subject:temat` - wiadomości z określonym tematem
- `has:attachment` - wiadomości z załącznikami
- `is:unread` - nieprzeczytane wiadomości
- `label:nazwa_etykiety` - wiadomości z określoną etykietą
- `after:2025/03/01 before:2025/03/15` - wiadomości z określonego zakresu dat

Możesz łączyć te operatory, na przykład:
```
Znajdź wszystkie nieprzeczytane wiadomości z załącznikami od nazwa@firma.com z marca 2025.
```

## Wskazówki

1. **Prywatność i bezpieczeństwo**
   - Claude ma dostęp tylko do tych wiadomości, które pokazuje podczas sesji
   - Żadne dane nie są przechowywane po zakończeniu rozmowy

2. **Wydajność**
   - Używaj precyzyjnych kryteriów wyszukiwania, aby ograniczyć liczbę wyników
   - Określaj zakresy dat, aby przyspieszyć wyszukiwanie

3. **Ograniczenia**
   - Claude nie może wykonywać ciągłego monitorowania skrzynki odbiorczej
   - Niektóre złożone formatowania w wiadomościach HTML mogą nie być w pełni widoczne
   - Bardzo duże załączniki mogą być trudne do pobrania lub analizy

## Rozwiązywanie problemów

Jeśli napotkasz problemy z integracją Gmaila:

1. Sprawdź, czy token uwierzytelniający jest aktualny
2. Upewnij się, że masz aktywowane odpowiednie zakresy API
3. Sprawdź logi w katalogu `~/Library/Logs/Claude/mcp-server-google-workspace-mcp.log`
4. Wykonaj ponowną autoryzację konta, jeśli minęło dużo czasu od ostatniego użycia
5. Użyj skryptu `validate_config.sh` z tego repozytorium

## Funkcje API wykorzystywane w tle

Claude korzysta z następujących metod Gmail API:

1. `users.messages.list` - pobieranie listy wiadomości
2. `users.messages.get` - pobieranie treści wiadomości
3. `users.messages.send` - wysyłanie wiadomości
4. `users.labels.list` - pobieranie listy etykiet
5. `users.labels.create` - tworzenie nowych etykiet
6. `users.messages.modify` - modyfikacja etykiet wiadomości

## Integracja z innymi usługami

Gmail można integrować z innymi usługami Google:

- **Google Calendar** - tworzenie wydarzeń na podstawie wiadomości email
- **Google Drive** - zapisywanie załączników bezpośrednio na Dysku Google
- **Google Sheets** - analizowanie danych z wiadomości email w arkuszach

Zobacz dokumentację integracji z tymi usługami:
- [Integracja z Google Calendar](./calendar-integration.md)
- [Integracja z Google Drive](./drive-integration.md)