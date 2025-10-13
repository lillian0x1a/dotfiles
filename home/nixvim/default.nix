{ pkgs, ... }:{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    globals.mapleader = " ";
    opts = {
      number = true;         # 行番号を表示
      relativenumber = true; # 相対行番号を表示
      tabstop = 2;           # タブの幅
      shiftwidth = 2;        # インデントの幅
      expandtab = true;      # タブをスペースに変換
      smartindent = true;    # スマートインデント
    };
    keymaps = [
      {
        mode = ["n" "v"]; # ノーマルモードとビジュアルモードで有効
        key = ";";
        action = ":";
        options = {
          noremap = true; # 再帰的なマッピングを防ぐ（重要）
          silent = false;  # コマンドラインが表示されるのでsilentはfalseのまま
        };
      }
      {
        mode = ["n" "v"];
        key = ":";
        action = ";";
        options = {
          noremap = true;
          silent = true; # 検索を繰り返すだけなのでメッセージは不要
        };
      }
    ];
  };
}
