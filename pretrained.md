The pretrained embeddings are trained using
[finalfrontier](https://github.com/finalfusion/finalfrontier) with the
following hyperparameters:

* Subword units: 3 to 6-grams
* Dimensions: 300
* Context size: 10
* Negative samples: 5

The minimum counts are adjusted to the corpus size.

| Language                                                                                                                | Model               | Corpus    |
|:------------------------------------------------------------------------------------------------------------------------|:--------------------|:----------|
| [German](http://www.sfs.uni-tuebingen.de/a3-public-data/finalfusion/german-skipgram-mincount-30-ctx-10-dims-300.fifu)   | skipgram            | TüBa-D/DP |
| [German](http://www.sfs.uni-tuebingen.de/a3-public-data/finalfusion/german-structgram-mincount-30-ctx-10-dims-300.fifu) | structured skipgram | TüBa-D/DP |
