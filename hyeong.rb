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
    hello_world = File.new("hello_world.hyeong", "w")
    hello_world.syswrite "혀어어어어어어어엉........ 핫. 혀엉..... 흑... 하앗...
                          흐윽... 형.  하앙.혀엉.... 하앙... 흐윽... 항. 항. 형...
                          하앙. 흐으윽... 형... 흡... 혀엉..하아아앗. 혀엉.. 흡...
                          흐읍... 형.. 하앗. 하아앙... 형... 하앙... 흐윽...혀어어엉..
                          하앙. 항. 형... 하앙. 혀엉.... 하앙. 흑... 항. 형... 흡  하앗.
                          혀엉..... 흑. 흣"
    hello_world.close
    assert_match "Hello, world!\n", shell_output("#{bin}/hyeong intall;#{bin}/hyeong build hello_world.hyeong;./hello_world")
  end
end
