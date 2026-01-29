# Base image: Overleaf Community Edition (historically named sharelatex)
FROM sharelatex/sharelatex:latest

# Install full TeX Live distribution.
# This is large, but guarantees availability of all LaTeX packages
# (fonts, languages, TikZ, IEEE templates, Cyrillic, etc.).
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      texlive-full \
      fonts-cmu \
      fonts-dejavu \
      fonts-liberation \
      ghostscript && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
