# Bilingual Content Resolution and Hymn Lyric Presentation

The application provides first-class support for English (`en`) and Nepali (`ne`), matching the backend's bilingual document models (`title_en`/`title_ne`, `lyrics_en`/`lyrics_ne`, `NPR` currency).

## Considered Options

- **Single language hard switch**: Rejected: congregants frequently need to see original language or romanized versions during bilingual church services.

## Consequences

- An app-wide locale switcher manages UI localization (`.arb`) and filters backend content to the active language, falling back to English if Nepali content is absent.
- Hymn reader includes an inline dual-view toggle, allowing congregants to view Nepali and English lyrics side-by-side or stacked.
