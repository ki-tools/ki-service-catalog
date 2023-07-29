FROM --platform=linux/amd64 rocker/rstudio:4.3.1

RUN /rocker_scripts/install_python.sh
RUN /rocker_scripts/install_verse.sh
RUN /rocker_scripts/install_quarto.sh
RUN /rocker_scripts/install_tidyverse.sh
RUN /rocker_scripts/install_geospatial.sh
RUN /rocker_scripts/install_tensorflow.sh

RUN yes | pip3 install -U radian

RUN apt-get -y update
RUN apt-get -y install jags libnlopt-dev

# fonts
RUN apt-get -y install fnt lcdf-typetools
RUN fnt update
RUN fnt install poppins
RUN fnt install ptmono
RUN fnt install montserrat
RUN fnt install opensans
RUN fnt install nunitosans
RUN fnt install sourcecodepro
RUN fnt install lato
# these end up in /usr/local/share/fonts
RUN chmod -R a+rwx /usr/local/share/fonts/

RUN R -e "remotes::install_version('Rttf2pt1', version = '1.3.8')"

RUN install2.r --error --skipinstalled -n -1 \
    languageserver \
    httpgd \
    ggthemes \
    extrafont

RUN R -e "extrafont::font_import('/usr/local/share/fonts', prompt = FALSE)"
RUN echo 'options(httpgd.system_fonts = list("sans" = "Lato"))' > /root/.Rprofile

RUN install2.r --error --skipinstalled -n -1 \
    eulerr \
    cowplot \
    patchwork \
    officer \
    janitor \
    flextable \
    DT \
    reactable \
    quarto \
    heatmaply \
    tidymodels \
    rjags \
    nloptr \
    ggrepel \
    mice \
    plotly \
    eulerr \
    binom \
    rms \
    quantreg \
    sandwich \
    h2o \
    aws.s3 \
    aws.ec2metadata

RUN echo "* hard nofile 1000000" >> /etc/security/limits.conf
RUN echo "* soft nofile 1000000" >> /etc/security/limits.conf

RUN pip3 install synapseclient
RUN pip3 install pyarrow
RUN pip3 install pandas
RUN pip3 install plotnine
RUN pip3 install numpy
RUN pip3 install synapse-downloader
RUN pip3 install synapse-uploader

# RUN R -e "remotes::install_github('jackwasey/icd')"

