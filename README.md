# natural-questions-environment
Docker Environment for Google Natural Questions

## Prerequisite

- gsutil
- docker

## Dataset

In the host machine, download the dataset:
```bash
gsutil -m cp -R gs://natural_questions/v1.0 ~/Project/NaturalQuestionsData
```

## Run Container
In the host machine, mount dataset and run the image:  
```docker run -v ~/Project/NaturalQuestionsData:/root/data -it zzj0402/natural-questions-environment bash```

## Prepare Data

Inside the Docker container, run:  
```shell
cd /root/language/ && bash /root/language/prepare-data.sh
```

### Combined TF-Records

There is a combined version of all the data record shards: nq-train.tfrecords.combined
