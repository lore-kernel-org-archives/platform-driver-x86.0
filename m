From: Bernhard Froemel <froemel@vmars.tuwien.ac.at>
Subject: [PATCH 2/2] apple-gmux: obtain version information from indexed gmux
Date: Fri, 24 Aug 2012 10:07:56 +0200
Message-ID: <5037365C.5020000@vmars.tuwien.ac.at>
References: <5037314D.5050606@vmars.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050205090207090600070303"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from luna.vmars.tuwien.ac.at ([128.130.39.29]:53956 "EHLO
	mail.vmars.tuwien.ac.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754611Ab2HXIH7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Aug 2012 04:07:59 -0400
In-Reply-To: <5037314D.5050606@vmars.tuwien.ac.at>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>, platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------050205090207090600070303
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

With the introduced read fixes, version information can be extracted
from the indexed gmux device.

> apple_gmux: Found gmux version 3.2.19 [indexed]
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlA3NlwACgkQ6iVUjPs37Jmr4wCfbG0eE8bZFsnZ8t9YxdOH5VII
OUsAn04UNm0uPrEMlSc5vFcOAcgNOAz0
=FObp
-----END PGP SIGNATURE-----

--------------050205090207090600070303
Content-Type: text/plain; charset=UTF-8;
 name="02_indexed_interface_obtain_version_info.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="02_indexed_interface_obtain_version_info.txt"

Signed-off-by: Bernhard Froemel <froemel@vmars.tuwien.ac.at>
--- a/drivers/platform/x86/apple-gmux.c	2012-08-22 22:29:06.000000000 +0200
+++ b/drivers/platform/x86/apple-gmux.c	2012-08-24 09:18:50.229362622 +0200
@@ -461,18 +461,22 @@
 	ver_release = gmux_read8(gmux_data, GMUX_PORT_VERSION_RELEASE);
 	if (ver_major == 0xff && ver_minor == 0xff && ver_release == 0xff) {
 		if (gmux_is_indexed(gmux_data)) {
+			u32 version;
 			mutex_init(&gmux_data->index_lock);
 			gmux_data->indexed = true;
+			version = gmux_read32(gmux_data,
+				GMUX_PORT_VERSION_MAJOR);
+			ver_major = (version >> 24) & 0xff;
+			ver_minor = (version >> 16) & 0xff;
+			ver_release = (version >> 8) & 0xff;
 		} else {
 			pr_info("gmux device not present\n");
 			ret = -ENODEV;
 			goto err_release;
 		}
-		pr_info("Found indexed gmux\n");
-	} else {
-		pr_info("Found gmux version %d.%d.%d\n", ver_major, ver_minor,
-			ver_release);
 	}
+	pr_info("Found gmux version %d.%d.%d [%s]\n", ver_major, ver_minor,
+		ver_release, (gmux_data->indexed ? "indexed" : "classic"));
 
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_PLATFORM;

--------------050205090207090600070303
Content-Type: application/octet-stream;
 name="02_indexed_interface_obtain_version_info.txt.sig"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="02_indexed_interface_obtain_version_info.txt.sig"

iEYEABECAAYFAlA3NlwACgkQ6iVUjPs37JnSDACgo9FIUeQnn9MiiWm/3Zr2IuJ71TcAn3v+
Cky3GAlAhCMCwHkhCetNYBb7
--------------050205090207090600070303--
