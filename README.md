# Nairobi Property Price Prediction

A data science project aimed at predicting residential property prices in Nairobi based on features such as location, property type, size, number of bedrooms, and other relevant attributes.

## Project Objective

To build a robust predictive model that estimates residential property values in Nairobi, helping various stakeholders make informed decisions regarding real estate investments, pricing strategies, and market analysis.

## Stakeholders

- Real estate developers and social housing planners
- Real estate agents and investors
- Homebuyers and loan officers

## Business Value

- Identify primary drivers of pricing in Nairobi's property market
- Provide accurate price estimates to support decision-making
- Analyze pricing disparities between neighborhoods to identify investment or affordability trends

## Project Structure

```
nairobi-property-prices/
│
├── data/                      # Data directory
│   ├── raw/                   # Raw, immutable data
│   └── processed/             # Cleaned and processed data
│
├── notebooks/                 # Jupyter notebooks for exploration and analysis
│   ├── 01-data-understanding.ipynb
│   ├── 02-data-preparation.ipynb
│   ├── 03-exploratory-data-analysis.ipynb
│   ├── 04-modeling.ipynb
│   └── 05-model-evaluation.ipynb
│
├── src/                       # Source code
│   ├── data/                  # Scripts for data processing
│   │   ├── __init__.py
│   │   ├── download_dataset.py  # Extract data from zip file
│   │   └── make_dataset.py      # Process and clean the data
│   │
│   ├── features/              # Scripts for feature engineering
│   ├── models/                # Scripts for model training and evaluation
│   └── visualization/         # Scripts for data visualization
│
├── models/                    # Trained models and model predictions
│
├── reports/                   # Generated analysis reports
│   └── figures/               # Generated graphics and figures
│
├── requirements.txt           # Package dependencies
├── setup.py                   # Project installation
├── setup.ps1                  # PowerShell setup script
├── run.ps1                    # PowerShell script to run commands
├── Makefile                   # Makefile with commands like `make data` or `make train`
└── README.md                  # Project overview and instructions
```

## Project Phases

1. **Business Understanding**: Define objectives, users, decisions supported, and establish success criteria
2. **Data Understanding**: Load and explore the dataset, generate summary statistics and initial insights
3. **Data Preparation**: Clean data, standardize units, handle missing values, encode categorical variables
4. **Exploratory Data Analysis**: Visualize price trends, perform correlation analysis, identify key patterns
5. **Modeling**: Train regression models, evaluate performance, tune hyperparameters
6. **Model Evaluation & Interpretation**: Compare models, interpret feature importance, assess equity
7. **Deployment & Recommendations**: Package the model, provide documentation and recommendations
8. **Monitoring & Maintenance**: Establish mechanisms for updating the model and monitoring performance

## Success Metrics

- **Model Performance**: RMSE, MAE, R²
- **Business Impact**: Stakeholder validation of price estimates, insights into feature importance

## Getting Started

### Prerequisites
- Python 3.8 or higher
- The dataset zip file (`nairobi_property_prices.zip`) placed in the `data/` directory

### Setup Instructions

1. Clone this repository:
```bash
git clone https://github.com/Trailblazer-dev/nairobi-property-prices.git
cd nairobi-property-prices
```

2. Place the `nairobi_property_prices.zip` file in the `data/` directory

3. Run the setup script to create a virtual environment and install dependencies:

```powershell
# On Windows:
.\setup.ps1

# On Unix/Linux/Mac:
# Use the Makefile instead:
make create_environment
source venv/bin/activate
make requirements
```

### Running the Project

You can use the provided scripts to run different stages of the project:

```powershell
# On Windows:
.\run.ps1 extract_data   # Extract data from the zip file
.\run.ps1 data           # Process the extracted data
.\run.ps1 train          # Train models on the processed data
.\run.ps1 predict        # Make predictions using the trained models

# On Unix/Linux/Mac:
# Use the Makefile instead:
make extract_data
make data
make train
make predict
```

## Development Workflow

1. **Data Understanding**: Explore the dataset in Jupyter notebooks to understand its structure
2. **Data Preparation**: Clean and process the data using the data processing scripts
3. **Feature Engineering**: Create new features that might improve model performance
4. **Modeling**: Train and evaluate different regression models
5. **Evaluation**: Compare models and interpret feature importance
6. **Deployment**: Package the best model for predictions

## License

[Specify the license here]

## Contributors

[List contributors here]
