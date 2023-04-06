# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit edos2unix toolchain-funcs

DESCRIPTION="Network benchmark using TCP and UDP protocols"
HOMEPAGE="https://github.com/kai-uwe-rommel/netio"
SRC_URI="https://github.com/kai-uwe-rommel/${PN}/archive/refs/tags/${PV}.tar.gz"
#S="${WORKDIR}"

LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos"
RESTRICT="mirror" # bug #391789 comment #1

src_prepare() {
	edos2unix *.c *.h *.doc

	default

	sed -i \
		-e "s|LFLAGS=\"\"|LFLAGS?=\"${LDFLAGS}\"|g" \
		-e 's|\(CC\)=|\1?=|g' \
		-e 's|\(CFLAGS\)=|\1+=|g' \
		Makefile || die
}

src_compile() {
	emake \
		CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS}" \
		linux
}

src_install() {
	dobin netio
	dodoc netio.doc
}
