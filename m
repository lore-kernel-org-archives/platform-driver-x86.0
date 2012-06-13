From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH] platform-drivers-x86: change my mail
Date: Wed, 13 Jun 2012 09:33:04 +0200
Message-ID: <1339572784-24805-1-git-send-email-corentin.chary@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:44242 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753232Ab2FMHdJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 13 Jun 2012 03:33:09 -0400
Received: by weyu7 with SMTP id u7so259098wey.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jun 2012 00:33:08 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>

Signed-off-by: Corentin Chary <corentin.chary@gmail.com>
---
 MAINTAINERS                        |    4 ++--
 drivers/platform/x86/asus-nb-wmi.c |    2 +-
 drivers/platform/x86/asus-wmi.c    |    2 +-
 drivers/platform/x86/eeepc-wmi.c   |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8cad55b..e03579a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1190,7 +1190,7 @@ F:	Documentation/hwmon/asc7621
 F:	drivers/hwmon/asc7621.c
 
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
-M:	Corentin Chary <corentincj@iksaif.net>
+M:	Corentin Chary <corentin.chary@gmail.com>
 L:	acpi4asus-user@lists.sourceforge.net
 L:	platform-driver-x86@vger.kernel.org
 W:	http://acpi4asus.sf.net
@@ -5825,7 +5825,7 @@ F:	drivers/media/video/*7146*
 F:	include/media/*7146*
 
 SAMSUNG LAPTOP DRIVER
-M:	Corentin Chary <corentincj@iksaif.net>
+M:	Corentin Chary <corentin.chary@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/samsung-laptop.c
diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 99a30b5..fd033b7 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -31,7 +31,7 @@
 
 #define	ASUS_NB_WMI_FILE	"asus-nb-wmi"
 
-MODULE_AUTHOR("Corentin Chary <corentincj@iksaif.net>");
+MODULE_AUTHOR("Corentin Chary <corentin.chary@gmail.com>");
 MODULE_DESCRIPTION("Asus Notebooks WMI Hotkey Driver");
 MODULE_LICENSE("GPL");
 
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index c4d9b0e..4445dbe 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -53,7 +53,7 @@
 
 #include "asus-wmi.h"
 
-MODULE_AUTHOR("Corentin Chary <corentincj@iksaif.net>, "
+MODULE_AUTHOR("Corentin Chary <corentin.chary@gmail.com>, "
 	      "Yong Wang <yong.y.wang@intel.com>");
 MODULE_DESCRIPTION("Asus Generic WMI Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 5838332..60cb76a 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -39,7 +39,7 @@
 
 #define	EEEPC_WMI_FILE	"eeepc-wmi"
 
-MODULE_AUTHOR("Corentin Chary <corentincj@iksaif.net>");
+MODULE_AUTHOR("Corentin Chary <corentin.chary@gmail.com>");
 MODULE_DESCRIPTION("Eee PC WMI Hotkey Driver");
 MODULE_LICENSE("GPL");
 
-- 
1.7.9.5
