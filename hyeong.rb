class Hyeong < Formula
  version '0.1.0-beta.2'
  desc "Hyeo-ung Programming Language Compiler in Rust (beta release)"
  homepage "https://github.com/buttercrab/hyeo-ung-lang"

  if OS.mac?
    url "https://github.com/buttercrab/hyeo-ung-lang/releases/download/v#{version}/hyeong-darwin-x86-64.tar.gz"
    sha256 "b8c3cc5271503effaaef358d096bdb57d6481af0cee7e6656eb2b0c12f704d5e"
  elsif OS.linux?
    url "https://github.com/buttercrab/hyeo-ung-lang/releases/download/v#{version}/hyeong-linux-x86-64.tar.gz"
    sha256 "f63b9df26b964292fd7abfa47cec897080d982f6d2167d3dc25ecbedc07e6a30"
  end

  def install
    bin.install "hyeong"
  end
end
