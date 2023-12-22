mkdir -p ./data
sed -i '/DATA_DIR/d' .env
echo 'DATA_DIR=./data' >> .env