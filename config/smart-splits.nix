{
  plugins.smart-splits = {
    enable = true;
    settings = {
      multiplexer_integration = "zellij";
      disable_multiplexer_nav_when_zoomed = false;
    };
  };

  keymaps = [
    # Resizing windows with Alt+hjkl
    {
      mode = "n";
      key = "<Left>";
      action.__raw = "require('smart-splits').resize_left";
      options = {
        silent = true;
        desc = "Resize window left";
      };
    }
    {
      mode = "n";
      key = "<Down>";
      action.__raw = "require('smart-splits').resize_down";
      options = {
        silent = true;
        desc = "Resize window down";
      };
    }
    {
      mode = "n";
      key = "<Up>";
      action.__raw = "require('smart-splits').resize_up";
      options = {
        silent = true;
        desc = "Resize window up";
      };
    }
    {
      mode = "n";
      key = "<Right>";
      action.__raw = "require('smart-splits').resize_right";
      options = {
        silent = true;
        desc = "Resize window right";
      };
    }
  ];
}
