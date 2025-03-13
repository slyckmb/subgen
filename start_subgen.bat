@echo off
REM Activate the Anaconda environment
CALL C:\Users\braba\anaconda3\Scripts\activate.bat Python311ForPyTorch

REM Run the Python script and append output to a logfile
C:\Users\braba\anaconda3\envs\Python311ForPyTorch\python.exe C:\Users\braba\Documents\subgen\subgen.py >> C:\Users\braba\Documents\subgen\subgen.log 2>&1

REM Deactivate the Anaconda environment
CALL conda deactivate
