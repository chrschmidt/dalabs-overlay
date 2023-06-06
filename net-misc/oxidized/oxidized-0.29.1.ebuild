# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_GEMSPEC="oxidized.gemspec"

inherit ruby-fakegem

DESCRIPTION="Oxidized network device configuration backup tool"
HOMEPAGE="https://github.com/ytti/oxidized"
SRC_URI="https://github.com/ytti/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
        >=dev-ruby/asetus-0.1
        >=dev-ruby/bcrypt_pbkdf-1.0
        >=dev-ruby/ed25519-1.2
        >=dev-ruby/net-ssh-7.1
        >=dev-ruby/net-telnet-0.2
        >=dev-ruby/rugged-1.6
        >=dev-ruby/slop-4.6
"

all_ruby_prepare() {
        sed -i -e "s/git ls-files -z/find . -type f -name \"*.rb\"/" ${RUBY_FAKEGEM_GEMSPEC} || die
}
