;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     emacs-lisp
     helm
     (multiple-cursors :variables
                       multiple-cursors-backend 'mc
                       )
     (treemacs :variables
               treemacs-lock-width t
               treemacs-use-git-mode 'deferred
               )
     (syntax-checking :variables
                      syntax-checking-use-original-bitmaps t
                      )
     (better-defaults :variables
                      better-defaults-move-to-end-of-code-first t
                      )
     (auto-completion :variables
                      auto-completion-return-key-behavior 'nil
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-complete-with-key-sequence '"jk"
                      auto-completion-complete-with-key-sequence-delay 0.2
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-idle-delay 0.1
                      auto-completion-use-company-box t
                      )
     (python :variables
             ;;python-backend 'anaconda
             python-backend 'lsp
             python-lsp-server 'pyls
             python-formatter 'lsp
             ;;python-format-on-save t
             ;;python-sort-imports-on-save t
             python-fill-column 88
             )
     restclient
     (sql :variables
          sql-capitalize-keywords t
          )
     (c-c++ :variables
            c-c++-backend 'lsp-clangd
            c++-enable-organize-includes-on-save t
            c-c++-enable-clang-format-on-save t
          )
     csv
     prettier
     (html :variables
           web-fmt-tool 'prettier
           )
     (json :variables
           json-fmt-tool 'prettier
           json-fmt-on-save t
           )
     (lsp :variables
          lsp-remap-xref-keybindings t
          )
     import-js
     (javascript :variables
                 node-add-modules-path t
                 javascript-import-tool 'import-js
                 javascript-backend 'lsp
                 javascript-fmt-tool 'prettier
                 javascript-fmt-on-save t
                 )
     react
     (version-control :variables
                      version-control-diff-tool 'git-gutter
                      version-control-diff-side 'left
                      )
     slack ;; TODO: ayarla
     shell-scripts
     spotify
     themes-megapack
     xkcd
     ipython-notebook
     ;;templates
     epub
     (elfeed :variables
             elfeed-feeds '(("https://www.reddit.com/r/emacs/.rss" emacs subreddit)
                            ("https://ytuce.maliayas.com/?type=rss" ytü bm haberleri))
             )
     pdf
     (org :variables
          org-projectile-file "TODOs.org"
          org-enable-reveal-js-support t
          org-enable-bootstrap-support t
          )
     latex
     (shell :variables
            shell-default-shell 'vterm
            )
     (spell-checking :variables
                     spell-checking-enable-by-default nil
                     enable-flyspell-auto-completion t
                     )
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages
   '(
     turkish
     beacon
     deadgrep
     magit-todos
     wttrin
     hardcore-mode
     ace-mc
     w3m
     eglot
     zoom
     key-chord
     )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages
   '(
     vi-tilde-fringe
     )

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 20)
                                (projects . 10)
                                (todos . 10))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-spacegrey
                         spacemacs-dark)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(doom)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.3

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs t))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  ;; Maximize edince ekranı tam kapatmama sorununun çözümü
  (setq frame-resize-pixelwise t)

  ;; Satıra sığmayan yazıyı alt satırda göstermek yerine kes
  (set-default 'truncate-lines t)

  ;; Indentations
  (setq-default
   js2-basic-offset 2
   js-indent-level 2
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)

  ;; Lsp-linter semicolon warning fix
  (setq js2-strict-missing-semi-warning nil)

  ;; Indentation guides
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-responsive 'top)

  ;; Beacon color.
  ;; Why #D18770 not #D08770? (#D08770 is my cursor color)
  ;; Because when cursor color and beacon color are same, cursor become white
  ;; when beacon blink
  (setq-default beacon-color "#D18770")

  ;; Frame title (file name and major mode)
  (setq-default frame-title-format '("%b [%m]"))

  ;; Do not create lockfiles
  (setq create-lockfiles nil)

  ;; Google translate languages
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "tr")

  ;; Flycheck setting for python
  (setq-default flycheck-flake8-maximum-line-length 88)

  ;; Modeline settings
  ;;(setq spaceline-all-the-icons-eyebrowse-workspace-p nil)
  ;;(setq spaceline-all-the-icons-buffer-size-p nil)
  ;;(setq spaceline-all-the-icons-modified-p nil)
  ;;(setq spaceline-all-the-icons-hud-p nil)
  ;;(setq spaceline-all-the-icons-window-number-always-visible t)
  ;;(setq spaceline-all-the-icons-clock-always-visible nil)
  ;;(setq doom-modeline-buffer-file-name-style 'relative-from-project)
  (setq doom-modeline-buffer-encoding nil)
  (setq doom-modeline-vcs-max-length 20)
  (setq doom-modeline-icon t) ;; It should be declared explicitly when using
                              ;; emacs as a deamon

  ;; wttr.in
  (setq wttrin-default-cities '("Istanbul"))

  ;; Spell Checking
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "tr_TR")

  ;; Flycheck delay
  (setq flycheck-idle-change-delay 5)

  ;; Expand-region subword support
  (setq expand-region-subword-enabled t)

  ;; Recenter positions values (C-l)
  (setq recenter-positions '(middle 0.2 top 0.8 bottom))

  ;; Window numbering by frame (not global)
  (setq winum-scope 'frame-local)

  ;; Exclude tmp and .emacs.d directories from recentf
  (setq recentf-exclude '("/\\.emacs\\.d/" "^/tmp/"))

  ;; Improve dired (h for human readable file sizes, p for adding slash at the
  ;; end of directories, v for vendetta)
  (setq dired-listing-switches "-lhpa")

  ;; Dotnet prefix key
  (setq dotnet-mode-keymap-prefix (kbd "C-c C-c"))

  ;; Beacon blink on vertical movement (avy için ayarladım)
  (setq beacon-blink-when-point-moves-vertically 10)

  ;; Company show single candidate to get doc
  (setq company-box-show-single-candidate t)
  ;; Company align annotations right
  (setq company-tooltip-align-annotations t)

  ;; Decrease key-chord delay to not execute functions accidently
  (setq key-chord-two-keys-delay 0.05)

  ;; Disable expand-region hydra (e to edit etc.)
  (setq expand-region-fast-keys-enabled t)

  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; Burn the evil!
  (evil-mode -1)

  ;; Genişleterek tara
  (global-set-key (kbd "C-t") 'er/expand-region)

  ;; Kill ringi göster
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)

  ;; Projetile'ı git reposundan aç
  (global-set-key (kbd "C-x f") 'helm-projectile)

  ;; Yazı tarayıp başka bir şey yazınca taranmış yazıyı sil
  (delete-selection-mode 1)

  ;; Yeni açılan windowa direk geçiş yap
  (global-set-key (kbd "C-x 2") 'split-window-below-and-focus)
  (global-set-key (kbd "C-x 3") 'split-window-right-and-focus)

  ;; emmet-mode (web mode icinde bir minor) icin editlebilir noktalarda ilerleme
  ;; (with-eval-after-load 'emmet-mode
  ;;   (local-set-key (kbd "M-n") 'emmet-next-edit-point)
  ;;   (local-set-key (kbd "M-p") 'emmet-prev-edit-point)
  ;;   )

  ;; Company mode'u globalde çalıştır
  (global-company-mode)

  ;; Yasnippet prefix for which-key
  (spacemacs/declare-prefix "y" "yasnippet")

  ;; Expand snippets
  (global-set-key (kbd "M-m y e") 'yas-expand)
  (bind-key* "C-j" 'yas-expand)
  ;; Helm search snippets
  (global-set-key (kbd "M-m y h") 'spacemacs/helm-yas)

  ;; Other window
  (global-set-key (kbd "M-o") 'other-window)

  ;; Enable highlight indentation guides in prog modes
  ;; (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  ;; (add-hook 'prog-mode-hook 'highlight-indent-guides-auto-set-faces)
  (add-hook 'prog-mode-hook 'highlight-indentation-mode)

  ;; Scroll up/down rate
  (global-set-key (kbd "C-v") (lambda () (interactive) (scroll-up-command 15)))
  (global-set-key (kbd "M-v") (lambda () (interactive) (scroll-down-command 15)))

  ;; Move cursor by camelCase
  (global-subword-mode 1)

  ;; Jump word
  (bind-key* "M-j" 'avy-goto-word-or-subword-1)
  ;; Jump line
  (global-set-key (kbd "M-l") 'avy-goto-line)
  ;; Go back from jump
  (global-set-key (kbd "C-M-u") 'avy-pop-mark)

  ;; Beacon Mode
  (beacon-mode 1)

  ;; Jump to definition
  (bind-key* "M-." 'spacemacs/jump-to-definition)
  (bind-key* "M-r" 'xref-find-references)
  ;; Pop marker back (return back from definition)
  (global-set-key (kbd "M-ç") 'xref-pop-marker-stack)

  ;; Switch window (ace-window)
  (global-set-key (kbd "M-m w w") 'ace-window)
  ;; Swap window
  (global-set-key (kbd "M-m w s") 'ace-swap-window)

  ;; Multiple cursors next
  (global-set-key (kbd "C-M-n") 'mc/mark-next-like-this)
  ;; Multiple cursors previous
  (global-set-key (kbd "C-M-p") 'mc/mark-previous-like-this)
  ;; Multiple cursors skip next
  (global-set-key (kbd "C-M-S-n") 'mc/skip-to-next-like-this)
  ;; Multiple cursors skip previous
  (global-set-key (kbd "C-M-S-p") 'mc/skip-to-previous-like-this)
  ;; Multiple cursors unmark last
  (global-set-key (kbd "C-S-n") 'mc/unmark-previous-like-this)
  ;; Multiple cursors unmark first
  (global-set-key (kbd "C-S-p") 'mc/unmark-next-like-this)
  ;; Multiple cursors add cursor on click
  (global-set-key (kbd "C-M-<mouse-1>") 'mc/add-cursor-on-click)
  ;;Multiple cursors hide unmatched lines ;; TODO: make unoverridable
  ;;(with-eval-after-load 'multiple-cursors
  ;;  (bind-key* "C-c C-c" 'mc-hide-unmatched-lines-mode)
  ;; )

  ;; Winner-undo
  (global-set-key (kbd "M-u") 'winner-undo)
  ;; Winner-redo
  (global-set-key (kbd "M-U") 'winner-redo)

  ;; Undo
  (global-set-key (kbd "C-u") 'undo-tree-undo)
  ;; Redo
  (global-set-key (kbd "C-S-u") 'undo-tree-redo)

  ;; Company helm
  (with-eval-after-load 'company ;; TODO: C-h yap ve çakışmasın.
    (define-key company-mode-map (kbd "C-.") 'helm-company)
    )

  ;; Move cursor center, top, bottom
  (global-set-key (kbd "C-M-l") 'move-to-window-line-top-bottom)

  ;; Magit & magit todos
  (global-set-key (kbd "M-m g s") 'magit-status)
  (defun helm-magit-todos-without-magit-status ()
    (interactive)
    (magit-status)
    (bury-buffer)
    (winner-undo)
    (helm-magit-todos)
    )
  (global-set-key (kbd "M-m g t") 'helm-magit-todos-without-magit-status)
  ;;(with-eval-after-load 'magit
  ;;  (magit-todos-mode t)
  ;;  (magit-todos-branch-list-toggle)
  ;;  (global-set-key (kbd "M-m g t") 'helm-magit-todos)
  ;;  )

  (defun c++-run ()
    "C++ run like `python-shell-send-buffer'"
    (interactive)
    (if (eq (get-buffer-window "*eshell*") nil)
        (progn (split-window-right-and-focus)
               (eshell)
               (other-window -1))
      )
    (with-selected-window (get-buffer-window "*eshell*")
      (eshell-return-to-prompt)
      (insert "make -B -s")
      (eshell-send-input)
      )
    )

  (with-eval-after-load 'cc-mode
    (bind-key "C-c C-c" 'c++-run c++-mode-map)
    (bind-key "C-c C-c" 'c++-run c-mode-map)
    )

  ;; Modeline responsive buffer-file-name-style
  (add-hook
   'window-configuration-change-hook
   (lambda ()
     (interactive)
     (if (> (count-windows) 1)
          (setq doom-modeline-buffer-file-name-style 'truncate-except-project)
        (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
        )))

  ;; Initialize snippets
  (load "yasnippet-snippets")

  ;; Unbind eshell/clear
  (add-hook 'eshell-mode-hook (local-unset-key (kbd "C-l")))

  ;; Search symbol at point
  (global-set-key (kbd "M-s") 'isearch-forward-symbol-at-point)

  ;; Use shell-like backspace C-h, rebind help to C-?
  (define-key key-translation-map [?\C-h] [?\C-?])
  (bind-key* (kbd "C-?") 'help-command)

  ;; Helm swoop as an alternative to isearch
  (bind-key* (kbd "C-M-s") 'spacemacs/helm-swoop-region-or-symbol)
  (with-eval-after-load 'helm-swoop
    ;; Keybindings like helm-ag-edit-mode
    (define-key helm-swoop-edit-map (kbd "C-c C-c") 'helm-swoop--edit-complete)
    (define-key helm-swoop-edit-map (kbd "C-c C-k") 'helm-swoop--edit-cancel)
    ;; Move up and down like isearch
    (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
    (define-key helm-swoop-map (kbd "C-s") 'helm-next-line))

  ;; Disable arrow keys, enter, backspace to get used to emacs keybindings
  (global-hardcore-mode)

  ;; Shell settings
  (bind-key* (kbd "M-t") 'spacemacs/default-pop-shell)
  (with-eval-after-load 'vterm
    (define-key vterm-mode-map (kbd "C-c C-e") 'vterm-copy-mode)
    (define-key vterm-copy-mode-map (kbd "C-c C-e") 'vterm-copy-mode)
    )

  (with-eval-after-load 'org
    ;; Edit source code blocks with more familiar keybinding "C-c C-e""
    (define-key org-mode-map (kbd "C-c C-e") 'org-edit-special)
    ;; Run source code blocks without asking
    (setq org-confirm-babel-evaluate nil)
    )

  (key-chord-define-global "gb" 'beginning-of-buffer)
  (key-chord-define-global "kb" 'kill-current-buffer)
  (key-chord-define-global "lb" 'helm-buffers-list)

  (key-chord-mode 1)

  ;; Next/Previous line by 5
  (global-set-key (kbd "M-p") (lambda () (interactive) (previous-line 5)))
  (global-set-key (kbd "M-n") (lambda () (interactive) (next-line 5)))

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   (quote
    ("6cbf6003e137485fb3f904e76fb15bc48abc386540f43f54e2a47a9884e679f6" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "728eda145ad16686d4bbb8e50d540563573592013b10c3e2defc493f390f7d83" "7d56fb712ad356e2dacb43af7ec255c761a590e1182fe0537e1ec824b7897357" "2d1fe7c9007a5b76cea4395b0fc664d0c1cfd34bb4f1860300347cdad67fb2f9" "8d805143f2c71cfad5207155234089729bb742a1cb67b7f60357fdd952044315" "d6f04b6c269500d8a38f3fabadc1caa3c8fdf46e7e63ee15605af75a09d5441e" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(helm-completion-style (quote emacs))
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (w3m dap-mode bui tree-mode ace-mc flyspell-popup flyspell-correct-helm flyspell-correct auto-dictionary helm-rg yatemplate rjsx-mode import-js grizzl web-mode tagedit slim-mode scss-mode sass-mode pug-mode impatient-mode htmlize helm-css-scss haml-mode emmet-mode company-web web-completion-data web-beautify prettier-js nodejs-repl livid-mode skewer-mode simple-httpd json-navigator hierarchy json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern tern csv-mode sqlup-mode beacon yasnippet-snippets yapfify ws-butler writeroom-mode winum which-key volatile-highlights uuidgen use-package unfill turkish treemacs-projectile toc-org symon symbol-overlay string-inflection spaceline-all-the-icons restclient-helm restart-emacs request rainbow-delimiters pytest pyenv-mode py-isort popwin pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer org-plus-contrib org-bullets open-junk-file ob-restclient ob-http nameless mwim move-text macrostep lorem-ipsum live-py-mode link-hint indent-guide importmagic hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation highlight-indent-guides helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio fuzzy font-lock+ flycheck-pos-tip flycheck-package flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu elisp-slime-nav editorconfig dumb-jump dotenv-mode doom-modeline diminish devdocs define-word cython-mode company-statistics company-restclient company-quickhelp company-anaconda column-enforce-mode clean-aindent-mode centered-cursor-mode blacken auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(ahs-definition-face ((t (:underline t :weight bold :background nil :foreground nil))))
 '(ahs-face ((t (:underline t :weight bold :background nil :foreground nil))))
 '(ahs-plugin-whole-buffer-face ((t (:underline t :weight bold :background nil :foreground nil))))
 '(company-template-field ((t (:inherit region))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(doom-modeline-buffer-path ((t (:inherit (bold font-lock-comment-face)))))
 '(font-lock-function-name-face ((t (:foreground "LightGoldenrod1"))))
 '(font-lock-string-face ((t (:foreground "PeachPuff3"))))
 '(git-gutter-fr:added ((t (:foreground "green4" :background "green4"))))
 '(git-gutter-fr:deleted ((t (:foreground "red4" :background "red4"))))
 '(git-gutter-fr:modified ((t (:foreground "purple3" :background "purple3"))))
 '(highlight-indentation-face ((t (:inherit nil :background "#2f343f"))))
 '(lsp-face-highlight-read ((t (:underline t :weight bold :background nil :foreground nil))))
 '(lsp-face-highlight-textual ((t (:underline t :weight bold :background nil :foreground nil))))
 '(lsp-face-highlight-write ((t (:underline t :weight bold :background nil :foreground nil))))
 '(mode-line ((t (:background "#262b35"))))
 '(sp-show-pair-match-face ((t (:background nil))))
 '(yas-field-highlight-face ((t (:inherit region)))))
)
