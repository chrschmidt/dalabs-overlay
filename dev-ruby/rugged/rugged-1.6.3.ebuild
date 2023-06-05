# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_GEMSPEC="rugged.gemspec"

RUBY_FAKEGEM_EXTENSIONS=(ext/rugged/extconf.rb)
RUBY_FAKEGM_EXTENSION_OPTIONS="--use-system-libraries"

inherit ruby-fakegem

DESCRIPTION="ruby bindings to libgit2"
HOMEPAGE="https://github.com/libgit2/rugged"
SRC_URI="https://github.com/libgit2/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
        >=dev-libs/libgit2-1.6
        "

# dependency on virtual/pkgconfig is explicitly in ruby-fakegem.eclass
BDEPEND+=" dev-util/cmake"

src_unpack() {
        local INCDIR="${WORKDIR}/all/${P}/vendor/libgit2/include/git2"
        ruby-ng_src_unpack
        mkdir -p "${INCDIR}" || die
        ln -s /usr/include/git2/version.h "${INCDIR}/" || die
}
