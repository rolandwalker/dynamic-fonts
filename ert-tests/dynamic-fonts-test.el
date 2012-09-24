;;;
;;; not tested
;;;
;;;     dynamic-fonts-setup
;;;

;;; requires and setup

(when load-file-name
  (setq pcache-directory (expand-file-name "pcache/" (file-name-directory load-file-name)))
  (setq package-enable-at-startup nil)
  (setq package-load-list '((pcache t)
                            (persistent-soft t)))
  (when (fboundp 'package-initialize)
    (package-initialize)))

(require 'persistent-soft)
(require 'dynamic-fonts)


;;; dynamic-fonts-font-name-from-xlfd

(ert-deftest dynamic-fonts-font-name-from-xlfd-01 nil
  (should (equal "Monaco"
                 (dynamic-fonts-font-name-from-xlfd
                  "-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1"))))

(ert-deftest dynamic-fonts-font-name-from-xlfd-02 nil
  (should (equal "Handwriting_-_Dakota"
                 (dynamic-fonts-font-name-from-xlfd
                  "-apple-Handwriting_-_Dakota-medium-normal-normal-*-12-*-*-*-p-0-iso10646-1"))))

(ert-deftest dynamic-fonts-font-name-from-xlfd-03 nil
  (should (equal "Monaco"
                 (dynamic-fonts-font-name-from-xlfd
                  "-apple-Monaco-bold-normal-normal-*-12-*-*-*-m-0-iso10646-1"))))

(ert-deftest dynamic-fonts-font-name-from-xlfd-04 nil
  (should (equal "Monaco"
                 (dynamic-fonts-font-name-from-xlfd
                  "-apple-Monaco-demi-bold-normal-normal-*-12-*-*-*-m-0-iso10646-1"))))


;;; dynamic-fonts-create-fuzzy-matches

(ert-deftest dynamic-fonts-create-fuzzy-matches-01 nil
  (should (equal '("Monaco")
                 (dynamic-fonts-create-fuzzy-matches "Monaco"))))

(ert-deftest dynamic-fonts-create-fuzzy-matches-02 nil
  (should (equal '("Monaco-12" "Monaco")
                 (dynamic-fonts-create-fuzzy-matches "Monaco-12"))))

(ert-deftest dynamic-fonts-create-fuzzy-matches-03 nil
  (should (equal '("Monaco-12")
                 (dynamic-fonts-create-fuzzy-matches "Monaco-12" 'keep-size))))

(ert-deftest dynamic-fonts-create-fuzzy-matches-04 nil
  (should (>= 7
              (length
               (dynamic-fonts-create-fuzzy-matches "DejaVu Sans Mono")))))


;;; dynamic-fonts-lenient-font-name-equal

(ert-deftest dynamic-fonts-lenient-font-name-equal-01 nil
  (should
   (dynamic-fonts-lenient-font-name-equal "DejaVu Sans Mono" "dejavusansmono")))

(ert-deftest dynamic-fonts-lenient-font-name-equal-02 nil
  (should
   (dynamic-fonts-lenient-font-name-equal "DejaVu Sans Mono" "DE-JA_VU_SANS-MONO")))

(ert-deftest dynamic-fonts-lenient-font-name-equal-03 nil
  (should-not
   (dynamic-fonts-lenient-font-name-equal "DejaVu Sans Mono" "DE-JA_VU_SANS-MON0")))


;;; dynamic-fonts-load-font-names

(ert-deftest dynamic-fonts-load-font-names-01 nil
  :tags '(:interactive)
  (should (hash-table-p
           (progn
             (dynamic-fonts-load-font-names 'progress 'regenerate)
             dynamic-fonts-font-names))))


;;; dynamic-fonts-list-font-names

(ert-deftest dynamic-fonts-list-font-names-01 nil
  :tags '(:interactive)
  (should (< 20
             (length (dynamic-fonts-list-font-names)))))

(ert-deftest dynamic-fonts-list-font-names-02 nil
  :tags '(:interactive)
  (should (member "Courier"
                  (dynamic-fonts-list-font-names))))

(ert-deftest dynamic-fonts-list-font-names-03 nil
  :tags '(:interactive)
  (should (member "Arial"
                  (dynamic-fonts-list-font-names))))


;;; dynamic-fonts-first-existing-font

(ert-deftest dynamic-fonts-first-existing-font-01 nil
  :tags '(:interactive)
  (should
   (dynamic-fonts-first-existing-font '("Courier" "Arial" "Monaco" "Consolas" "DejaVu Sans"))))


;;; dynamic-fonts-read-font-name

(ert-deftest dynamic-fonts-read-font-name-01 nil
  :tags '(:interactive)
  (should (equal "Courier"
                 (let ((cursor-in-echo-area t))
                   (read-char "Press a key, then enter \"Courier\" at the next prompt (with completions).")
                   (dynamic-fonts-read-font-name)))))

(ert-deftest dynamic-fonts-read-font-name-02 nil
  :tags '(:interactive)
  (should (equal "Courier"
                 (let ((cursor-in-echo-area t))
                   (read-char "Press a key, then enter \"Courier\" at the next prompt (with ido completions).")
                   (dynamic-fonts-read-font-name 'ido)))))


;;; dynamic-fonts-font-exists-p

(ert-deftest dynamic-fonts-font-exists-p-01 nil
  :tags '(:interactive)
  (should
   (dynamic-fonts-font-exists-p "Courier")))

(ert-deftest dynamic-fonts-font-exists-p-02 nil
  :tags '(:interactive)
  (should-not
   (dynamic-fonts-font-exists-p "__nonexistent-font__")))


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
