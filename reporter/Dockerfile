FROM fedora:28
#RUN yum install -y epel-release
#WORKDIR /app

ENV USER=papermill \
    PIPENV_CACHE_DIR=/home/user/.cache/pipenv \
    HOME=/home/user/ \
    LANG=en_US.UTF-8 \
    GITHUB_COMMIT=1

WORKDIR /home/user

RUN dnf install -y \
      gcc \
      python3-devel \
      python3-pip \
      git

RUN pip3 install \
      ipython==5.0.0 \
      jupyter==1.0.0 \
      jupyterlab \
      jupyter-client==5.2.3 \
      jupyter-console==5.2.0 \
      jupyter-core==4.4.0 \
      matplotlib==2.1.2 \
      nbconvert==5.3.1 \
      tornado==4.2 \
      notebook==5.5.0 \
      pandas==0.22.0 \
      papermill==0.13.4 \
      ipykernel==4.8.2 \
      pyarrow==0.13.0 \
      s3fs \
      pandas_profiling \
      seaborn \
      plotly \
      cufflinks

COPY input.yml Helloworld.ipynb run_test.sh ./

#RUN groupadd -g 2000 papermill \
#  && useradd -m -u 2001 -g papermill papermill
#USER papermill
#RUN chmod u+x run_test.sh
RUN chmod a+wrx -R /etc/passwd /home/user

CMD [ "bash", "./run_test.sh"]
