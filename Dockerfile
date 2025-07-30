FROM continuumio/miniconda3

WORKDIR /app

COPY quantum.yml quantum.yml

RUN conda update -n base -c defaults conda -y && \
    conda env create -f quantum.yml

SHELL ["conda", "run", "-n", "quantum_env", "/bin/bash", "-c"]

COPY . .

CMD ["python", "qpu_exec.py"]
