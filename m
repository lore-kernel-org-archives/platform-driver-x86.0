From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH] MAINTAINERS: Add me on list of Dell laptop drivers
Date: Sun, 29 Mar 2015 15:38:50 +0200
Message-ID: <1427636330-21091-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
 MAINTAINERS |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 88c09ca..72a08ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3058,10 +3058,16 @@ F:	drivers/net/fddi/defxx.*
=20
 DELL LAPTOP DRIVER
 M:	Matthew Garrett <mjg59@srcf.ucam.org>
+M:	Pali Roh=C3=A1r <pali.rohar@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/dell-laptop.c
=20
+DELL LAPTOP FREEFALL DRIVER
+M:	Pali Roh=C3=A1r <pali.rohar@gmail.com>
+S:	Maintained
+F:	drivers/platform/x86/dell-smo8800.c
+
 DELL LAPTOP SMM DRIVER
 M:	Guenter Roeck <linux@roeck-us.net>
 S:	Maintained
@@ -3076,6 +3082,7 @@ F:	drivers/firmware/dcdbas.*
=20
 DELL WMI EXTRAS DRIVER
 M:	Matthew Garrett <mjg59@srcf.ucam.org>
+M:	Pali Roh=C3=A1r <pali.rohar@gmail.com>
 S:	Maintained
 F:	drivers/platform/x86/dell-wmi.c
=20
--=20
1.7.9.5
