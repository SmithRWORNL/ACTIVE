FROM python:3.9-slim AS build

ENV PATH="/root/.local/bin:$PATH"

RUN apt update 
RUN apt install -y curl make 
RUN rm -rf /var/lib/apt/lists/* 
RUN curl -sSL https://raw.githubusercontent.com/pdm-project/pdm/main/install-pdm.py | python -

# EP specific, delete these
RUN apt-get update
RUN apt-get install -y libgomp1
#

RUN mkdir /build
WORKDIR /build
ADD pyproject.toml /build/pyproject.toml
ADD pdm.lock /build/pdm.lock
RUN pdm install --frozen-lockfile --no-self

ADD . /build


RUN pdm build
#RUN pdm publish --password PYPI_PASSWORD --repository https://code.ornl.gov/api/v4/projects/15464/packages/pypi --username r8s
RUN pip install dist/active-1.4.2-py3-none-any.whl


#CMD [ "/bin/bash" ]


#FROM senhuang/volttron:6.x

#ENV VOLTTRON_HOME=~/.volttron_central
#USER root
#RUN rm /bin/sh && ln -s /bin/bash /bin/sh
#RUN apt-get update
#RUN apt-get install -y software-properties-common
#RUN apt update
#RUN add-apt-repository ppa:deadsnakes/ppa
#RUN apt-get update
#RUN apt-get install -y python3.8.10
#RUN update-alternatives --install /home/volttron/volttron/env/bin/python python /usr/bin/python3.8.10 2
#RUN update-alternatives --set python /usr/bin/python3.8.10
#USER volttron

#RUN python3 -m pip install --upgrade --force pip

#COPY --from=build /build/example.json /home/volttron/volttron/example.json
#COPY --from=build /build/examples/mypackage /build/examples/mypackage
#COPY --from=build /build/example-volttron.json /home/volttron/volttron/example-volttron.json
#COPY --from=build /build/dist/active-0.1.0-py3-none-any.whl ./active-0.1.0-py3-none-any.whl
#ENV PATH="/home/volttron/volttron/env/bin:$PATH"
#RUN python3.8.10 -m pip install active-0.1.0-py3-none-any.whl
#RUN apt-get install -y curl
#RUN ~/.pyenv/bin/pyenv install python 3.8.10

#WORKDIR /home/volttron/volttron
