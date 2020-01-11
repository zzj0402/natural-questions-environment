FROM tensorflow/tensorflow:1.12.3-gpu

ENV TZ=Pacific/Auckland
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

RUN apt-get install -y git-all

# Downloading gcloud package
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz

# Installing the package
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh

# Adding the package path to local
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

RUN apt-get install -y vim

WORKDIR /root/

RUN git clone https://github.com/google-research/language.git

RUN git clone https://github.com/google-research/bert.git

RUN pip install bert-tensorflow natural-questions --no-dependencies

RUN cp -r bert language/

RUN gsutil cp -R gs://bert-nq/bert-joint-baseline ./language

RUN gsutil cp -R gs://bert-nq/tiny-dev ./language

RUN mkdir /root/output_dir/

COPY ./prepare-data.sh /root/language

COPY ./fine-tune.sh /root/language

RUN rm language/language/question_answering/bert_joint/prepare_nq_data.py

COPY ./prepare_nq_data.py /root/language/language/question_answering/bert_joint/

COPY ./combine-records.py /root/language/
