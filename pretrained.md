The pretrained embeddings are trained using
[finalfrontier](https://github.com/finalfusion/finalfrontier) with the
following hyperparameters:

* Subword units: 3 to 6-grams
* Dimensions: 300
* Context size: 10
* Negative samples: 5

The minimum counts are adjusted to the corpus size.

| Language                                                                                                                     | Model               | Corpus                                                                            |
|:-----------------------------------------------------------------------------------------------------------------------------|:--------------------|:----------------------------------------------------------------------------------|
| [Dutch](http://www.sfs.uni-tuebingen.de/a3-public-data/finalfusion/dutch-lassy-skipgram-mincount-15-ctx-10-dims-300.fifu)    | skipgram            | [Lassy Large](https://www.let.rug.nl/vannoord/Lassy/)                             |
| [English](http://www.sfs.uni-tuebingen.de/a3-public-data/finalfusion/english-skipgram-mincount-50-ctx-10-ns-5-dims-300.fifu) | skipgram            | [CoNLL 2017 raw](https://lindat.mff.cuni.cz/repository/xmlui/handle/11234/1-1989) |
| [German](http://www.sfs.uni-tuebingen.de/a3-public-data/finalfusion/german-skipgram-mincount-30-ctx-10-dims-300.fifu)        | skipgram            | TüBa-D/DP                                                                         |
| [German](http://www.sfs.uni-tuebingen.de/a3-public-data/finalfusion/german-structgram-mincount-30-ctx-10-dims-300.fifu)      | structured skipgram | TüBa-D/DP                                                                         |
