FROM quay.io/jupyter/pytorch-notebook:python-3.11

USER root

# System dependencies for audio
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ffmpeg \
        sox \
        libsndfile1 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}

# Python dependencies for ASR + diarization
RUN pip install --no-cache-dir \
    pyannote.audio==3.* \
    openai-whisper \
    transformers \
    librosa \
    pydub \
    soundfile \
    datasets \
    ipywidgets
