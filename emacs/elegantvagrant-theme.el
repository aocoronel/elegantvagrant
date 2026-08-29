;;; elegantvagrant-theme.el -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Augusto Coronel <aocoronel@proton.me>
;; Source: https://codeberg.org/aocoronel/elegantvagrant

(deftheme elegantvagrant "Elegant Purplish Theme")

(let* ((bg         "#010101")
       (base0      "#141414")
       (base1      "#161616")
       (base2      "#202020")
       (base3      "#585b70")
       (base4      "#6c7086")
       (base5      "#7f849c")
       (fg         "#e4e4ef")
       (red        "#f38ba8")
       (orange     "#fab387")
       (green      "#95FFA4")
       (egreen     "#02f789")
       (pink       "#f067fc")
       (teal       "#63F2F1")
       (blue       "#20dbfc")
       (dark-blue  "#74c7ec")
       (magenta    "#BD93f9")
       (violet     "#906CFF")
       (accent     "#7C5CFF")
       (cyan       "#51D3D5")
       (teal       "#94e2d5")
       (rosewater  "#f5e0dc")
       (flamingo   "#f2cdcd")
       (mauve      "#cba6f7")
       (maroon     "#eba0ac")
       (peach      "#fab387")
       (yellow     "#f9e2af")
       (green      "#a6e3a1")
       (sky        "#20dbfc")
       (sapphire   "#74c7ec")
       (blue       "#5ffcfc")
       (lavender   "#b4befe")
       (white      "#d9d9d9")

       (comment-bg      bg)
       (comments        maroon))

(custom-theme-set-faces
   'elegantvagrant

   ;; Basic UI
   `(default				((t (:foreground ,fg :background ,bg))))
   `(cursor					((t (:background ,accent))))
   `(fringe					((t (:background ,base1))))
   `(region					((t (:background ,base2))))
   `(highlight				((t (:foreground unspecified :background ,violet))))
   `(vertical-border		((t (:foreground ,base2))))
   `(minibuffer-prompt		((t (:foreground ,blue :weight bold))))
   `(match					((t (:foreground ,bg :background ,yellow))))
   `(link					((t (:foreground ,yellow :underline t))))
   `(link-visited			((t (:foreground ,cyan :underline t))))
   `(border					((t (:background ,bg :foreground ,base3))))
   `(shadow					((t (:foreground ,base3))))
   `(trailing-whitespace	((t (:foreground ,base3 :background ,red))))

   ;; Markdown
   `(markdown-markup-face             ((t (:foreground ,base5))))
   `(markdown-header-face             ((t (:inherit bold :foreground ,red))))
   `(markdown-code-face               ((t (:background ,nil))))
   `(markdown-inline-code-face        ((t (:background ,nil))))
   `(markdown-header-face             ((t (:inherit bold :foreground ,red))))
   `(markdown-header-face-1           ((t (:inherit bold :foreground ,blue))))
   `(markdown-header-face-2           ((t (:inherit bold :foreground ,orange))))
   `(markdown-header-face-3           ((t (:inherit bold :foreground ,green))))
   `(markdown-header-face-4           ((t (:inherit bold :foreground ,magenta))))
   `(markdown-header-face-5           ((t (:inherit bold :foreground ,yellow))))
   `(markdown-header-face-6           ((t (:inherit bold :foreground ,violet))))

   ;; Diff
   `(diff-removed	((t (:foreground ,red))))
   `(diff-added		((t (:foreground ,green))))

   ;; Compilation
   `(compilation-info			((t (:foreground ,green))))
   `(compilation-warning		((t (:foreground ,peach :bold t))))
   `(compilation-error			((t (:foreground ,red))))
   `(compilation-mode-line-fail ((t (:foreground ,red :weight bold))))
   `(compilation-mode-line-exit ((t (:foreground ,green :weight bold))))

   ;; Dired
   `(dired-directory ((t (:foreground ,accent :weight bold))))

   ;; Magit
   `(magit-branch			((t (:foreground ,fg))))
   `(magit-diff-hunk-header ((t (:background ,base1))))
   `(magit-item-highlight	((t (:background ,base2))))
   `(magit-tag				((t (:foreground ,yellow :background ,base0))))

   ;; Show Paren
   `(show-paren-match-face		((t (:background ,base3))))
   `(show-paren-mismatch-face	((t (:background ,maroon))))

   ;; tab-bar
   `(tab-bar				((t (:background ,base2 :foreground ,base3))))
   `(tab-bar-tab			((t (:background ,'unspecified :foreground ,yellow :weight bold))))
   `(tab-bar-tab-inactive	((t (:background ,'unspecified))))

   ;; Orderless
   `(orderless-match-face-0 ((t (:foreground ,yellow))))
   `(orderless-match-face-1 ((t (:foreground ,green))))
   `(orderless-match-face-2 ((t (:foreground ,peach))))
   `(orderless-match-face-3 ((t (:foreground ,sapphire))))

   ;; Flymake
   `(flymake-errline ((((supports :underline (:style wave)))
                       (:underline (:style wave :color ,red)))
                      (t (:foreground ,red :weight bold :underline t))))
   `(flymake-warnline ((((supports :underline (:style wave)))
                        (:underline (:style wave :color ,yellow)))
                       (t (:foreground ,yellow :weight bold :underline t))))
   `(flymake-infoline ((((supports :underline (:style wave)))
                        (:underline (:style wave :color ,green)))
                       (t (:foreground ,green :weight bold :underline t))))

   ;; Flyspell
   `(flyspell-incorrect ((((supports :underline (:style wave)))
                          (:underline (:style wave :color ,red)))
                         (t (:foreground ,red :weight bold :underline t))))
   `(flyspell-duplicate ((((supports :underline (:style wave)))
                          (:underline (:style wave :color ,yellow)))
                         (t (:foreground ,yellow :weight bold :underline t))))

   ;; Line numbers
   `(line-number                ((t (:foreground ,base2))))
   `(line-number-current-line   ((t (:foreground "#BAC9E4"))))
   `(hl-line                    ((t (:background ,base1))))
   `(current-line-highlight     ((t (:background ,base1))))

   ;; Mode-line
   `(mode-line          ((t (:background ,base0 :foreground unspecified
                                                       :box (:color ,base1)))))
   `(mode-line-inactive ((t (:background ,base1 :foreground ,base5
                                                       :box (:color ,base2)))))
   `(mode-line-emphasis ((t (:foreground ,violet))))

   ;; Font lock
   `(font-lock-comment-face           ((t (:background ,bg :foreground "#eba0ac"))))
   `(font-lock-doc-face               ((t (:foreground ,maroon :background ,base0))))
   `(font-lock-string-face            ((t (:foreground ,green))))
   `(font-lock-keyword-face           ((t (:foreground ,mauve))))
   `(font-lock-function-name-face     ((t (:foreground ,blue))))
   `(font-lock-variable-name-face     ((t (:foreground ,white))))
   `(font-lock-constant-face          ((t (:foreground ,yellow))))
   `(font-lock-type-face              ((t (:foreground ,yellow))))
   `(font-lock-builtin-face           ((t (:foreground ,mauve))))
   `(font-lock-warning-face           ((t (:foreground ,yellow))))

   `(secondary-selection		((t (:background ,base0))))
   `(tooltip					((t (:foreground ,fg :background ,base0))))
   `(css-proprietary-property   ((t (:foreground ,orange))))
   `(css-property               ((t (:foreground ,green))))
   `(css-selector               ((t (:foreground ,blue))))

   ;; Org-mode
   `(org-agenda-structure	((t (:foreground ,base5))))
   `(org-block				((t (:background ,base1))))
   `(org-block-begin-line   ((t (:background ,base1 :foreground ,comments))))
   `(org-column				((t (:background ,base2))))
   `(org-done				((t (:foreground ,green))))
   `(org-hide               ((t (:foreground ,bg))))
   `(org-link               ((t (:foreground ,orange :underline t :weight bold))))
   `(org-todo				((t (:foreground ,maroon))))
   `(org-upcoming-deadline	((t (:foreground ,yellow))))

   `(org-level-1 ((t :foreground ,"#F38BA8" :weight ultra-bold)))
   `(org-level-2 ((t :foreground ,"#F3B387" :weight extra-bold)))
   `(org-level-3 ((t :foreground ,"#A6E3A1" :weight bold)))
   `(org-level-4 ((t :foreground ,"#90E2D5" :weight semi-bold)))
   `(org-level-5 ((t :foreground ,"#A0BEFE" :weight normal)))
   `(org-level-6 ((t :foreground ,"#CBA6CB" :weight normal)))
   `(org-table   ((t :foreground ,"#BFAFDF")))

   ;; Ansi Terminal
   `(ansi-color-black          ((t (:foreground ,"#1c1f24"))))
   `(ansi-color-red            ((t (:foreground ,"#fc2025"))))
   `(ansi-color-green          ((t (:foreground ,"#02f789"))))
   `(ansi-color-yellow         ((t (:foreground ,"#f9fc5f"))))
   `(ansi-color-blue           ((t (:foreground ,"#5ffcfc"))))
   `(ansi-color-magenta        ((t (:foreground ,"#f067fc"))))
   `(ansi-color-cyan           ((t (:foreground ,"#00b29e"))))
   `(ansi-color-white          ((t (:foreground ,"#e9e2cb"))))
   `(ansi-color-bright-black   ((t (:foreground ,"#202020"))))
   `(ansi-color-bright-red     ((t (:foreground ,"#f4153b"))))
   `(ansi-color-bright-green   ((t (:foreground ,"#50ee84"))))
   `(ansi-color-bright-yellow  ((t (:foreground ,"#fcab20"))))
   `(ansi-color-bright-blue    ((t (:foreground ,"#20dbfc"))))
   `(ansi-color-bright-magenta ((t (:foreground ,"#c61b6e"))))
   `(ansi-color-bright-cyan    ((t (:foreground ,"#00b27f"))))
   `(ansi-color-bright-white   ((t (:foreground ,"#fcf4dc"))))

   `(whitespace-space       ((t (:foreground ,"#202020" :background , "#000000"))))
   `(whitespace-indentation ((t (:foreground ,"#202020" :background , "#202020"))))

))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'elegantvagrant)

;;; elegantvagrant-theme.el ends here
