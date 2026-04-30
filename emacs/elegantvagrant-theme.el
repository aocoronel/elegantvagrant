;;; elegantvagrant-theme.el -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Augusto Coronel <aocoronel@proton.me>
;; Source: https://codeberg.org/aocoronel/elegantvagrant

(deftheme elegantvagrant "Elegant Purplish Theme")

(defun elegantvagrant-orgmode ()
  (interactive)
  (let ((default-font (font-spec :family elegantvagrant-font :size 14)))
    (dolist (face
             '((org-level-1 1.3 "#F38BA8" ultra-bold)
               (org-level-2 1.3 "#F3B387" extra-bold)
               (org-level-3 1.3 "#A6E3A1" bold)
               (org-level-4 1.3 "#90E2D5" semi-bold)
               (org-level-5 1.3 "#A0BEFE" normal)
               (org-level-6 1.3 "#cba6cb" normal)
               (org-level-7 1.3 "#46d9ff" normal)
               (org-level-8 1.3 "#ff6c6b" normal)))
      (set-face-attribute (nth 0 face) 'unspecified
                          :font (font-spec :family elegantvagrant-variable-pitch-font
                                         :size (round (* 14 (nth 1 face))))
                          :weight (nth 3 face)
                          :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil
                        :font default-font
                        :weight 'normal
                        :height 1.0
                        :foreground "#bfafdf")))

