class Hyeong < Formula
  desc "Hyeo-ung Programming Language Compiler in Rust"
  homepage "https://github.com/buttercrab/hyeo-ung-lang"
  url "https://github.com/buttercrab/hyeo-ung-lang/archive/v0.1.3.tar.gz"
  sha256 "f99930814206535ae6ba8dcd3103dfb1872fea7805513f7722c23c54c5f5e5f5"

  depends_on "rust"

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
    bin.install "target/release/hyeong"
  end

  test do
    assert_match "hyeong 0.1.1", shell_output("#{bin}/hyeong --version")
    (testpath/"hello_world.hyeong").write "혀어어어어어어어엉........ 핫. 혀엉..... 흑... 하앗...
                                           흐윽... 형.  하앙.혀엉.... 하앙... 흐윽... 항. 항. 형...
                                           하앙. 흐으윽... 형... 흡... 혀엉..하아아앗. 혀엉.. 흡...
                                           흐읍... 형.. 하앗. 하아앙... 형... 하앙... 흐윽...혀어어엉..
                                           하앙. 항. 형... 하앙. 혀엉.... 하앙. 흑... 항. 형...
                                           흡  하앗. 혀엉..... 흑. 흣"
    mkdir_p "~/.hyeong"
    system "rustup", "install", "stable"
    system "rustup", "default", "stable"
    system "#{bin}/hyeong", "build", "--build-path", "#{testpath}/temp", "#{testpath}/hello_world.hyeong"
    assert_match "Hello, world!\n", shell_output("#{testpath}/hello_world")
  end
end
