cask "ucd-eec172-sysconfig" do
  version "1.18.1_3343"
  md5 "840c0c61ba875a51eb095e55cc9ff879"

  url "https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-nsUM6f7Vvb/#{version.sub('_', '.')}/sysconfig-#{version}-setup.dmg"
  name "TI SysConfig"
  desc "software and hardware configuration tool"
  homepage "https://www.ti.com/tool/SYSCONFIG"

  livecheck do
    url :homepage
    regex(/href=.*?sysconfig[._-]v?(\d+(?:\.\d+)+\_\d+)[._-]setup\.dmg/i)
  end

  # https://software-dl.ti.com/ccs/esd/documents/ccs_installer-cli.html
  installer script: {
    executable: "sysconfig-#{version}-setup.app/Contents/MacOS/installbuilder.sh",
    args:       [
      "--mode", "unattended", 
      "--prefix", "/Applications/TI",
    ],
  }

  uninstall script: {
    executable: "/Applications/TI/ccs/uninstall_ccs.app/Contents/MacOS/installbuilder.sh",
    args:       ["--mode", "unattended"],
    sudo:       true,
  }

  zap trash: [
    "/Applications/TI",
    "~/ti",
  ]
end