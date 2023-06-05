# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_GEMSPEC="asetus.gemspec"

inherit ruby-fakegem

DESCRIPTION="Configuration library with object access to YAML/JSON/TOML backends"
HOMEPAGE="https://github.com/ytti/asetus"
SRC_URI="https://github.com/ytti/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

all_ruby_prepare() {
        sed -i -e "s/git ls-files -z/find . -type f -name \"*.rb\"/" ${RUBY_FAKEGEM_GEMSPEC} || die
}
