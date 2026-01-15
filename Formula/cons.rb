class Cons < Formula
  desc "Structure-last personal knowledge management CLI with AI-powered auto-tagging"
  homepage "https://github.com/mattsonlyattack/construct-app"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/mattsonlyattack/construct-app/releases/download/v#{version}/cons-macos-x86_64"
      sha256 "550d5346520e15560431dc7aa40d6fb5f4756b9760a53762a01ea277e03bf28e"
    end

    on_arm do
      url "https://github.com/mattsonlyattack/construct-app/releases/download/v#{version}/cons-macos-aarch64"
      sha256 "bb642a96fe51dc47daa22f34add010e50cf130fcc1f6ccd147dfea21d5ebc930"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mattsonlyattack/construct-app/releases/download/v#{version}/cons-linux-x86_64-musl"
      sha256 "9324663798ce62200a8287c5f73bf831d21625359ac3f50b3343924e4dc50512"
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
