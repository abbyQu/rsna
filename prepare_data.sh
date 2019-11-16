# Parameters
# Clone repo https://github.com/darraghdog/rsna and set the location as ROOT directory
ROOT='/mnt/lsf/share/dhanley2/rsna'
RAW_DATA_DIR=$ROOT/data/raw
CLEAN_DATA_DIR=$ROOT/data

# Create directory structures
mkdir -p $RAW_DATA_DIR
mkdir $ROOT/checkpoints

# Download competition data
cd $RAW_DATA_DIR
kaggle competitions download -c rsna-intracranial-hemorrhage-detection
unzip rsna-intracranial-hemorrhage-detection
cd $ROOT

# Copy csv files to data directory
cp $RAW_DATA_DIR/*.csv* CLEAN_DATA_DIR/
unzip CLEAN_DATA_DIR/*.csv*

# Prepare images and metadata
python scripts/prepare_meta_dicom.py
python scripts/prepare_folds.py