class Kme < Formula
  desc "WYSIWYG Markdown editor for the terminal"
  homepage "https://github.com/imapotatoes11/kme"
  url "https://github.com/imapotatoes11/kme/archive/refs/tags/v1.9.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"
  head "https://github.com/imapotatoes11/kme.git", branch: "main"

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/kme"
  end

  test do
    assert_match "kme #{version}", shell_output("#{bin}/kme --version")
  end
end
