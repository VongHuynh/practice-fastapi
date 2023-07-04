# SET UP
## Prepare environment runtime configuration
- Install virtualenv
```
pip install virtualenv
```
- Create virtual environment
```bash
python -m venv venv
```
- Execute virtual
```bash
# windows
 venv/Scripts/activate.bat //In CMD
 venv/Scripts/Activate.ps1 //In Powershel
# macos
source venv/bin/activate
```
- Install libraries
```
pip install -r setup.txt
```
- First run the following command
```bash
python main.py
# uvicorn main:app --reload
```
- folowing the URL to access
```
http://localhost:8000/docs
http://localhost:8000
```

# Set up database