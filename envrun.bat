@echo off
setlocal

if not exist .venv (
    echo Creating virtual environment...
    python -m venv .venv

    call .venv\Scripts\activate.bat

    echo Installing requirements...
    pip install -r requirements.txt
) else (
    call .venv\Scripts\activate.bat
)

echo Applying migrations...
python manage.py makemigrations
python manage.py migrate

echo Creating superuser if it does not exist...
python manage.py shell -c "from django.contrib.auth import get_user_model; User=get_user_model(); User.objects.filter(username='youruser').exists() or User.objects.create_superuser('yourpassword','test@superuser.com','youruser'); print('youruser user ready')"

echo Starting Django server...
python manage.py runserver

endlocal