(let* ((bg         "#000000")
       (bg-alt     "#121212")
       (base0      "#141414")
       (base1      "#161616")
       (base2      "#202020")
       (base3      "#585b70")
       (base4      "#6c7086")
       (base5      "#7f849c")
       (base6      "#9399b2")
       (base7      "#a6adc8")
       (base8      "#bac2de")
       (fg-alt     "#BAC9E4")
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
   `(default                          ((t (:foreground ,fg :background ,bg))))
   `(cursor                           ((t (:background ,accent))))
   `(fringe                           ((t (:background ,base1))))
   `(region                           ((t (:background ,base2))))
   `(highlight                        ((t (:foreground unspecified :background ,violet))))
   `(vertical-border                  ((t (:foreground ,base2))))
   `(minibuffer-prompt                ((t (:foreground ,blue :weight bold))))

   `(match ((t (:foreground ,bg :background ,yellow))))
   `(link ((t (:foreground ,yellow :underline t))))
   `(link-visited ((t (:foreground ,cyan :underline t))))

   `(border ((t (:background ,bg :foreground ,base3))))
   `(shadow ((t (:foreground ,base3))))
   `(trailing-whitespace ((t (:foreground ,base3 :background ,red))))

    ;; Markdown - Different colors per heading level
   `(markdown-markup-face             ((t (:foreground ,base5))))
   `(markdown-code-face               ((t (:background ,base3))))

   `(markdown-header-face             ((t (:inherit bold :foreground ,red))))
   `(markdown-header-face-1           ((t (:inherit bold :foreground ,blue))))
   `(markdown-header-face-2           ((t (:inherit bold :foreground ,orange))))
   `(markdown-header-face-3           ((t (:inherit bold :foreground ,green))))
   `(markdown-header-face-4           ((t (:inherit bold :foreground ,magenta))))
   `(markdown-header-face-5           ((t (:inherit bold :foreground ,yellow))))
   `(markdown-header-face-6           ((t (:inherit bold :foreground ,violet))))

   ;; Org-mode
   `(org-block ((t (:background ,base1))))
   `(org-block-begin-line ((t (:background ,base1 :foreground ,violet))))
   `(org-hide ((t (:foreground ,base4))))
   `(org-link ((t (:foreground ,orange :underline t :weight bold))))

   ;; Org Mode
   `(org-agenda-structure ((t (:foreground ,base5))))
   `(org-column ((t (:background ,base2))))
   `(org-done ((t (:foreground ,green))))
   `(org-todo ((t (:foreground ,maroon))))
   `(org-upcoming-deadline ((t (:foreground ,yellow))))

   ;; Diff
   `(diff-removed ((t (:foreground ,red))))
   `(diff-added ((t (:foreground ,green))))

   ;; Compilation
   `(compilation-info ((t (:foreground ,green))))
   `(compilation-warning ((t (:foreground ,peach :bold t))))
   `(compilation-error ((t (:foreground ,red))))
   `(compilation-mode-line-fail ((t (:foreground ,red :weight bold))))
   `(compilation-mode-line-exit ((t (:foreground ,green :weight bold))))

   ;; Dired
   `(dired-directory ((t (:foreground ,accent :weight bold))))

   ;; Magit
   `(magit-branch ((t (:foreground ,fg))))
   `(magit-diff-hunk-header ((t (:background ,base1))))
   `(magit-item-highlight ((t (:background ,base2))))
   `(magit-tag ((t (:foreground ,yellow :background ,base0))))

   ;; Show Paren
   `(show-paren-match-face ((t (:background ,base3))))
   `(show-paren-mismatch-face ((t (:background ,maroon))))

   ;; tab-bar
   `(tab-bar ((t (:background ,base2 :foreground ,base3))))
   `(tab-bar-tab ((t (:background ,'unspecified :foreground ,yellow :weight bold))))
   `(tab-bar-tab-inactive ((t (:background ,'unspecified))))

   ;; Company
   `(company-tooltip ((t (:foreground ,fg :background ,base2))))
   `(company-tooltip-selection ((t (:foreground ,fg :background ,base1))))
   `(company-tooltip-annotation ((t (:foreground ,peach))))

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
   `(line-number                      ((t (:foreground ,base2))))
   `(line-number-current-line         ((t (:foreground "#BAC9E4"))))
   `(hl-line                            ((t (:background ,base1))))
   `(current-line-highlight             ((t (:background ,base1))))

   ;; Mode-line
   `(mode-line                        ((t (:background ,base0 :foreground unspecified
                                                       :box (:color ,base1)))))
   `(mode-line-inactive               ((t (:background ,base1 :foreground ,base5
                                                       :box (:color ,base2)))))
   `(mode-line-emphasis               ((t (:foreground ,violet))))

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

   ;; Secondary selection
   `(secondary-selection              ((t (:background ,base0))))

   ;; Tooltip
   `(tooltip                          ((t (:foreground ,fg :background ,base0))))

   ;; CSS
   `(css-proprietary-property         ((t (:foreground ,orange))))
   `(css-property                     ((t (:foreground ,green))))
   `(css-selector                     ((t (:foreground ,blue))))

   ;; Doom modeline (fallback styling)
   `(doom-modeline-bar                ((t (:background ,violet))))

   ;; Elscreen
   `(elscreen-tab-other-screen-face   ((t (:background "#353a42" :foreground "#1e2022"))))

   ;; Markdown
   `(markdown-markup-face             ((t (:foreground ,base5))))
   `(markdown-header-face             ((t (:inherit bold :foreground ,red))))
   `(markdown-code-face               ((t nil)))

   ;; Org
   `(org-block                        ((t (:background ,base1))))
   `(org-block-begin-line             ((t (:background ,base1 :foreground ,comments))))
   `(org-hide                         ((t (:foreground ,bg))))
   `(org-link                         ((t (:foreground ,orange :underline t :weight bold))))

   ;; VTerm
   `(vterm-color-black          ((t (:foreground ,"#1c1f24"))))
   `(vterm-color-red            ((t (:foreground ,"#fc2025"))))
   `(vterm-color-green          ((t (:foreground ,"#02f789"))))
   `(vterm-color-yellow         ((t (:foreground ,"#f9fc5f"))))
   `(vterm-color-blue           ((t (:foreground ,"#5ffcfc"))))
   `(vterm-color-magenta        ((t (:foreground ,"#f067fc"))))
   `(vterm-color-cyan           ((t (:foreground ,"#00b29e"))))
   `(vterm-color-white          ((t (:foreground ,"#e9e2cb"))))
   `(vterm-color-bright-black   ((t (:foreground ,"#202020"))))
   `(vterm-color-bright-red     ((t (:foreground ,"#f4153b"))))
   `(vterm-color-bright-green   ((t (:foreground ,"#50ee84"))))
   `(vterm-color-bright-yellow  ((t (:foreground ,"#fcab20"))))
   `(vterm-color-bright-blue    ((t (:foreground ,"#20dbfc"))))
   `(vterm-color-bright-magenta ((t (:foreground ,"#c61b6e"))))
   `(vterm-color-bright-cyan    ((t (:foreground ,"#00b27f"))))
   `(vterm-color-bright-white   ((t (:foreground ,"#fcf4dc"))))

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
