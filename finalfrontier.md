---
title: Training embeddings
nav_order: 10
---

# Training embeddings

## finalfrontier

finalfrontier is a program for training [finalfusion](/) word
embeddings. finalfrontier currently has the following features:

* Noise contrastive estimation (Gutmann and Hyvärinen, 2012)
* Subword representations (Bojanowski et al., 2016)
* Hogwild SGD (Recht et al., 2011)
* Models:
  - skip-gram (Mikolov et al., 2013)
  - structured skip-gram (Ling et al., 2015)
  - directional skip-gram (Song et al., 2018)
  - dependency (Levy and Goldberg, 2014)

## Getting finalfrontier

We provide precompiled [finalfrontier
releases](https://github.com/finalfusion/finalfrontier/releases) for
Linux and macOS. If you use another platform, follow the [build
instructions](https://github.com/finalfusion/finalfrontier/blob/master/docs/INSTALL.md).

## Quickstart

### Skip-gram models

Train a model with 300-dimensional word embeddings, the structured skip-gram
model, discarding words that occur fewer than 10 times, in 10 epochs, using
16 threads:


~~~bash
$ ff-train-skipgram --dims 300 --model structgram --epochs 10 --mincount 10 \
  --threads 16 corpus.txt corpus-embeddings.fifu
~~~

The format of the input file is simple: tokens are separated by
spaces, sentences by newlines (`\n`).  After training, you can use and
query the embeddings with
[finalfusion](https://github.com/finalfusion/finalfusion-rust) and
`finalfusion-utils`:

~~~ bash
$ ff-similar corpus-embeddings.fifu
~~~

### Dependency embeddings

Train embeddings with dimensionality 200 on `corpus.conll` using the dependency
model from contexts with depth up to 2:

~~~bash
$ ff-train-deps --depth 2 --normalize --dims 200 \
  corpus.conll dewiki-deps.bin
~~~

The input file should be in CoNLL-X format.
