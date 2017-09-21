From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 05/12] platform/x86: dell-smbios: rename to dell-wmi-smbios
Date: Thu, 21 Sep 2017 08:57:10 -0500
Message-ID: <ed45d9110d415c705d34d75f1cce9cc023403074.1505999739.git.mario.limonciello@dell.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1505999739.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1505999739.git.mario.limonciello@dell.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

This follows the style of the rest of the platform x86 WMI drivers.

Renaming the driver requires adjusting the other drivers using
dell-smbios to pick up the newly named includes.

While renaming, I noticed that this driver was missing from
MAINTAINERs. Add it to that and myself to the list of people maintaing
it.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 MAINTAINERS                                          |  6 ++++++
 drivers/platform/x86/Kconfig                         |  2 +-
 drivers/platform/x86/Makefile                        |  2 +-
 drivers/platform/x86/dell-laptop.c                   |  2 +-
 .../x86/{dell-smbios.c => dell-wmi-smbios.c}         | 20 ++++++++++----------
 .../x86/{dell-smbios.h => dell-wmi-smbios.h}         |  4 ++--
 drivers/platform/x86/dell-wmi.c                      |  2 +-
 7 files changed, 22 insertions(+), 16 deletions(-)
 rename drivers/platform/x86/{dell-smbios.c => dell-wmi-smbios.c} (92%)
 rename drivers/platform/x86/{dell-smbios.h => dell-wmi-smbios.h} (96%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5d8ea24a8ee7..437daa9062e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4002,6 +4002,12 @@ M:	Pali Rohár <pali.rohar@gmail.com>
 S:	Maintained
 F:	drivers/platform/x86/dell-wmi.c
 
+DELL WMI SMBIOS DRIVER
+M:	Pali Rohár <pali.rohar@gmail.com>
+M:	Mario Limonciello <mario.limonciello@dell.com>
+S:	Maintained
+F:	drivers/platform/x86/dell-wmi-smbios.c
+
 DELTA ST MEDIA DRIVER
 M:	Hugues Fruchet <hugues.fruchet@st.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 81d61c0f4ef8..a70bcd8caa72 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -91,7 +91,7 @@ config ASUS_LAPTOP
 
 	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
 
-config DELL_SMBIOS
+config DELL_WMI_SMBIOS
 	tristate "Dell WMI SMBIOS calling interface"
 	depends on ACPI_WMI
 	---help---
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 91cec1751461..b127a3bc1fab 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -11,11 +11,11 @@ obj-$(CONFIG_EEEPC_WMI)		+= eeepc-wmi.o
 obj-$(CONFIG_MSI_LAPTOP)	+= msi-laptop.o
 obj-$(CONFIG_ACPI_CMPC)		+= classmate-laptop.o
 obj-$(CONFIG_COMPAL_LAPTOP)	+= compal-laptop.o
-obj-$(CONFIG_DELL_SMBIOS)	+= dell-smbios.o
 obj-$(CONFIG_DELL_LAPTOP)	+= dell-laptop.o
 obj-$(CONFIG_DELL_WMI)		+= dell-wmi.o
 obj-$(CONFIG_DELL_WMI_AIO)	+= dell-wmi-aio.o
 obj-$(CONFIG_DELL_WMI_LED)	+= dell-wmi-led.o
+obj-$(CONFIG_DELL_WMI_SMBIOS)	+= dell-wmi-smbios.o
 obj-$(CONFIG_DELL_SMO8800)	+= dell-smo8800.o
 obj-$(CONFIG_DELL_RBTN)		+= dell-rbtn.o
 obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index f42159fd2031..bf569ea93e9d 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -33,7 +33,7 @@
 #include <linux/seq_file.h>
 #include <acpi/video.h>
 #include "dell-rbtn.h"
-#include "dell-smbios.h"
+#include "dell-wmi-smbios.h"
 
 #define BRIGHTNESS_TOKEN 0x7d
 #define KBD_LED_OFF_TOKEN 0x01E1
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-wmi-smbios.c
similarity index 92%
rename from drivers/platform/x86/dell-smbios.c
rename to drivers/platform/x86/dell-wmi-smbios.c
index c06262a89169..7f896701fb7b 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-wmi-smbios.c
@@ -21,7 +21,7 @@
 #include <linux/err.h>
 #include <linux/mutex.h>
 #include <linux/wmi.h>
-#include "dell-smbios.h"
+#include "dell-wmi-smbios.h"
 
 #define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
 
@@ -189,7 +189,7 @@ static void __init find_tokens(const struct dmi_header *dm, void *dummy)
 	}
 }
 
-static int dell_smbios_probe(struct wmi_device *wdev)
+static int dell_wmi_smbios_probe(struct wmi_device *wdev)
 {
 	int ret;
 
@@ -213,27 +213,27 @@ static int dell_smbios_probe(struct wmi_device *wdev)
 	return ret;
 }
 
-static int dell_smbios_remove(struct wmi_device *wdev)
+static int dell_wmi_smbios_remove(struct wmi_device *wdev)
 {
 	kfree(da_tokens);
 	free_page((unsigned long)buffer);
 	return 0;
 }
 
-static const struct wmi_device_id dell_smbios_id_table[] = {
+static const struct wmi_device_id dell_wmi_smbios_id_table[] = {
 	{ .guid_string = DELL_WMI_SMBIOS_GUID },
 	{ },
 };
 
-static struct wmi_driver dell_smbios_driver = {
+static struct wmi_driver dell_wmi_smbios_driver = {
 	.driver = {
-		.name = "dell-smbios",
+		.name = "dell-wmi-smbios",
 	},
-	.probe = dell_smbios_probe,
-	.remove = dell_smbios_remove,
-	.id_table = dell_smbios_id_table,
+	.probe = dell_wmi_smbios_probe,
+	.remove = dell_wmi_smbios_remove,
+	.id_table = dell_wmi_smbios_id_table,
 };
-module_wmi_driver(dell_smbios_driver);
+module_wmi_driver(dell_wmi_smbios_driver);
 
 
 MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-wmi-smbios.h
similarity index 96%
rename from drivers/platform/x86/dell-smbios.h
rename to drivers/platform/x86/dell-wmi-smbios.h
index e1e29697b362..e6e9990bb2b7 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-wmi-smbios.h
@@ -14,8 +14,8 @@
  *  published by the Free Software Foundation.
  */
 
-#ifndef _DELL_SMBIOS_H_
-#define _DELL_SMBIOS_H_
+#ifndef _DELL_WMI_SMBIOS_H_
+#define _DELL_WMI_SMBIOS_H_
 
 struct notifier_block;
 
diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 1fbef560ca67..e8b4d412eabc 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -38,7 +38,7 @@
 #include <linux/dmi.h>
 #include <linux/wmi.h>
 #include <acpi/video.h>
-#include "dell-smbios.h"
+#include "dell-wmi-smbios.h"
 
 MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
 MODULE_AUTHOR("Pali Rohár <pali.rohar@gmail.com>");
-- 
2.14.1
