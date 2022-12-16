from registry.baidubce.com/paddlepaddle/paddle:2.3.2

USER root

RUN python -m pip install ipykernel==6.13.0 notebook==6.4.11 jupyterlab-git==0.37.1 jupyterlab==3.4.2 xeus-python==0.14.3 paddlenlp==2.4.3 -i https://mirror.baidu.com/pypi/simple \
&& jupyter lab --generate-config && echo "root:root" | chpasswd

ENV NB_USER jovyan
ENV NB_UID 1000
ENV NB_PREFIX /
ENV HOME /home/$NB_USER
ENV SHELL /bin/bash

# set shell to bash
SHELL ["/bin/bash", "-c"]

# create user and set required ownership
RUN useradd -M -s /bin/bash -N -u ${NB_UID} ${NB_USER} \
 && mkdir -p ${HOME} \
 && chown -R ${NB_USER}:users ${HOME} \
 && chown -R ${NB_USER}:users /usr/local/bin

# set locale configs
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
 && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

USER $NB_UID

ENTRYPOINT jupyter lab \
  --notebook-dir="${HOME}" \
  --ip=0.0.0.0 \
  --no-browser \
  --allow-root \
  --port=8888 \
  --ServerApp.token="" \
  --ServerApp.password="" \
  --ServerApp.allow_origin="*" \
  --ServerApp.base_url="${NB_PREFIX}" \
  --ServerApp.authenticate_prometheus=False
