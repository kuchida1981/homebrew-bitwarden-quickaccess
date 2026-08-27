cask "bw-quickaccess" do
  version "1.4.0"
  sha256 "6978efec85dcfdb8db4870b45cb265eaf1adf370d5ec02524b2f75a3c19c6c4c"

  url "https://github.com/kuchida1981/bitwarden-quickaccess/releases/download/v#{version}/Bitwarden.Quick.Access_aarch64.app.tar.gz"
  name "bw-quickaccess"
  desc "Menu-bar Quick Access for Bitwarden, in the style of 1Password Quick Access"
  homepage "https://github.com/kuchida1981/bitwarden-quickaccess"

  depends_on arch:  :arm64
  depends_on macos: :big_sur

  app "Bitwarden Quick Access.app"

  caveats <<~EOS
    #{token} is not code-signed or notarized. macOS Gatekeeper will refuse
    to open it on first launch. To open it anyway, either:

      1. Right-click (or Control-click) #{appdir}/Bitwarden Quick Access.app in
         Finder, choose "Open", then confirm "Open" in the dialog, or
      2. Reinstall skipping the quarantine attribute:
           brew install --cask --no-quarantine bw-quickaccess
  EOS
end
