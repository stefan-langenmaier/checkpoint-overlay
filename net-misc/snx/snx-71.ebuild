# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5

inherit eutils
DESCRIPTION="SSL Network Extender (SNX) from Check Point"
HOMEPAGE="https://supportcenter.checkpoint.com/supportcenter/portal/user/anon/page/default.psml/media-type/html?action=portlets.DCFileAction&eventSubmit_doGetdcdetails=&fileid=8993"

SRC_URI="Check_Point_SNX_R71_VPN-1_Gateway_Files.tgz"

LICENSE="CheckPoint"
SLOT="0"

KEYWORDS="~x86 ~amd64"

IUSE=""

RESTRICT="strip fetch"

#DEPEND=""
RDEPEND="${DEPEND}
	sys-libs/libstdc++-v3"

# Source directory; the dir where the sources can be found (automatically
# unpacked) inside ${WORKDIR}.  The default value for S is ${WORKDIR}/${P}
# If you don't need to change it, leave the S= line out of the ebuild
# to keep it tidy.
#S=${WORKDIR}/${P}
S=${WORKDIR}

src_prepare() {
	mkdir "$S"/tmp
	#unpack excutable
	ARCHIVE_OFFSET=78
	tail -n +$ARCHIVE_OFFSET snx_install.sh | bunzip2 -c - | (cd $S/tmp; tar xf -)
}

src_configure() {
	:
}

src_compile() {
	:
}

src_install() {
	dobin tmp/snx
}
