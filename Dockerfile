FROM r-base

USER root



RUN apt-get update && apt-get install -y openssl libssl-dev curl libcurl4-openssl-dev libxml2-dev 
RUN Rscript -e "source('https://bioconductor.org/biocLite.R'); biocLite(c('AnnotationDbi','org.Hs.eg.db','annotate', 'genefilter', 'sva'))" 
RUN Rscript -e "install.packages('dplyr')" 
RUN Rscript -e "install.packages('curl')" 
RUN Rscript -e "install.packages('openssl')"
RUN Rscript -e "install.packages('git2r')" 
RUN Rscript -e "install.packages('httr')"
RUN Rscript -e "install.packages('httpuv')"
RUN Rscript -e "install.packages('devtools', dependencies = T)"
RUN Rscript -e "install.packages('http://www.cbs.dtu.dk/biotools/jetset/current/jetset_3.4.0.tar.gz', repos = NULL, type = 'source')"
RUN Rscript -e "install.packages('XML', repos = 'https://cran.r-project.org/')"
RUN Rscript -e "source('https://bioconductor.org/biocLite.R'); biocLite(c('caTools', 'piano', 'downloader', 'RColorBrewer', 'magicaxis', 'WriteXLS', 'gdata', 'R.utils','Hmisc', 'affy', 'affxparser', 'affyio', 'frma', 'hthgu133afrmavecs', 'hthgu133acdf', 'hthgu133a.db', 'hgu133a.db', 'hgu133afrmavecs', 'hgu133plus2frmavecs', 'hgu133plus2.db','PharmacoGx', 'lsa'))"
RUN Rscript -e "install.packages('readr')"
RUN Rscript -e "install.packages('gdata')"
RUN Rscript -e "install.packages('openxlsx')"
RUN Rscript -e "install.packages('readxl')"
RUN wget 'https://s3.amazonaws.com/anthtestpachy/PharmacoGxPrivate_0.0.1.tar.gz'
RUN wget 'https://s3.amazonaws.com/anthtestpachy/CoreGx_0.0.001.tar.gz'
RUN tar zxvf PharmacoGxPrivate_0.0.1.tar.gz
RUN tar zxvf CoreGx_0.0.001.tar.gz
RUN Rscript -e "library(devtools); install.packages('PharmacoGxPrivate_0.0.1.tar.gz', repos = NULL, type='source')"
RUN Rscript -e "library(devtools); install.packages('CoreGx_0.0.001.tar.gz', repos = NULL, type='source')"
RUN Rscript -e "library(devtools); install_github('bhklab/genefu')"
RUN Rscript -e "source('https://bioconductor.org/biocLite.R'); biocLite('tximport')"
RUN Rscript -e "source('https://bioconductor.org/biocLite.R'); biocLite('rhdf5')"
RUN Rscript -e "source('https://bioconductor.org/biocLite.R'); biocLite('hgu133plus2frmavecs')"
RUN Rscript -e "install.packages('plyr')"