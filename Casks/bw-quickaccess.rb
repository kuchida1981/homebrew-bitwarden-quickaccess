cask "bw-quickaccess" do
  version "1.0.0"
  sha256 "6dd69706f9c1032b98482d296fc6ad169d5bebaf39e762ba40dbd64b8bb2c77e"

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
