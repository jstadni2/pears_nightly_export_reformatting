:: Build the Docker image for pears_nightly_export_reformatting.py
docker build -t il_fcs/pears_nightly_export_reformatting:latest .
:: Create and start the Docker container 
docker run --name pears_nightly_export_reformatting il_fcs/pears_nightly_export_reformatting:latest
:: Copy /sample_outputs from the container to the build context
docker cp pears_nightly_export_reformatting:/pears_nightly_export_reformatting/sample_outputs/ ./
:: Remove the container
docker rm pears_nightly_export_reformatting
pause
