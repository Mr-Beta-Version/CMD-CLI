@echo off

if not exist venv (
    python -m venv venv
)

call venv\Scripts\activate.bat

echo VENV=%VIRTUAL_ENV%
