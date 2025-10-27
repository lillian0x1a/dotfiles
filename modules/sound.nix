{lib, config, ...}:
with lib;
{
  options.my.sound.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable the Sound module.";
  };
  config = mkIf config.my.sound.enable {
    services = {
      pulseaudio.enable = false;
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
        wireplumber.enable = true;
      };
    };
  };
}