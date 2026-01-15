class Cons < Formula
  desc "Structure-last personal knowledge management CLI with AI-powered auto-tagging"
  homepage "https://github.com/mattsonlyattack/construct-app"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/mattsonlyattack/construct-app/releases/download/v0.2.0/cons-macos-x86_64"
      sha256 "39984856a54952c8d2049aa2092b42994576b61988a70b245ed92e9f33ee7610"
    end

    on_arm do
      url "https://github.com/mattsonlyattack/construct-app/releases/download/v0.2.0/cons-macos-aarch64"
      sha256 "02e21c62a6f2e5be77f1f8e03bdb86673a213f53947b074458fdea1ca9620e1c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mattsonlyattack/construct-app/releases/download/v0.2.0/cons-linux-x86_64-musl"
      sha256 "98aed0979c26dd464b4dff3def7a92d231ef258ae9e2d455806c99677f3efb58"
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
