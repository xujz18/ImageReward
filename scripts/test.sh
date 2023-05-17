#! /bin/bash

# Download dataset.
cd data
if [ ! -d "test_images" ]; then
    unzip test_images.zip
fi
cd ..

# test
run_cmd="python test.py"

echo ${run_cmd}
eval ${run_cmd}
set +x