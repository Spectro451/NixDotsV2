{ pkgs, ... }:
{
  imports = [
    ./alias.nix
    ./maps.nix
  ];
  programs.ranger = {
    enable = true;

    settings = {
      viewmode = "miller";
      column_ratios = "1,3,4";
      hidden_filter = ''
        ^\.|\.(?:pyc|pyo|bak|swp)$|^lost\+found$|^__(py)?cache__$
      '';
      show_hidden = true;
      confirm_on_delete = "multiple";
      preview_script = "${pkgs.ranger}/share/doc/ranger/config/scope.sh";
      use_preview_script = true;
      automatically_count_files = true;
      preview_images = true;
      preview_images_method = "kitty";
      colorscheme = "jungle";
      draw_borders = "both";
    };

    extraConfig = ''
      # copymap
      copymap q ZZ ZQ
      copymap J <C-D>
      copymap K <C-U>
      copymap zf zz
      copymap m<bg>  um<bg> `<bg> '<bg>

      # cmap
      cmap <up>    eval fm.ui.console.history_move(-1)
      cmap <down>  eval fm.ui.console.history_move(1)
      cmap <left>  eval fm.ui.console.move(left=1)
      cmap <right> eval fm.ui.console.move(right=1)
      cmap <home>  eval fm.ui.console.move(right=0, absolute=True)
      cmap <end>   eval fm.ui.console.move(right=-1, absolute=True)
      cmap <a-b>   eval fm.ui.console.move_word(left=1)
      cmap <a-f>   eval fm.ui.console.move_word(right=1)
      cmap <tab>   eval fm.ui.console.tab()
      cmap <s-tab> eval fm.ui.console.tab(-1)
      cmap <ESC>   eval fm.ui.console.close()
      cmap <CR>    eval fm.ui.console.execute()
      cmap <C-l>   redraw_window
      cmap <backspace>  eval fm.ui.console.delete(-1)
      cmap <delete>     eval fm.ui.console.delete(0)
      cmap <C-w>        eval fm.ui.console.delete_word()
      cmap <A-d>        eval fm.ui.console.delete_word(backward=False)
      cmap <C-k>        eval fm.ui.console.delete_rest(1)
      cmap <C-u>        eval fm.ui.console.delete_rest(-1)
      cmap <C-y>        eval fm.ui.console.paste()
      cmap <allow_quantifiers> false
      copycmap <ESC>       <C-g>
      copycmap <up>        <C-p>
      copycmap <down>      <C-n>
      copycmap <left>      <C-b>
      copycmap <right>     <C-f>
      copycmap <home>      <C-a>
      copycmap <end>       <C-e>
      copycmap <delete>    <C-d>
      copycmap <backspace> <C-h>
      copycmap <ESC> <C-c>
      copycmap <CR>  <C-j>
      copycmap <a-b> <a-left>
      copycmap <a-f> <a-right>
      copycmap <backspace> <backspace2>

      # pmap
      pmap <down>      pager_move  down=1
      pmap <up>        pager_move  up=1
      pmap <left>      pager_move  left=4
      pmap <right>     pager_move  right=4
      pmap <home>      pager_move  to=0
      pmap <end>       pager_move  to=-1
      pmap <pagedown>  pager_move  down=1.0  pages=True
      pmap <pageup>    pager_move  up=1.0    pages=True
      pmap <C-d>       pager_move  down=0.5  pages=True
      pmap <C-u>       pager_move  up=0.5    pages=True
      pmap <C-l> redraw_window
      pmap <ESC> pager_close
      pmap E     edit_file
      copypmap <ESC> q Q i <F3>
      copypmap <UP>       k  <C-p>
      copypmap <DOWN>     j  <C-n> <CR>
      copypmap <LEFT>     h
      copypmap <RIGHT>    l
      copypmap <HOME>     g
      copypmap <END>      G
      copypmap <C-d>      d
      copypmap <C-u>      u
      copypmap <PAGEDOWN> n  f  <C-F>  <Space>
      copypmap <PAGEUP>   p  b  <C-B>

      # tmap
      tmap <up>        taskview_move up=1
      tmap <down>      taskview_move down=1
      tmap <home>      taskview_move to=0
      tmap <end>       taskview_move to=-1
      tmap <pagedown>  taskview_move down=1.0  pages=True
      tmap <pageup>    taskview_move up=1.0    pages=True
      tmap <C-d>       taskview_move down=0.5  pages=True
      tmap <C-u>       taskview_move up=0.5    pages=True
      tmap J           eval -q fm.ui.taskview.task_move(-1)
      tmap K           eval -q fm.ui.taskview.task_move(0)
      tmap dd          eval -q fm.ui.taskview.task_remove()
      tmap <pagedown>  eval -q fm.ui.taskview.task_move(-1)
      tmap <pageup>    eval -q fm.ui.taskview.task_move(0)
      tmap <delete>    eval -q fm.ui.taskview.task_remove()
      tmap <C-l> redraw_window
      tmap <ESC> taskview_close
      copytmap <UP>       k  <C-p>
      copytmap <DOWN>     j  <C-n> <CR>
      copytmap <HOME>     g
      copytmap <END>      G
      copytmap <C-u>      u
      copytmap <PAGEDOWN> n  f  <C-F>  <Space>
      copytmap <PAGEUP>   p  b  <C-B>
      copytmap <ESC> q Q w <C-c>

      # eval
      eval for arg in "rwxXst": cmd("map +u{0} shell -f chmod u+{0} %s".format(arg))
      eval for arg in "rwxXst": cmd("map +g{0} shell -f chmod g+{0} %s".format(arg))
      eval for arg in "rwxXst": cmd("map +o{0} shell -f chmod o+{0} %s".format(arg))
      eval for arg in "rwxXst": cmd("map +a{0} shell -f chmod a+{0} %s".format(arg))
      eval for arg in "rwxXst": cmd("map +{0}  shell -f chmod u+{0} %s".format(arg))
      eval for arg in "rwxXst": cmd("map -u{0} shell -f chmod u-{0} %s".format(arg))
      eval for arg in "rwxXst": cmd("map -g{0} shell -f chmod g-{0} %s".format(arg))
      eval for arg in "rwxXst": cmd("map -o{0} shell -f chmod o-{0} %s".format(arg))
      eval for arg in "rwxXst": cmd("map -a{0} shell -f chmod a-{0} %s".format(arg))
      eval for arg in "rwxXst": cmd("map -{0}  shell -f chmod u-{0} %s".format(arg))
    '';
  };
}
