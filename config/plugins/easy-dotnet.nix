{
  pkgs,
  lib,
  ...
}: let
  buildDotnetGlobalTool = pkgs.dotnetCorePackages.buildDotnetGlobalTool;
  easy-dotnet = buildDotnetGlobalTool {
    pname = "EasyDotnet";
    executables = ["dotnet-easydotnet"];
    version = "2.3.63";
    nugetHash = "sha256-8ywDdEWxDZUtggvY/2d4Revk09+qb3llymru0Ptpp5c=";

    meta = {
      description = "Easy Dotnet Server is the lightweight C# JSON-RPC server powering the easy-dotnet.nvim Neovim plugin";
      homepage = "https://github.com/GustavEikaas/easy-dotnet-server";
      license = lib.licenses.mit;
      platforms = lib.platforms.linux;
    };
  };

  allSdks = with pkgs.dotnetCorePackages; combinePackages [sdk_9_0 sdk_10_0];
in {
  extraPackages = with pkgs; [netcoredbg allSdks dotnet-ef easy-dotnet roslyn-ls];
  plugins.easy-dotnet.enable = true;
}
