FROM amazon/aws-cli

RUN yum update -y && \
    yum install -y openssl tar gzip && \
    yum clean all && rm -rf /var/cache/yum && \
    curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

ENTRYPOINT ["helm"]
CMD ["help"]