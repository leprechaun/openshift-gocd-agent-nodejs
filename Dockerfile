FROM gocd/gocd-agent-ubuntu-16.04:v18.1.0

# Install nodejs 0.8
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

# Install openshift cli
RUN curl -L https://github.com/openshift/origin/releases/download/v3.6.0/openshift-origin-client-tools-v3.6.0-c4dd4cf-linux-64bit.tar.gz | \
    tar -zx && \
    mv openshift*/oc /usr/local/bin && \
    rm -rf openshift-origin-client-tools-*

RUN apt-get install -y jq wget graphviz curl

RUN wget -O /usr/local/bin/plantuml.jar 'https://sourceforge.net/projects/plantuml/files/latest/download?source=files'
RUN wget -O /tmp/hub.tgz https://github.com/github/hub/releases/download/v2.3.0-pre10/hub-linux-amd64-2.3.0-pre10.tgz && \
    cd /tmp/ && \
    tar xvf hub.tgz && \
    cp /tmp/hub-linux-amd64-2.3.0-pre10/bin/hub /usr/local/bin/hub && \
    chmod 755 /usr/local/bin/hub


