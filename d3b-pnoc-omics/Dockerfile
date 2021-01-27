FROM jupyter/datascience-notebook
USER root

WORKDIR /home/jovyan/work

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN apt-get install dialog apt-utils -y

# install for general use
RUN R -e "install.packages('BiocManager',repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('optparse', dependencies = TRUE,repos = 'http://cran.us.r-project.org')"
RUN R -e "BiocManager::install(c('tidyverse','reshape2','rlist','rprojroot'))"

RUN apt-get install gcc

RUN pip install pyranges pyreadr

# install for mutational signature

RUN R -e "BiocManager::install(c('deconstructSigs','GenomicFeatures', 'BSgenome.Hsapiens.UCSC.hg19', 'TxDb.Hsapiens.UCSC.hg19.knownGene', 'VariantAnnotation'))"

RUN R -e "BiocManager::install(c('decompTumor2Sig', 'BSgenome.Hsapiens.UCSC.hg38','TxDb.Hsapiens.UCSC.hg38.knownGene'))"

# install for clustering 
RUN R -e "install.packages('pheatmap',dependencies = TRUE,repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('RColorBrewer',dependencies = TRUE,repos = 'http://cran.us.r-project.org')"
RUN R -e "BiocManager::install(c('CancerSubtypes','ComplexHeatmap','ConsensusClusterPlus'))"
RUN R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/foreign/foreign_0.8-76.tar.gz')"
RUN R -e "install.packages('FactoMineR', dependencies = TRUE,repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('remotes', dependencies = TRUE,repos = 'http://cran.us.r-project.org')"
RUN R -e "remotes::install_github('tpepler/nonpar')"
RUN R -e "install.packages('R.utils',dependencies = TRUE,repos = 'http://cran.us.r-project.org')"


# for rna clustering
RUN R -e "BiocManager::install(c('DESeq2'))"

# install for pathway analysis

RUN R -e "BiocManager::install(c('org.Hs.eg.db','ReactomePA'))"

# for python notebooks
RUN pip install papermill

