class Devscope < Formula
  include Language::Python::Virtualenv

  desc "AI-powered development profiler and intelligence tool"
  homepage "https://github.com/EhsanAzish80/devscope"
  url "https://files.pythonhosted.org/packages/7e/e5/dbc8f7e37c747f9098f187fa57a34279fbadcbecc02a6e199b661ad86a7f/devscope-0.1.1.tar.gz"
  sha256 "ad9cd1453bfd96867ea907557224af17c9c440f10294b6e41e8f3e5b9955ace8"
  license "MIT"

  depends_on "python@3.11"

  # Runtime dependencies
  resource "anthropic" do
    url "https://files.pythonhosted.org/packages/4f/6f/02e51f7a0ab71c38c81189c766a5f62c21d8e3d973ff3b811e10071ae48f/anthropic-0.42.0.tar.gz"
    sha256 "659e5059c5e32a30bbf72fa1f75c3fa1e5238a8f2e45c21e2d37f5d9bf13655b"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/f6/40/318e58f669b1a9e00f5c4453910682e2d9dd594334539c7b7817dabb765f/anyio-4.7.0.tar.gz"
    sha256 "2f834749c602966b7d456a7567cafcb309f96482b5081d14ac93ccd457f9dd48"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/0f/bd/1d41ee578ce09523c81a15426705dd20969f5abf006d1afe8aeff0dd776a/certifi-2024.12.14.tar.gz"
    sha256 "b650d30f370c2b724812bee08008be0c4163b163ddaec3f2546c1caf65f191db"
  end

  resource "distro" do
    url "https://files.pythonhosted.org/packages/fc/f8/98eea607f65de6527f8a2e8885fc8015d3e6f5775df186e443e0964a11c3/distro-1.9.0.tar.gz"
    sha256 "2fa77c6fd8940f116ee1d6b94a2f90b13b5ea8d019b98bc8bafdcabcdd9bdbed"
  end

  resource "gitdb" do
    url "https://files.pythonhosted.org/packages/19/0d/bbb5b5ee188dec84647a4664f3e11b06ade2bde568dbd489d9d64adef8ed/gitdb-4.0.11.tar.gz"
    sha256 "bf5421126136d6d0af55bc1e7c1af1c397a34f5b7bd79e776cd3e89785c2b04b"
  end

  resource "gitpython" do
    url "https://files.pythonhosted.org/packages/e9/bc/64f8251d2575f0ca27eb23b27c8c92cfc7b0129e7e19fa8e8730ecdd9c43/gitpython-3.1.44.tar.gz"
    sha256 "c87e30b26253bf5418037d4e27a0330f37e4caf4decff30b58358e755896b17e"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/f5/38/3af3d3633a34a3316095b39c8e8fb4853a28a536e55d347bd8d8e9a14b03/h11-0.14.0.tar.gz"
    sha256 "8f19fbbe99e72420ff35c00b27a34cb9937e902a8b810e2c88300c6f0a3b699d"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/6a/41/d7d0a89eb493922c37d343b607bc1b5da7f5be7e383740b4753ad8943e90/httpcore-1.0.7.tar.gz"
    sha256 "8551cb62a169ec7162ac7be8d4817d561f60e08eaa485234898414bb5a8a0b4c"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/78/82/08f8c936781f67d9e6b9eeb8a0c8b4e406136ea4c3d1f89a5db71d42e0e6/httpx-0.28.1.tar.gz"
    sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d/idna-3.10.tar.gz"
    sha256 "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
  end

  resource "jiter" do
    url "https://files.pythonhosted.org/packages/26/ef/64458dfad180debd70d9dd1ca4f607e52bb6de748e5284d748556a0d5173/jiter-0.8.2.tar.gz"
    sha256 "7f692d06084e3c477bffd93c254aeee6b0013c0b8adbc8e4f3f974e574b0437e"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/a9/b7/d9e3f12af310e1120c21603644a1cd86f59060e040ec5c3a80b8f05fae30/pydantic-2.10.3.tar.gz"
    sha256 "cb5ac360ce894ceacd69c403187900a02c4b20b693a9dd1d643e1effab9eadf9"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/fc/01/f3e5ac0e9b02e55bf14fe6b5e2f7fce807194ad32c84e046b35a2003f8d8/pydantic_core-2.27.1.tar.gz"
    sha256 "62a763352879b84aa31058fc931884055fd75089cccbd9d58bb6afd01141b235"
  end

  resource "smmap" do
    url "https://files.pythonhosted.org/packages/88/04/b5bf6d21dc4041000ccba7eb17dd3055feb237e7ffc2c20d3fae3af62baa/smmap-5.0.1.tar.gz"
    sha256 "dceeb6c0028fdb6734471eb07c0cd2aae706ccaecab45965ee83f11c8d3b1f62"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/a2/87/a6771e1546d97e7e041b6ae58d80074f81b7d5121207425c964ddf5cfdbd/sniffio-1.3.1.tar.gz"
    sha256 "f4324edc670a0f49750a81b895f35c3adb843cca46f0530f79fc1babb23789dc"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/df/db/f35a00659bc03fec321ba8bce9420de607a1d37f8342eee1863174c69557/typing_extensions-4.12.2.tar.gz"
    sha256 "1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devscope --version")
  end
end
