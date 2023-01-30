FROM carla-prerequisites:latest

ARG GIT_BRANCH=master
ARG GIT_REPO=https://github.com/carla-simulator/carla.git

RUN git clone --depth 1 --branch $GIT_BRANCH "$GIT_REPO" /home/ue4/carla

WORKDIR /home/ue4/carla

RUN ./Update.sh && \
    sed -i 's/GenerateProjectFiles/Engine\/Build\/BatchFiles\/Linux\/GenerateProjectFiles/g' Util/BuildTools/BuildCarlaUE4.sh && \
    make CarlaUE4Editor && \
    make PythonAPI && \
    make build.utils && \
    make package && \
    rm -r /home/ue4/carla/Dist
