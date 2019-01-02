# homebrew-spark-tap
[Homebrew](https://brew.sh/) tap for archived versions of Apache Spark

## Installation

```sh
brew tap eddies/spark-tap
brew install apache-spark@VERSION_NUMBER
```

If you need to set `SPARK_HOME`, use `$(brew --prefix apache-spark@VERSION_NUMBER)/libexec`, e.g.:

```sh
export SPARK_HOME=$(brew --prefix apache-spark@2.2.0)/libexec
```

## List available versions

```sh
brew search apache-spark@
```

## Contributing a new version

PRs welcome!

In general, try to base your PR on an [apache-spark formula from homebrew/core](https://github.com/Homebrew/homebrew-core/commits/master/Formula/apache-spark.rb), substituting the url mirror in the formula with one from https://archive.apache.org/dist/spark/.