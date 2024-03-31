cask "ucd-eec172-cc3200-support" do
  version "1.5.0"
  sha256 "bec605e31bbcb96ba3dab024f1ba8beda0fed9908f70bc9d3d8095307c528534"

  url "https://github.com/ucd-eec172/ucd-eec172.github.io/raw/main/files/cc3200-support.zip"
  name "CC3200 Support Files"
  desc "SDK 1.5.0 and ServicePack 1.0.1.15-2.15.0.1 for CC3200"
  homepage "https://www.ti.com/tool/CC3200SDK"

  installer script: {
    executable: "cc3200-support/install.sh",
    args:       [
      "--prefix",
      "/Applications/TI/",
    ],
  }

  uninstall trash: [
    "/Applications/TI/lib/cc3200sdk_#{version}",
    "/Applications/TI/lib/cc3200servicepack",
  ]

  zap trash: [
    "/Applications/TI",
    "~/ti",
  ]
end
