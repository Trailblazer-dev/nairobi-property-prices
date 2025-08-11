# Setup script for Nairobi Property Prices project

# Create a virtual environment
Write-Host "Creating virtual environment..." -ForegroundColor Green
python -m venv venv

# Activate the virtual environment
Write-Host "Activating virtual environment..." -ForegroundColor Green
.\venv\Scripts\Activate

# Install required packages
Write-Host "Installing required packages..." -ForegroundColor Green
python -m pip install --upgrade pip
python -m pip install -r requirements.txt

# Check for dataset
Write-Host "Checking for dataset..." -ForegroundColor Green
$datasetPath = ".\data\nairobi_property_prices.zip"
if (Test-Path $datasetPath) {
    Write-Host "Dataset found at $datasetPath" -ForegroundColor Green
    
    # Extract dataset
    Write-Host "Extracting dataset..." -ForegroundColor Green
    python src/data/download_dataset.py
} else {
    Write-Host "Dataset not found at $datasetPath" -ForegroundColor Yellow
    Write-Host "Please place your downloaded dataset zip file in the 'data' directory with the name 'nairobi_property_prices.zip'" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Setup completed!" -ForegroundColor Green
Write-Host "You can now run the following commands using the run.ps1 script:" -ForegroundColor Yellow
Write-Host "- .\run.ps1 extract_data  # Extract the dataset" -ForegroundColor Yellow
Write-Host "- .\run.ps1 data          # Process the dataset" -ForegroundColor Yellow
Write-Host "- .\run.ps1 train         # Train the models" -ForegroundColor Yellow
Write-Host "- .\run.ps1 predict       # Run predictions" -ForegroundColor Yellow
    } | ConvertTo-Json
    
    $credentials | Out-File -FilePath $kaggleJsonPath -Encoding utf8
    
    # Set appropriate permissions
    icacls $kaggleJsonPath /inheritance:r /grant:r "$($env:USERNAME):(R,W)" | Out-Null
    
    Write-Host "Saved Kaggle credentials to $kaggleJsonPath" -ForegroundColor Green
} else {
    Write-Host "Kaggle credentials file already exists at $kaggleJsonPath" -ForegroundColor Green
}

# Download dataset
Write-Host "Downloading dataset..." -ForegroundColor Green
python src/data/download_dataset.py

Write-Host ""
Write-Host "Setup completed!" -ForegroundColor Green
Write-Host "You can now run the following commands using the run.ps1 script:" -ForegroundColor Yellow
Write-Host "- .\run.ps1 download_data  # Download the dataset" -ForegroundColor Yellow
Write-Host "- .\run.ps1 data           # Process the dataset" -ForegroundColor Yellow
Write-Host "- .\run.ps1 train          # Train the models" -ForegroundColor Yellow
Write-Host "- .\run.ps1 predict        # Run predictions" -ForegroundColor Yellow
