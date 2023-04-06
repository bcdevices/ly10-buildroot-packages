FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://bcd-logo.png \
    "

do_install:append() {
    install -d -m 755 ${D}${datadir}/plymouth
    install -m 755 ${WORKDIR}/bcd-logo.png ${D}/${datadir}/plymouth/bcd-logo.png

    # Don't stop splash at boot
    rm ${D}${systemd_unitdir}/system/multi-user.target.wants/plymouth-quit.service
    rm ${D}${systemd_unitdir}/system/multi-user.target.wants/plymouth-quit-wait.service
}

FILES:${PN} += "${datadir}/plymouth/bcd-logo.png "

LOGO = "${datadir}/plymouth/bcd-logo.png"

PACKAGES:remove = "${PN}-initrd"
PACKAGECONFIG = "logo pango udev systemd drm"
RDEPENDS:${PN} = "bash"

pkg_postinst:${PN}:append () {
	if [ -n "$D" ]; then
		OPTS="--root=$D"
	fi
	systemctl $OPTS mask systemd-ask-password-plymouth.service
	systemctl $OPTS mask systemd-ask-password-plymouth.path
}
