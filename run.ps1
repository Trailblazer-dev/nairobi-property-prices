# PowerShell script to run project commands

param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("extract_data", "data", "train", "predict", "clean")]
    [string]$Command
)

# Activate virtual environment if not already activated
if (-not ($env:VIRTUAL_ENV)) {
    Write-Host "Activating virtual environment..." -ForegroundColor Yellow
    .\venv\Scripts\Activate
}

# Function to run Python scripts
function Run-PythonScript {
    param (
        [string]$ScriptPath
    )
    
    Write-Host "Running: python $ScriptPath" -ForegroundColor Cyan
    python $ScriptPath
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: Script execution failed with exit code $LASTEXITCODE" -ForegroundColor Red
        exit $LASTEXITCODE
    }
}

# Execute the command
switch ($Command) {
    "extract_data" {
        Write-Host "Extracting dataset..." -ForegroundColor Green
        Run-PythonScript "src\data\download_dataset.py"
    }
    "data" {
        Write-Host "Processing dataset..." -ForegroundColor Green
        # First extract if needed
        Run-PythonScript "src\data\download_dataset.py"
        # Then process
        Run-PythonScript "src\data\make_dataset.py"
    }
    "train" {
        Write-Host "Training models..." -ForegroundColor Green
        Run-PythonScript "src\models\train_model.py"
    }
    "predict" {
        Write-Host "Running predictions..." -ForegroundColor Green
        Run-PythonScript "src\models\predict_model.py"
    }
    "clean" {
        Write-Host "Cleaning up compiled Python files..." -ForegroundColor Green
        Get-ChildItem -Path . -Include "*.pyc", "__pycache__" -Recurse | Remove-Item -Recurse -Force
    }
}

Write-Host "Command '$Command' completed successfully!" -ForegroundColor Green
