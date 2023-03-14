(define-module (demo packages hollow)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages texinfo)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages))

 (package
	(name "hollow")
	(version "1")
	(source
	(origin
	(method git-fetch)
	(uri (git-reference
	     (url "https://github.com/m4lin/hollow")
	     (commit version)))
	(file-name (git-file-name name version))
	(sha256
	(base32 "02i0wrdxn1fnpabpns4sznk3h8zck14gk6zingv02nfpaa5dlw1j"))))
	(build-system gnu-build-system)
	(inputs
	(list libx11))
	(arguments
	`(#:tests? #f                      ;no tests
	#:phases
	(modify-phases %standard-phases
	 (delete 'configure))           ;no configure script
	#:make-flags
	(list (string-append "CC=" ,(cc-for-target))
	     (string-append "BIN_DIR=" %output "/bin"))))
	(home-page "https://github.com/m4lin/hollow")
	(synopsis " hollow here ")
	(description
	"@command{hollow} hollow here too.")
	(license license:gpl2))
