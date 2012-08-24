From: Bernhard Froemel <froemel@vmars.tuwien.ac.at>
Subject: [PATCH 1/2] apple-gmux: fixes concerning access to indexed gmux
Date: Fri, 24 Aug 2012 10:04:46 +0200
Message-ID: <5037359E.3040203@vmars.tuwien.ac.at>
References: <5037314D.5050606@vmars.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070801060606060200040400"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from luna.vmars.tuwien.ac.at ([128.130.39.29]:53953 "EHLO
	mail.vmars.tuwien.ac.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753697Ab2HXIEt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Aug 2012 04:04:49 -0400
In-Reply-To: <5037314D.5050606@vmars.tuwien.ac.at>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>, platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------070801060606060200040400
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

This patch is based on my analysis of the binary Apple gmux OSX driver.
Apple apparently follows for byte writes both protocols: the indexed
and the direct mapped one.
During my tests, gmux register writes and reads never failed, while
without this patch both writes and reads if done consecutively often fail.
Failed writes obviously affect switching from one GPU to another
(e.g., also during suspend/resume causing all kinds of problems: black
screen to complete system lockup).
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlA3NZ0ACgkQ6iVUjPs37JlpJQCdF1Rla8AE2honZ1efQbWxfLOH
4ZEAnRTY85DDplkCN2yj35jXlWQq6NMO
=Eg8m
-----END PGP SIGNATURE-----

--------------070801060606060200040400
Content-Type: text/plain; charset=UTF-8;
 name="01_indexed_interface_fixes.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="01_indexed_interface_fixes.txt"

Signed-off-by: Bernhard Froemel <froemel@vmars.tuwien.ac.at>

--- a/drivers/platform/x86/apple-gmux.c	2012-08-22 22:29:06.000000000 +0200
+++ b/drivers/platform/x86/apple-gmux.c	2012-08-24 09:18:50.229362622 +0200
@@ -19,7 +19,6 @@
 #include <linux/pnp.h>
 #include <linux/apple_bl.h>
 #include <linux/slab.h>
-#include <linux/delay.h>
 #include <linux/pci.h>
 #include <linux/vga_switcheroo.h>
 #include <acpi/video.h>
@@ -113,7 +112,6 @@
 	while (i && (gwr & 0x01)) {
 		inb(gmux_data->iostart + GMUX_PORT_READ);
 		gwr = inb(gmux_data->iostart + GMUX_PORT_WRITE);
-		udelay(100);
 		i--;
 	}
 
@@ -127,11 +125,10 @@
 
 	while (i && !(gwr & 0x01)) {
 		gwr = inb(gmux_data->iostart + GMUX_PORT_WRITE);
-		udelay(100);
 		i--;
 	}
 
-	if (gwr & 0x01)
+	if (!(gwr & 0x01))
 		inb(gmux_data->iostart + GMUX_PORT_READ);
 
 	return !!i;
@@ -142,8 +139,9 @@
 	u8 val;
 
 	mutex_lock(&gmux_data->index_lock);
-	outb((port & 0xff), gmux_data->iostart + GMUX_PORT_READ);
 	gmux_index_wait_ready(gmux_data);
+	outb((port & 0xff), gmux_data->iostart + GMUX_PORT_READ);
+	gmux_index_wait_complete(gmux_data);
 	val = inb(gmux_data->iostart + GMUX_PORT_VALUE);
 	mutex_unlock(&gmux_data->index_lock);
 
@@ -153,6 +151,7 @@
 static void gmux_index_write8(struct apple_gmux_data *gmux_data, int port,
 			      u8 val)
 {
+	outb(val, gmux_data->iostart + port);
 	mutex_lock(&gmux_data->index_lock);
 	outb(val, gmux_data->iostart + GMUX_PORT_VALUE);
 	gmux_index_wait_ready(gmux_data);
@@ -166,8 +165,9 @@
 	u32 val;
 
 	mutex_lock(&gmux_data->index_lock);
-	outb((port & 0xff), gmux_data->iostart + GMUX_PORT_READ);
 	gmux_index_wait_ready(gmux_data);
+	outb((port & 0xff), gmux_data->iostart + GMUX_PORT_READ);
+	gmux_index_wait_complete(gmux_data);
 	val = inl(gmux_data->iostart + GMUX_PORT_VALUE);
 	mutex_unlock(&gmux_data->index_lock);
 

--------------070801060606060200040400
Content-Type: application/octet-stream;
 name="01_indexed_interface_fixes.txt.sig"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="01_indexed_interface_fixes.txt.sig"

iEYEABECAAYFAlA3NZ0ACgkQ6iVUjPs37JkNegCfZFE6xWOH/GmMvM0ZbziZjak0OekAn02U
JLAApZrc+CZ3rrCAG43YhDOA
--------------070801060606060200040400--
