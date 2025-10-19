{specialArgs, inputs, ...}:{
  imports = [
    inputs.xremap.nixosModules.default
  ];
  services.xremap = {
    enable = true;
    serviceMode = "user";
    userName = "${specialArgs.username}";
    withWlroots = true;
    config = {
      modmap = [
        {
          name = "SandS";
          remap = {
            Space = { held = "Shift_L"; alone = "Space"; };
          };
        }
        {
          name = "General";
          remap = {
            CapsLock = { held = "Ctrl_L"; alone = "Esc"; };
          };
        }
      ];
      keymap = [
        {
          name = "common shortcuts";
          remap = { "C-h" = "Backspace"; };
        }
      ];
    };
  };
}