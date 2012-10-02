;;;
;;; not tested
;;;
;;;     dynamic-fonts-setup
;;;

;;; requires and setup

(when load-file-name
  (setq pcache-directory (expand-file-name "test_output/" (file-name-directory load-file-name)))
  (setq package-enable-at-startup nil)
  (setq package-load-list '((pcache t)
                            (persistent-soft t)
                            (font-utils t)))
  (when (fboundp 'package-initialize)
    (package-initialize)))

(require 'persistent-soft)
(require 'font-utils)
(require 'dynamic-fonts)

;;; dynamic-fonts-set-face

(ert-deftest dynamic-fonts-set-face-01 nil
  :tags '(:interactive)
  (should (equal "Courier"
                 (progn
                   (make-face 'unused-testing-face t)
                   (dynamic-fonts-set-face 'unused-testing-face '("Courier"))
                   (face-attribute 'unused-testing-face :family)))))


;;
;; Emacs
;;
;; Local Variables:
;; indent-tabs-mode: nil
;; mangle-whitespace: t
;; require-final-newline: t
;; coding: utf-8
;; byte-compile-warnings: (not cl-functions)
;; End:
;;

;;; dynamic-fonts-test.el ends here
