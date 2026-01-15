class Cons < Formula
  desc "Structure-last personal knowledge management CLI with AI-powered auto-tagging"
  homepage "https://github.com/mattsonlyattack/construct-app"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/mattsonlyattack/construct-app/releases/download/v#{version}/cons-macos-x86_64"
      sha256 "PLACEHOLDER_INTEL_SHA256"
    end

    on_arm do
      url "https://github.com/mattsonlyattack/construct-app/releases/download/v#{version}/cons-macos-aarch64"
      sha256 "PLACEHOLDER_ARM_SHA256"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mattsonlyattack/construct-app/releases/download/v#{version}/cons-linux-x86_64-musl"
      sha256 "PLACEHOLDER_LINUX_SHA256"
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
