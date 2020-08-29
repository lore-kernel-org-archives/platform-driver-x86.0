From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: sysfs output without newlines
Date: Sat, 29 Aug 2020 11:23:43 -0700
Message-ID: <0f837bfb394ac632241eaac3e349b2ba806bce09.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-spi-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-spi-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denis Efremov <efremov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "Rafael J. Wysocki" <rafael-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "Gustavo A . R . Silva" <gustavoars-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julia Lawall <julia.lawall-MZpvjPyXg2s@public.gmane.org>, Alex Dewar <alex.dewar90-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tony Luck <tony.luck-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>, Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Boris Brezillon <bbrezillon-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alex Dubov <oakad-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomas Winkler <tomas.winkler-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Douglas Miller <dougmill-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Stanislav Yakovlev <stas.yakovlev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, An
List-Id: platform-driver-x86.vger.kernel.org

While doing an investigation for a possible treewide conversion of
sysfs output using sprintf/snprintf/scnprintf, I discovered
several instances of sysfs output without terminating newlines.

It seems likely all of these should have newline terminations
or have the \n\r termination changed to a single newline.

Anyone have any objection to patches adding newlines to these
in their original forms using sprintf/snprintf/scnprintf?

A few of these might be false positives as
	"%s", string
might already have string with a newline termination.

+++ drivers/edac/fsl_ddr_edac.c
+	return sysfs_emit(data, "0x%08x",
+	return sysfs_emit(data, "0x%08x",
+	return sysfs_emit(data, "0x%08x",
+++ drivers/edac/synopsys_edac.c
+	return sysfs_emit(data, "Data Poisoning: %s\n\r",
+		return sysfs_emit(buf, "1");
+		return sysfs_emit(buf, "0");
+		return sysfs_emit(buf, "1");
+		return sysfs_emit(buf, "0");
+		return sysfs_emit(buf, "0");
+		return sysfs_emit(buf, "1");
+		return sysfs_emit(buf, "0");
+	return sysfs_emit(buf, "%u", !!(data->status & mask));
+	return sysfs_emit(buf, "%u", data->tcrit2[index] * 1000);
+	return sysfs_emit(buf, "%d",
+	return sysfs_emit(buf, "%u", data->tcrit1[index] * 1000);
+	return sysfs_emit(buf, "%d",
+	return sysfs_emit(buf, "%d", data->toffset[index] * 500);
+++ drivers/i3c/master.c
+		return sysfs_emit(buf, "i3c:dcr%02Xmanuf%04X", devinfo.dcr,
+	return sysfs_emit(buf, "i3c:dcr%02Xmanuf%04Xpart%04Xext%04X",
+	return sysfs_emit(buf, "%s", dd->boardversion);
+	return sysfs_emit(buf, "%s", dd->serial);
+	return sysfs_emit(buf, "%s", (char *)ib_qib_version);
+	return sysfs_emit(buf, "%s", dd->boardversion);
+	return sysfs_emit(buf, "%s", dd->lbus_info);
+	return sysfs_emit(buf, "ipac:f%02Xv%08Xd%08X", idev->id_format,
+++ drivers/memstick/core/mspro_block.c
+	return sysfs_emit(buffer, "%s", (char *)s_attr->data);
+	return sysfs_emit(buf, "%s",
+	return sysfs_emit(buf, "%s",
+++ drivers/misc/mei/bus.c
+	return sysfs_emit(buf, "%s", cldev->name);
+	return sysfs_emit(buf, "%pUl", uuid);
+	return sysfs_emit(buf, "%02X", version);
+	return sysfs_emit(buf, "mei:%s:%pUl:%02X:",
+	return sysfs_emit(buf, "%d", maxconn);
+	return sysfs_emit(buf, "%d", fixed);
+	return sysfs_emit(buf, "%d", vt);
+	return sysfs_emit(buf, "%u", maxlen);
+	return sysfs_emit(buf, "%s", mei_dev_state_str(dev_state));
+++ drivers/misc/tifm_core.c
+	return sysfs_emit(buf, "%x", sock->type);
+			return sysfs_emit(buf, "%s",
+	return sysfs_emit(buf, "%d", dev->net_count);
+++ drivers/net/ethernet/freescale/dpaa/dpaa_eth_sysfs.c
+		return sysfs_emit(buf, "%llx",
+		return sysfs_emit(buf, "none");
+++ drivers/net/ethernet/ibm/ehea/ehea_main.c
+	return sysfs_emit(buf, "%d", port->logical_port_id);
+++ drivers/net/wireless/intel/ipw2x00/ipw2200.c
+		return sysfs_emit(buf, "%s", priv->prom_net_dev->name);
+	return sysfs_emit(buf, "0x%04X",
+	return sysfs_emit(buf, "%d", il->retry_rate);
+	return sysfs_emit(buf, "%pOF", np);
+	return sysfs_emit(buf, "pcmcia:m%04Xc%04Xf%02Xfn%02Xpfn%02X"
+++ drivers/platform/x86/dell-smbios-base.c
+		return sysfs_emit(buf, "%08x", da_tokens[i].location);
+		return sysfs_emit(buf, "%08x", da_tokens[i].value);
+	return sysfs_emit(buf, "%08x",
+++ drivers/scsi/st.c
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+	return sysfs_emit(buf, "%lld",
+++ drivers/spi/spi-tle62x0.c
+	return sysfs_emit(buf, "%d", value);
+++ drivers/usb/class/cdc-acm.c
+	return sysfs_emit(buf, "%d", acm->ctrl_caps);
+	return sysfs_emit(buf, "%d", acm->country_rel_date);
+++ drivers/usb/class/usblp.c
+	return sysfs_emit(buf, "%s", usblp->device_id_string+2);
+	return sysfs_emit(buf, "usb:v%04Xp%04Xd%04Xdc%02Xdsc%02Xdp%02X"
+++ drivers/usb/misc/cytherm.c
+	return sysfs_emit(buf, "%i", cytherm->brightness);
+	return sysfs_emit(buf, "%c%i.%i", sign ? '-' : '+', temp >> 1,
+		return sysfs_emit(buf, "1");
+		return sysfs_emit(buf, "0");
+	return sysfs_emit(buf, "%d", retval);
+	return sysfs_emit(buf, "%d", retval);
