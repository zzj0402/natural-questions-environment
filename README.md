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
Mount dataset and run the image:  
```docker run -v ~/Project/NaturalQuestionsData:/root/data -it zzj0402/natural-questions-environment bash```
