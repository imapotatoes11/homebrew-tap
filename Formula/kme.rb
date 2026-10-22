class Kme < Formula
  desc "WYSIWYG Markdown editor for the terminal"
  homepage "https://github.com/imapotatoes11/kme"
  url "https://github.com/imapotatoes11/kme/archive/refs/tags/v1.9.0.tar.gz"
  sha256 "7cd17943d6246e0a5661a8ac538b93875804b858239c1764f44203bb2ace02bd"
  license "MIT"
  head "https://github.com/imapotatoes11/kme.git", branch: "main"

  depends_on macos: :monterey

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release",
           "--build-system", "native",
           "--cache-path", buildpath/".swiftpm-cache",
           "--config-path", buildpath/".swiftpm-config",
           "--security-path", buildpath/".swiftpm-security"
    bin.install ".build/release/kme"
  end

  test do
    assert_match "kme #{version}", shell_output("#{bin}/kme --version")
  end
end
