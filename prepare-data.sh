#!/bin/bash
counter=0

while [ $counter -le 9 ]
do
  echo Processing training shard $counter ...
  python -m language.question_answering.bert_joint.prepare_nq_data \
  --logtostderr \
  --input_jsonl /root/data/v1.0/train/nq-train-0$counter.jsonl.gz \
  --output_tfrecord ~/output_dir/nq-train.tfrecords-00000-of-00001 \
  --max_seq_length=512 \
  --include_unknowns=0.02 \
  --vocab_file=bert-joint-baseline/vocab-nq.txt
  ((counter++))
done

while [ $counter -le 49 ]
do
  echo Processing training shard $counter ...
  python -m language.question_answering.bert_joint.prepare_nq_data \
  --logtostderr \
  --input_jsonl /root/data/v1.0/train/nq-train-$counter.jsonl.gz \
  --output_tfrecord ~/output_dir/nq-train.tfrecords-00000-of-00001 \
  --max_seq_length=512 \
  --include_unknowns=0.02 \
  --vocab_file=bert-joint-baseline/vocab-nq.txt
  ((counter++))
done

echo All $counter training data shards processed!
