FROM fedora:29
COPY ./kubernetes.repo /etc/yum.repos.d/kubernetes.repo
RUN cd /root/ && \ 
    rpm --import https://packages.cloud.google.com/yum/doc/yum-key.gpg && \
    rpm --import https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg && \
    dnf install -y net-tools bind-utils nano kubectl && \
    dnf clean all && \
    echo "" >> /root/.bashrc && \
    echo "source /root/.kuberc" >> /root/.bashrc && \
    echo "" >> /root/.bashrc 
COPY ./kuberc /root/.kuberc
