#!/bin/bash
counter=00
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
done

echo All $counter training data shards processed!
