cask "ucd-eec172-cc3200-support" do
  version "1.5.0"
  sha256 "2c17dff6ed33c4fa5e728648851193f08bf4b67f93c64b37fff339688ebaa4fd"

  url "https://drive.google.com/uc?export=download&id=1bOM-ecZueOonM0ARWNGvJVbUaB3HthLq&confirm=t"
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

  uninstall trash: {
    "/Applications/TI/lib/cc3200sdk_#{version}",
    "/Applications/TI/lib/cc3200servicepack",
  }

  zap trash: [
    "/Applications/TI",
    "~/ti",
  ]
end
