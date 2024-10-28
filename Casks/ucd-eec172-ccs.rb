cask "ucd-eec172-ccs" do
  version "12.5.0.00007"
  sha256 "29f91075206ff8616a75a242494d1da602e7f23a5c4ccf636738f6d86e0ff91a"

  url "https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-J1VdearkvK/#{version.major_minor_patch}/ccs_installer_osx_#{version}.dmg"
  name "Code Composer Studio (CCS)"
  desc "Integrated development environment"
  homepage "https://www.ti.com/tool/CCSTUDIO"

  livecheck do
    url :homepage
    regex(/href=.*?ccs[._-]installer[._-]osx[._-]v?(\d+(?:\.\d+)+)\.dmg/i)
  end

  conflicts_with cask: ["code-composer-studio"]

  # https://software-dl.ti.com/ccs/esd/documents/ccs_installer-cli.html
  installer script: {
    executable: "ccs_setup_#{version}.app/Contents/MacOS/installbuilder.sh",
    args:       [
      "--mode", "unattended",
      "--prefix", "/Applications/TI",
      "--enable-components", "PF_CC3X",
      "--enable-components", "PF_MSP432"
    ],
  }

  uninstall script: {
    executable: "/Applications/TI/ccs/uninstall_ccs.app/Contents/MacOS/installbuilder.sh",
    args:       ["--mode", "unattended"],
    sudo:       true,
  }

  zap trash: [
    "/Applications/TI",
    "~/Library/Preferences/org.eclipse.platform.ide.plist",
    "~/Library/Saved Application State/org.eclipse.platform.ide.savedState",
    "~/ti",
    "~/workspace_v#{version.major}",
  ]
end
