"""
This script extracts the locally downloaded Nairobi property prices dataset.
"""
import os
import logging
import zipfile
from pathlib import Path

# Set up logger
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

def extract_dataset():
    """
    Extract the Nairobi property prices dataset from a local zip file.
    """
    # Get the project directory
    project_dir = Path(__file__).resolve().parents[2]
    raw_data_dir = project_dir / 'data' / 'raw'
    
    # Create directory if it doesn't exist
    os.makedirs(raw_data_dir, exist_ok=True)
    
    # Path to the downloaded zip file
    zip_path = project_dir / 'data' /'raw'/ 'archive.zip'
    
    if not zip_path.exists():
        logger.error(f"Zip file not found at {zip_path}")
        logger.info("Please make sure the dataset zip file is in the 'data' folder and named 'archive.zip'")
        return None
    
    logger.info(f"Extracting dataset from {zip_path}...")
    try:
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            zip_ref.extractall(raw_data_dir)
        
        # List the extracted files
        extracted_files = os.listdir(raw_data_dir)
        logger.info(f"Extracted files: {extracted_files}")
        
        return raw_data_dir
    except Exception as e:
        logger.error(f"Error extracting dataset: {e}")
        raise

if __name__ == "__main__":
    extract_dataset()
