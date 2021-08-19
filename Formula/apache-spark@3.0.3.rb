class ApacheSparkAT303 < Formula
  desc "Engine for large-scale data processing"
  homepage "https://spark.apache.org/"
  url "https://www.apache.org/dyn/closer.lua?path=spark/spark-3.0.3/spark-3.0.3-bin-hadoop2.7.tgz"
  mirror "https://mirror.its.dal.ca/apache/spark/spark-3.0.3/spark-3.0.3-bin-hadoop2.7.tgz"
  version "3.0.3"
  sha256 "acbea672e6065c912f7ce4af2bd29ce28614d71e5b917dbde15735922f5fe01f"
  head "https://github.com/apache/spark.git"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    # Rename beeline to distinguish it from hive's beeline
    mv "bin/beeline", "bin/spark-beeline"

    rm_f Dir["bin/*.cmd"]
    libexec.install Dir["*"]
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
  end

  test do
    assert_match "Long = 1000",
      pipe_output(bin/"spark-shell --conf spark.driver.bindAddress=127.0.0.1",
                  "sc.parallelize(1 to 1000).count()")
  end
end
