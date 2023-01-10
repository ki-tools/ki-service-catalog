FROM rocker/rstudio:4.2.2

RUN /rocker_scripts/install_python.sh
RUN /rocker_scripts/install_verse.sh
RUN /rocker_scripts/install_quarto.sh
RUN /rocker_scripts/install_tidyverse.sh
RUN /rocker_scripts/install_geospatial.sh
RUN /rocker_scripts/install_tensorflow.sh

RUN yes | pip3 install -U radian

RUN install2.r --error --skipinstalled -n -1 \
    languageserver \
    httpgd
