---
title: finalfusion specification
nav_order: 30
---

# finalfusion specification

**Version 0**

## Goals

`finalfusion` is a format for storing word embeddings. The goals of the
first version of the finalfusion format are:

1. Easy to parse
2. Fast to parse
3. Extensible
4. Support for:
  * Memory mapping
  * Tokens with spaces
  * Subword units
  * Quantized matrices
5. Existing embeddings should be convertible

## File format

Each `finalfusion` file consists of a header, followed by chunks. Currently,
a `finalfusion` file must contain the following chunk order:

1. Optional metadata chunk
2. Vocabulary chunk
3. Storage chunk

The permitted chunks may be extended in a future version of the
specification. In particular, we would like to make it possible:

* To have multiple storage chunks per vocabulary.
* To have multiple vocab-storage pairs.

All data must be in little endian byte order.

## Header

The header consists of:

- 4 bytes of magic: `['F', 'i', 'F', 'u']`
- Format version number: u32
- Number of chunks: u32 (`n_chunks`)
- Chunk identifiers: `[u32; n_chunks]`

## Data types

```
0: i8
1: u8
2: i16
3: u16
4: i32
5: u32
6: i64
7: u64
8: i128
9: u128
10: f32
11: f64
```

## Chunks

### Chunk format

The chunk format is as follows:

- Chunk identifier: u32
- Chunk data length: u64
- Chunk data: n bytes

### Simple Vocab

- Chunk identifier: 1
- Vocab length: u64 (`vocab_len`)
- `vocab_len` times:
  - word length in bytes: u32 (`word_len`)
  - `word_len` times u8.
  
### Finalfusion subword vocab

- Chunk identifier: 3
- Minimum n-gram length: u32
- Maximum n-gram length: u32
- Bucket exponent: u32
- Vocab length: u64 (`vocab_len`)
- `vocab_len` times:
  - word length in bytes: u32 (`word_len`)
  - `word_len` times u8.

### fastText subword vocab

- Chunk identifier: 7
- Minimum n-gram length: u32
- Maximum n-gram length: u32
- Number of buckets: u32
- Vocab length: u64 (`vocab_len`)
- `vocab_len` times:
  - word length in bytes: u32 (`word_len`)
  - `word_len` times u8.

### Explicit n-gram vocab

- Chunk identifier: 8
- Minimum n-gram length: u32
- Maximum n-gram length: u32
- Vocab length: u64 (`vocab_len`)
- `vocab_len` times:
  - word length in bytes: u32 (`word_len`)
  - `word_len` times u8.
- N-gram vocab length: u64 (`n_ngrams`)
- `n_ngrams` times:
  - n-gram length in bytes: u32 (`ngram_len`)
  - `ngram_len` times u8.

### Embedding matrix

- Chunk identifier: 2
- Shape:
  - Rows: u64 (`n_rows`)
  - Cols: u32 (`n_cols`)
- Data type: u32 (`data_type`)
- Padding, such that data is at a multiple of `size_of::<data_type>()`.
- Data: `n_row` * `n_cols` * `sizeof(data_type)`

### Quantized embedding matrix

- Chunk identifier: 4
- Use projection (0 or 1): u32
- Use norms (0 or 1): u32
- Quantized embedding length: u32 (`quantized_len`)
- Reconstructed embedding length: u32 (`reconstructed_len`)
- Number of quantizer centroids: u32
- Quantized matrix rows: u64 (`matrix_rows`)
- Quantized matrix type: u32 (`quantized_type`)
- Reconstruced matrix type: u32 (`reconstructed_type`)
- Padding, such that data is at a multiple of the largest matrix data type.
- Projection matrix: `reconstructed_len` x `reconstructed_len` x `sizeof(reconstructed_type)`
- Subquantizers: `quantized_len` x (`reconstructed_len` / `quantized_len`) x `sizeof(quantized_type)`
- Norms: `matrix_rows` x `sizeof(reconstructed_type)`
- Quantized embedding matrix: `matrix_rows` x `quantized_len` x `sizeof(reconstructed_type)`

### Metadata

- Chunk identifier: 5
- UTF8 encoded Metadata in TOML format: `chunk_data_len` times `u8`

### NdNorms

- Chunk identifier: 6
- Number of norms: u64 (`n_norms`)
- Data type: u32 (`data_type`)
- Padding, such that data is at a multiple of `size_of::<data_type>()`.
- Data: `n_norms` * `sizeof(data_type)`
