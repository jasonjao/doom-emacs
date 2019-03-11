;;; ui/indent-guides/config.el -*- lexical-binding: t; -*-

(def-package! highlight-indent-guides
  :hook ((prog-mode text-mode conf-mode) . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-responsive 'top)

  ;; Don't display first level of indentation
  (defun +indent-guides-for-all-but-first-column (level responsive display)
    (unless (< level 1)
      (highlight-indent-guides--highlighter-default level responsive display)))
  (setq highlight-indent-guides-highlighter-function #'+indent-guides-for-all-but-first-column))