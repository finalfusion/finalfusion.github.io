---
title: Introduction to finalfusion
nav_order: 0
---

# Introduction to finalfusion

## Features

finalfusion is a file format for word embeddings and an associated set
of libraries and utilities. The file format has the following features:

* Word and subword vocabularies.
* Regular and quantized embedding matrices.
* Memory mapping of embedding matrices.

We also provide
[finalfrontier](https://github.com/finalfusion/finalfrontier) to train
finalfusion embeddings.

## Getting embeddings

* We provide a growing set of [pretrained](pretrained) embeddings.
* We also provide conversions of the fastText
  [Wikipedia](http://www.sfs.uni-tuebingen.de/a3-public-data/finalfusion-fasttext/wiki/)
  and [Common
  Crawl](http://www.sfs.uni-tuebingen.de/a3-public-data/finalfusion-fasttext/cc/)
  embeddings.
* You can use [finalfrontier](finalfrontier) to train your own
  finalfusion embeddings.

## Libraries

finalfusion libraries are available for:

* [Rust](https://docs.rs/finalfusion)
* [Python](python)

## Specification

If you are interesed in implementing your own library for the
finalfusion format, please see [version 0](spec) of the finalfusion
specification.

## Acknowledgements

finalfusion and finalfrontier were developed by [Daniël de
Kok](https://danieldk.eu) and [Sebastian
Pütz](https://github.com/sebpuetz). Financial support for research and
development of this software was provided by the German Research
Foundation (DFG) as part of the Collaborative Research Center “The
Construction of Meaning” (SFB 833), project A3.
