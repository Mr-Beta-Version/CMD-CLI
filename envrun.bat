@echo off

if not exist venv (
    echo Creating virtual environment...
    python -m venv venv

    call venv\Scripts\activate.bat

    echo Installing requirements...
    pip install -r requirements.txt
) else (
    call venv\Scripts\activate.bat
)

echo Applying migrations...
python manage.py migrate

echo Starting Django server...
python manage.py runserver
