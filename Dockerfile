FROM kmyuhkyuk/overstats-base-slim:latest

WORKDIR /opt
COPY . /opt/overstats
RUN python /opt/overstats/scf_prepare_assets.py
EXPOSE 9000
CMD ["python", "/opt/overstats/scf_bootstrap.py"]