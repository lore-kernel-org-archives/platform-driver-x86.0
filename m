From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v4 1/5] dell-laptop: move dell_smi_error() to dell-smbios
Date: Wed, 24 Feb 2016 08:20:11 +0100
Message-ID: <1456298416-29683-2-git-send-email-kernel@kempniu.pl>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1456298416-29683-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456298416-29683-1-git-send-email-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The dell_smi_error() method could be used by modules other than
dell-laptop for convenient translation of SMBIOS request errors into
errno values.  Thus, move it to dell-smbios.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-laptop.c |   14 --------------
 drivers/platform/x86/dell-smbios.c |   16 ++++++++++++++++
 drivers/platform/x86/dell-smbios.h |    2 ++
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index 76064c8..cbafb95 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -273,20 +273,6 @@ static const struct dmi_system_id dell_quirks[] __=
initconst =3D {
 	{ }
 };
=20
-static inline int dell_smi_error(int value)
-{
-	switch (value) {
-	case 0: /* Completed successfully */
-		return 0;
-	case -1: /* Completed with error */
-		return -EIO;
-	case -2: /* Function not supported */
-		return -ENXIO;
-	default: /* Unknown error */
-		return -EINVAL;
-	}
-}
-
 /*
  * Derived from information in smbios-wireless-ctl:
  *
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/=
dell-smbios.c
index 2a4992a..942572f 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/dmi.h>
+#include <linux/err.h>
 #include <linux/gfp.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
@@ -39,6 +40,21 @@ static int da_command_code;
 static int da_num_tokens;
 static struct calling_interface_token *da_tokens;
=20
+int dell_smi_error(int value)
+{
+	switch (value) {
+	case 0: /* Completed successfully */
+		return 0;
+	case -1: /* Completed with error */
+		return -EIO;
+	case -2: /* Function not supported */
+		return -ENXIO;
+	default: /* Unknown error */
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL_GPL(dell_smi_error);
+
 struct calling_interface_buffer *dell_smbios_get_buffer(void)
 {
 	mutex_lock(&buffer_mutex);
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/=
dell-smbios.h
index 4f69b16..52febe6 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -35,6 +35,8 @@ struct calling_interface_token {
 	};
 };
=20
+int dell_smi_error(int value);
+
 struct calling_interface_buffer *dell_smbios_get_buffer(void);
 void dell_smbios_clear_buffer(void);
 void dell_smbios_release_buffer(void);
--=20
1.7.10.4
