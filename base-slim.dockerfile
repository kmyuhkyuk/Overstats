FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1 PYTHONDONTWRITEBYTECODE=1
COPY requirements.txt /opt/requirements.txt
RUN apt-get update && apt-get install -y --no-install-recommends \
        libjpeg62-turbo \
        libopenjp2-7 \
        libtiff6 \
        libwebp7 \
        libwebpmux3 \
        libwebpdemux2 \
        libfreetype6 \
        liblcms2-2 \
        libxcb1 \
        libx11-6 \
        gcc \
        build-essential \
        python3-dev \
        libwebp-dev \
    && pip install --no-cache-dir -r /opt/requirements.txt --extra-index-url https://www.piwheels.org/simple \
    && pip install --no-cache-dir 'cos-python-sdk-v5>=1.9,<2' --extra-index-url https://www.piwheels.org/simple \
    && apt-get purge -y --auto-remove gcc build-essential python3-dev \
    && rm -rf /var/lib/apt/lists/*