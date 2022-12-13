from registry.baidubce.com/paddlepaddle/paddle:2.3.2-gpu-cuda11.2-cudnn8

COPY requirements.txt .

RUN python3 -m pip install -r requirements.txt --quiet --no-cache-dir -i https://mirror.baidu.com/pypi/simple \
    && rm -f requirements.txt
