class ApacheSparkAT234 < Formula
  desc "Engine for large-scale data processing"
  homepage "https://spark.apache.org/"
  url "https://archive.apache.org/dist/spark/spark-2.3.4/spark-2.3.4-bin-hadoop2.7.tgz"
  version "2.3.4"
  sha256 "ba277c2c110043d716348871b56db50b0bc7da07470a80009f1d7655563cecaa"
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
    assert_match "Long = 1000", pipe_output(bin/"spark-shell", "sc.parallelize(1 to 1000).count()")
end
end
