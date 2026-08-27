cask "bw-quickaccess" do
  version "1.3.0"
  sha256 "c8f1da8ceb2f4e7af031b519e8ec2eb9d8cd17e6e147a00c356504434bcdc6de"

  url "https://github.com/kuchida1981/bitwarden-quickaccess/releases/download/v#{version}/bw-quickaccess_aarch64.app.tar.gz"
  name "bw-quickaccess"
  desc "Menu-bar Quick Access for Bitwarden, in the style of 1Password Quick Access"
  homepage "https://github.com/kuchida1981/bitwarden-quickaccess"

  depends_on arch:  :arm64
  depends_on macos: :big_sur

  app "bw-quickaccess.app"

  caveats <<~EOS
    #{token} is not code-signed or notarized. macOS Gatekeeper will refuse
    to open it on first launch. To open it anyway, either:

      1. Right-click (or Control-click) #{appdir}/bw-quickaccess.app in
         Finder, choose "Open", then confirm "Open" in the dialog, or
      2. Reinstall skipping the quarantine attribute:
           brew install --cask --no-quarantine bw-quickaccess
  EOS
end
