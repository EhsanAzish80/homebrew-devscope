class Devscope < Formula
  include Language::Python::Virtualenv

  desc "AI-powered development profiler and intelligence tool"
  homepage "https://github.com/EhsanAzish80/devscope"
  url "https://files.pythonhosted.org/packages/7e/e5/dbc8f7e37c747f9098f187fa57a34279fbadcbecc02a6e199b661ad86a7f/devscope-0.1.1.tar.gz"
  sha256 "ad9cd1453bfd96867ea907557224af17c9c440f10294b6e41e8f3e5b9955ace8"
  license "MIT"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devscope --version")
  end
end
