{ self, ... }@inputs: [
  {
    home = {
      username = "jona";
      homeDirectory = "/home/jona";
      stateVersion = "25.11";
    };
  }
] ++ self.lib.importNixFilesWithArgs inputs ./.
