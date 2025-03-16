# Integracja Claude z Google Calendar

Ten dokument opisuje, jak używać Claude z usługą Google Calendar po skonfigurowaniu integracji Google Workspace.

## Możliwości

Po poprawnej konfiguracji, Claude może:

1. **Przeglądać wydarzenia kalendarzowe**
   - Wyświetlać nadchodzące wydarzenia
   - Przeglądać szczegóły konkretnych wydarzeń
   - Filtrować wydarzenia według dat, uczestników, tytułów

2. **Zarządzać wydarzeniami**
   - Tworzyć nowe wydarzenia
   - Modyfikować istniejące wydarzenia
   - Usuwać wydarzenia

3. **Zarządzać odpowiedziami na zaproszenia**
   - Akceptować zaproszenia
   - Odrzucać zaproszenia
   - Proponować alternatywne terminy

4. **Analizować i planować harmonogram**
   - Szukać wolnych terminów w kalendarzu
   - Podsumowywać nadchodzące spotkania
   - Pomagać w planowaniu czasu

## Przykłady użycia

### 1. Przeglądanie wydarzeń

```
Pokaż mi wydarzenia w moim kalendarzu na najbliższy tydzień.
```

```
Jakie mam spotkania zaplanowane na jutro?
```

```
Znajdź wszystkie wydarzenia z [nazwa@firma.com] z tego miesiąca.
```

### 2. Zarządzanie wydarzeniami

```
Utwórz nowe spotkanie z zespołem na jutro o 14:00, trwające 1 godzinę.
```

```
Przesuń moje spotkanie "Przegląd projektu" z czwartku na piątek o tej samej godzinie.
```

```
Dodaj [nazwa@firma.com] jako uczestnika do spotkania "Planowanie kwartalne" w przyszłym tygodniu.
```

### 3. Odpowiedzi na zaproszenia

```
Zaakceptuj zaproszenie na spotkanie "Burzę mózgów" od [nazwa@firma.com].
```

```
Odrzuć zaproszenie na jutrzejsze spotkanie "Demonstracja produktu".
```

```
Zaproponuj inny termin dla spotkania "Spotkanie zespołu" - przesuń je na wtorek rano.
```

### 4. Analiza i planowanie

```
Znajdź najlepszy termin na 2-godzinne spotkanie w przyszłym tygodniu.
```

```
Przygotuj podsumowanie moich spotkań na ten tydzień, z listą uczestników i głównych tematów.
```

```
Jak wygląda mój rozkład spotkań w poniedziałek? Czy mam jakieś dłuższe przerwy?
```

## Typy wydarzeń

Claude rozumie różne typy wydarzeń w kalendarzu:

1. **Spotkania jednorazowe** - standardowe wydarzenia o określonej dacie i godzinie
2. **Wydarzenia cykliczne** - powtarzające się regularnie (codziennie, co tydzień, co miesiąc)
3. **Wydarzenia całodniowe** - trwające cały dzień, bez określonych godzin
4. **Wydarzenia z uczestnikami** - spotkania z zaproszonymi osobami
5. **Spotkania online** - wydarzenia z linkami do wideokonferencji

## Formaty daty i czasu

Podczas pracy z Google Calendar, Claude rozumie różne formaty dat:

- Bezpośrednie odniesienia: "dzisiaj", "jutro", "w przyszłym tygodniu"
- Dni tygodnia: "poniedziałek", "wtorek", "w następny piątek"
- Konkretne daty: "15 kwietnia", "2025-04-20"
- Zakresy dat: "od poniedziałku do piątku", "w przyszłym tygodniu"
- Godziny: "14:00", "2 po południu", "rano"

## Wskazówki

1. **Specyfikacja czasu**
   - Zawsze określaj godzinę dla wydarzeń, które nie są całodniowe
   - Podawaj strefę czasową, jeśli jest inna niż domyślna

2. **Powtarzające się wydarzenia**
   - Określ wzorzec powtarzania (np. "co tydzień", "co drugi wtorek")
   - Podaj datę końcową lub liczbę powtórzeń

3. **Uczestnicy**
   - Podawaj pełne adresy email uczestników
   - Określ, czy są obowiązkowi czy opcjonalni

4. **Prywatność**
   - Claude ma dostęp tylko do wydarzeń, o które konkretnie zapytasz
   - Dane nie są przechowywane po zakończeniu rozmowy

## Integracja z innymi usługami

Integracja z Kalendarzem Google można łączyć z innymi usługami:

1. **Gmail**
   - Tworzenie wydarzeń na podstawie wiadomości email
   - Wysyłanie zaproszeń i aktualizacji wydarzeń

2. **Google Drive**
   - Dołączanie dokumentów z Drive do wydarzeń kalendarzowych
   - Przygotowywanie notatek ze spotkań i zapisywanie ich na Drive

3. **Spotkania online**
   - Dodawanie linków do wideokonferencji (Google Meet, Zoom)
   - Automatyczne dołączanie informacji o połączeniu

## Rozwiązywanie problemów

Jeśli napotkasz problemy z integracją Kalendarza Google:

1. Sprawdź, czy token uwierzytelniający jest aktualny
2. Upewnij się, że masz aktywowane odpowiednie zakresy API dla Kalendarza Google
3. Sprawdź logi w katalogu `~/Library/Logs/Claude/mcp-server-google-workspace-mcp.log`
4. Wykonaj ponowną autoryzację konta, jeśli token wygasł
5. Użyj skryptu `validate_config.sh` z tego repozytorium

## Funkcje API wykorzystywane w tle

Claude korzysta z następujących metod Google Calendar API:

1. `calendars.events.list` - pobieranie listy wydarzeń
2. `calendars.events.get` - pobieranie szczegółów wydarzenia
3. `calendars.events.insert` - tworzenie nowego wydarzenia
4. `calendars.events.update` - aktualizacja istniejącego wydarzenia
5. `calendars.events.delete` - usuwanie wydarzenia
6. `calendars.events.instances` - pobieranie wystąpień wydarzenia cyklicznego

## Przykładowy przepływ pracy

Oto przykładowy przepływ pracy z wykorzystaniem integracji kalendarza:

1. Poproś Claude o sprawdzenie Twojego harmonogramu na najbliższy tydzień
2. Poproś o znalezienie wolnego okna na 1-godzinne spotkanie z zespołem
3. Utwórz nowe wydarzenie w znalezionym terminie
4. Dodaj uczestników i szczegóły spotkania
5. Wyślij zaproszenia do wszystkich uczestników

Ta integracja pozwala na efektywne zarządzanie harmonogramem i spotkaniami bez konieczności ręcznego przełączania się między aplikacjami.

Zobacz również:
- [Integracja z Gmail](./gmail-integration.md)
- [Integracja z Google Drive](./drive-integration.md)