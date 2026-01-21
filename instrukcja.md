# Instrukcja uruchomienia
## Wczytanie bazy danych
Do projektu został wykorzystany PostgreSQL. W głównym folderze jest plik baza.sql, który należy wczytać aby aplikacja mogła wczytać gotowe dane na stronę.
Po zaimportowaniu bazy należy uzupełnić w /backend/database.py plik z danymi do bazy.

```SQLALCHEMY_DATABASE_URL = "postgresql://nazwa_usera:hasło@localhost/nazwa_bazy"```

## Uruchomienie serwera
Serwer jest napisany w FastAPI. Preferowanym sposobem jest uruchomienie przy pomocy uv [https://docs.astral.sh/uv]
```
cd backend
uv add -r requirements.txt
uv run fastapi dev
```

## Uruchomienie aplikacji webowej
Frontend jest napisany w Nuxt.js/Vue. Preferowanym sposobem jest uruchomienie przy pomocy npm
```
cd frontend
npm install
npm run dev
```
