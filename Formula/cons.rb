class Cons < Formula
  desc "Structure-last personal knowledge management CLI with AI-powered auto-tagging"
  homepage "https://github.com/mattsonlyattack/construct-app"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/mattsonlyattack/construct-app/releases/download/v0.3.0/cons-macos-x86_64"
      sha256 "6e9341d46e0955fcf5dee9ddaaf7154c9436df8716083205b54c7d488ee44ab9"
    end

    on_arm do
      url "https://github.com/mattsonlyattack/construct-app/releases/download/v0.3.0/cons-macos-aarch64"
      sha256 "5f387475e0efa2402cfc582c5ab0e042347d4c6fd9638bcd53e52b561a2dcb41"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mattsonlyattack/construct-app/releases/download/v0.3.0/cons-linux-x86_64-musl"
      sha256 "7114b6fe8163f5310377122f6a8be19cf705deb8047a39e4639eb4c3679e2e9d"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.intel?
        bin.install "cons-macos-x86_64" => "cons"
      else
        bin.install "cons-macos-aarch64" => "cons"
      end
    elsif OS.linux?
      bin.install "cons-linux-x86_64-musl" => "cons"
    end
  end

  test do
    system "#{bin}/cons", "--version"
  end
end
