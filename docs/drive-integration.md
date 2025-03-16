# Integracja Claude z Google Drive

Ten dokument opisuje, jak korzystać z funkcji Google Drive w Claude po skonfigurowaniu integracji.

## Możliwości

Po poprawnym skonfigurowaniu, Claude może:

1. **Przeglądać i wyszukiwać pliki**
   - Wyświetlać listę plików na Google Drive
   - Filtrować pliki według nazwy, typu, daty modyfikacji
   - Wyszukiwać pliki według zawartości

2. **Odczytywać i analizować zawartość plików**
   - Odczytywać dokumenty tekstowe
   - Analizować pliki CSV i arkusze kalkulacyjne
   - Interpretować zawartość plików

3. **Tworzyć i modyfikować pliki**
   - Tworzyć nowe pliki
   - Aktualizować istniejące pliki
   - Zapisywać wyniki pracy z Claude na Drive

4. **Zarządzać uprawnieniami**
   - Sprawdzać uprawnienia do plików
   - Udostępniać pliki innym osobom
   - Modyfikować ustawienia dostępu

## Przykłady użycia

### 1. Przeglądanie plików

```
Pokaż mi listę moich najnowszych 10 plików na Google Drive.
```

```
Znajdź wszystkie pliki Excel, które zostały zmodyfikowane w zeszłym tygodniu.
```

```
Wyszukaj pliki zawierające frazę "raport kwartalny".
```

### 2. Praca z zawartością plików

```
Odczytaj zawartość pliku "Notatki ze spotkania.docx" i podsumuj główne punkty.
```

```
Przeanalizuj dane z pliku CSV "Sprzedaż_2025.csv" i powiedz mi, który produkt sprzedaje się najlepiej.
```

```
Wyodrębnij wszystkie daty z dokumentu "Harmonogram projektu.docx".
```

### 3. Tworzenie i modyfikacja plików

```
Utwórz nowy dokument tekstowy o nazwie "Raport miesięczny" z podsumowaniem naszej dzisiejszej rozmowy.
```

```
Zaktualizuj plik "Lista zadań.txt" dodając nowe zadanie: "Przygotować prezentację na środę".
```

```
Stwórz arkusz kalkulacyjny z analizą danych, które właśnie omówiliśmy.
```

### 4. Zarządzanie uprawnieniami

```
Sprawdź, kto ma dostęp do pliku "Budżet zespołu.xlsx".
```

```
Udostępnij dokument "Propozycja projektu.docx" dla jan.kowalski@firma.com z uprawnieniami do edycji.
```

```
Zmień uprawnienia dla pliku "Poufne dane.pdf" tak, aby tylko ja miał do niego dostęp.
```

## Obsługiwane formaty plików

Claude może pracować z różnymi formatami plików:

1. **Dokumenty tekstowe**
   - TXT - dokumenty tekstowe
   - DOCX - dokumenty Microsoft Word
   - PDF - dokumenty PDF (tylko tekst)
   - Google Docs - natywne dokumenty Google

2. **Arkusze kalkulacyjne**
   - CSV - pliki z wartościami oddzielonymi przecinkami
   - XLSX - arkusze Microsoft Excel
   - Google Sheets - natywne arkusze Google

3. **Inne formaty**
   - JSON - struktury danych JSON
   - Markdown - pliki w formacie Markdown
   - Proste pliki HTML

## Wskazówki

1. **Wydajność**
   - Określaj precyzyjne kryteria wyszukiwania, aby ograniczyć liczbę wyników
   - Używaj identyfikatorów plików zamiast nazw, jeśli znasz dokładny plik

2. **Ograniczenia**
   - Claude nie może przetwarzać plików binarnych (obrazy, pliki wykonywalne)
   - Istnieją limity rozmiaru plików, które można odczytać (zwykle do 100MB)
   - Złożone formatowanie może być utracone przy odczycie niektórych typów plików

3. **Bezpieczeństwo**
   - Claude ma dostęp tylko do plików, które są jawnie udostępniane podczas sesji
   - Nie ma stałego dostępu do całego Drive'a
   - Dane nie są przechowywane po zakończeniu rozmowy

## Rozwiązywanie problemów

W przypadku problemów z dostępem do Google Drive:

1. Sprawdź, czy token uwierzytelniający jest aktualny
2. Upewnij się, że masz aktywowane API Google Drive
3. Sprawdź logi w katalogu `~/Library/Logs/Claude/mcp-server-gdrive.log`
4. Wykonaj ponowną autoryzację konta, jeśli token wygasł
5. Użyj skryptu `validate_config.sh` z tego repozytorium

## Integracja z innymi narzędziami

Funkcjonalność Google Drive można połączyć z innymi narzędziami:

1. **Analiza danych**
   - Claude może analizować dane z arkuszy kalkulacyjnych na Drive
   - Możesz łączyć dane z wielu plików

2. **Automatyzacja dokumentów**
   - Automatyczne tworzenie raportów na podstawie danych
   - Aktualizacja dokumentów na podstawie rozmowy

3. **Integracja z Gmail**
   - Załączniki z Gmail można zapisywać bezpośrednio na Drive
   - Można udostępniać linki do dokumentów w wiadomościach email

Zobacz również:
- [Integracja z Gmail](./gmail-integration.md)
- [Integracja z Google Calendar](./calendar-integration.md)

## Przykładowy przepływ pracy

Oto przykładowy przepływ pracy z wykorzystaniem Google Drive:

1. Poproś Claude o znalezienie ostatnich raportów sprzedaży na Drive
2. Przeanalizuj dane z tych raportów, prosząc o wyodrębnienie kluczowych trendów
3. Stwórz nowy dokument z podsumowaniem analizy
4. Udostępnij nowy dokument zespołowi za pomocą ich adresów email

Ta integracja pozwala na płynne korzystanie z danych i dokumentów przechowywanych na Google Drive, bez konieczności ręcznego wyszukiwania i przesyłania plików.