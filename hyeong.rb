class Hyeong < Formula
  desc "Hyeo-ung Programming Language Compiler in Rust"
  homepage "https://github.com/buttercrab/hyeo-ung-lang"
  url "https://github.com/buttercrab/hyeo-ung-lang/archive/v0.1.0.tar.gz"
  sha256 "e349c3b671049b45f22bb0839fa30a79f1479f9a45e098202688ac5dabe3fcba"

  depends_on "rust"

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
    bin.install "target/release/hyeong"
  end

  test do
    assert_match "hyeong 0.1.0", shell_output("#{bin}/hyeong --version")
  end
end
