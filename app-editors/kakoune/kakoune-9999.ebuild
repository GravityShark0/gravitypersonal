# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# Changes to 9999 made by me :)

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Modal editor inspired by vim"
HOMEPAGE="http://kakoune.org/ https://github.com/mawww/kakoune"
EGIT_REPO_URI="https://github.com/mawww/kakoune.git"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~x86"

BDEPEND="virtual/pkgconfig"

# src_prepare() {
# sed -i '/CXXFLAGS += -O3/d' src/Makefile || die
# 	default
# }

# src_configure() {
# 	# tc-export CXX
# 	default
# }

src_compile() {
	emake -C all
}

src_test() {
	emake -C test
}

src_install() {
	emake PREFIX="${D}"/usr docdir="${ED}/usr/share/doc/${PF}" install

	# rm "${ED}/usr/share/man/man1/kak.1.gz" || die
	doman doc/kak.1
}
