FROM amazon/aws-cli

RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

ENTRYPOINT ["helm"]
CMD ["help"]