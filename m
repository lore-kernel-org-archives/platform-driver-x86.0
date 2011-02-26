From: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 11/14] asus-nb-wmi: Asus Notebooks WMI
	Driver
Date: Sat, 26 Feb 2011 10:20:40 +0100
Message-ID: <1298712045-17671-12-git-send-email-corentincj@iksaif.net>
References: <1298712045-17671-1-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1298712045-17671-1-git-send-email-corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "open list:ASUS NOTEBOOKS AN..." <acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:X86 PLATFORM DRIVERS" <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Introduce a new driver for Asus Notebooks shipped with
a WMI device instead of the old ACPI device. The WMI
device is almost the same as the one present in Eee PC,
but the event guid and the keymap are different.

The keymap comes from asus-laptop module.

On Asus notebooks, when you call the WMI device, you always
need a 64bit buffer, even if you only want to get the state
of a device (tested on a G73).

Signed-off-by: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
---
 MAINTAINERS                        |   30 +----------
 drivers/platform/x86/Kconfig       |   16 ++++++-
 drivers/platform/x86/Makefile      |    1 +
 drivers/platform/x86/asus-nb-wmi.c |   98 ++++++++++++++++++++++++++++++++++++
 4 files changed, 117 insertions(+), 28 deletions(-)
 create mode 100644 drivers/platform/x86/asus-nb-wmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 6f99e12..4fafc2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1126,14 +1126,14 @@ S:	Maintained
 F:	Documentation/hwmon/asc7621
 F:	drivers/hwmon/asc7621.c
 
-ASUS ACPI EXTRAS DRIVER
+ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:	Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
-M:	Karol Kozimor <sziwan-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
 L:	acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
 L:	platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 W:	http://acpi4asus.sf.net
 S:	Maintained
-F:	drivers/platform/x86/asus_acpi.c
+F:	drivers/platform/x86/asus*.c
+F:	drivers/platform/x86/eeepc*.c
 
 ASUS ASB100 HARDWARE MONITOR DRIVER
 M:	"Mark M. Hoffman" <mhoffman-xQSgfq/1h4JiLUuM0BA3LQ@public.gmane.org>
@@ -1141,14 +1141,6 @@ L:	lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org
 S:	Maintained
 F:	drivers/hwmon/asb100.c
 
-ASUS LAPTOP EXTRAS DRIVER
-M:	Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
-L:	acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
-L:	platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-W:	http://acpi4asus.sf.net
-S:	Maintained
-F:	drivers/platform/x86/asus-laptop.c
-
 ASYNCHRONOUS TRANSFERS/TRANSFORMS (IOAT) API
 M:	Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
 W:	http://sourceforge.net/projects/xscaleiop
@@ -2368,22 +2360,6 @@ T:	git git://git.alsa-project.org/alsa-kernel.git
 S:	Maintained
 F:	sound/usb/misc/ua101.c
 
-EEEPC LAPTOP EXTRAS DRIVER
-M:	Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
-L:	acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
-L:	platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-W:	http://acpi4asus.sf.net
-S:	Maintained
-F:	drivers/platform/x86/eeepc-laptop.c
-
-EEEPC WMI EXTRAS DRIVER
-M:	Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
-L:	acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
-L:	platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-W:	http://acpi4asus.sf.net
-S:	Maintained
-F:	drivers/platform/x86/eeepc-wmi.c
-
 EFIFB FRAMEBUFFER DRIVER
 L:	linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 M:	Peter Jones <pjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 22e5225..cd65dac 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -447,11 +447,25 @@ config ASUS_WMI
 	select LEDS_CLASS
 	select NEW_LEDS
 	---help---
-	  Say Y here if you have a WMI aware Asus laptop (like Eee PCs).
+	  Say Y here if you have a WMI aware Asus laptop (like Eee PCs or new
+	  Asus Notebooks).
 
 	  To compile this driver as a module, choose M here: the module will
 	  be called asus-wmi.
 
+config ASUS_NB_WMI
+	tristate "Asus Notebook WMI Driver (EXPERIMENTAL)"
+	depends on ASUS_WMI
+	---help---
+	  This is a driver for newer Asus notebooks. It adds extra features
+	  like wireless radio and bluetooth control, leds, hotkeys, backlight...
+
+	  For more informations, see
+	  <file:Documentation/ABI/testing/sysfs-platform-asus-wmi>
+
+	  If you have an ACPI-WMI compatible Asus Notebook, say Y or M
+	  here.
+
 config EEEPC_WMI
 	tristate "Eee PC WMI Driver (EXPERIMENTAL)"
 	depends on ASUS_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index f8d35f1..68acb23 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -4,6 +4,7 @@
 #
 obj-$(CONFIG_ASUS_LAPTOP)	+= asus-laptop.o
 obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
+obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
 obj-$(CONFIG_EEEPC_LAPTOP)	+= eeepc-laptop.o
 obj-$(CONFIG_EEEPC_WMI)		+= eeepc-wmi.o
 obj-$(CONFIG_MSI_LAPTOP)	+= msi-laptop.o
diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
new file mode 100644
index 0000000..0580d99
--- /dev/null
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -0,0 +1,98 @@
+/*
+ * Asus Notebooks WMI hotkey driver
+ *
+ * Copyright(C) 2010 Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+
+#include "asus-wmi.h"
+
+#define	ASUS_NB_WMI_FILE	"asus-nb-wmi"
+
+MODULE_AUTHOR("Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>");
+MODULE_DESCRIPTION("Asus Notebooks WMI Hotkey Driver");
+MODULE_LICENSE("GPL");
+
+#define ASUS_NB_WMI_EVENT_GUID	"0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
+
+MODULE_ALIAS("wmi:"ASUS_NB_WMI_EVENT_GUID);
+
+static const struct key_entry asus_nb_wmi_keymap[] = {
+	{ KE_KEY, 0x30, { KEY_VOLUMEUP } },
+	{ KE_KEY, 0x31, { KEY_VOLUMEDOWN } },
+	{ KE_KEY, 0x32, { KEY_MUTE } },
+	{ KE_KEY, 0x33, { KEY_DISPLAYTOGGLE } }, /* LCD on */
+	{ KE_KEY, 0x34, { KEY_DISPLAY_OFF } }, /* LCD off */
+	{ KE_KEY, 0x40, { KEY_PREVIOUSSONG } },
+	{ KE_KEY, 0x41, { KEY_NEXTSONG } },
+	{ KE_KEY, 0x43, { KEY_STOPCD } },
+	{ KE_KEY, 0x45, { KEY_PLAYPAUSE } },
+	{ KE_KEY, 0x4c, { KEY_MEDIA } },
+	{ KE_KEY, 0x50, { KEY_EMAIL } },
+	{ KE_KEY, 0x51, { KEY_WWW } },
+	{ KE_KEY, 0x55, { KEY_CALC } },
+	{ KE_KEY, 0x5C, { KEY_F15 } },  /* Power Gear key */
+	{ KE_KEY, 0x5D, { KEY_WLAN } },
+	{ KE_KEY, 0x5E, { KEY_WLAN } },
+	{ KE_KEY, 0x5F, { KEY_WLAN } },
+	{ KE_KEY, 0x60, { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, 0x61, { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, 0x62, { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, 0x63, { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } },
+	{ KE_KEY, 0x7E, { KEY_BLUETOOTH } },
+	{ KE_KEY, 0x7D, { KEY_BLUETOOTH } },
+	{ KE_KEY, 0x82, { KEY_CAMERA } },
+	{ KE_KEY, 0x88, { KEY_RFKILL  } },
+	{ KE_KEY, 0x8A, { KEY_PROG1 } },
+	{ KE_KEY, 0x95, { KEY_MEDIA } },
+	{ KE_KEY, 0x99, { KEY_PHONE } },
+	{ KE_KEY, 0xb5, { KEY_CALC } },
+	{ KE_KEY, 0xc4, { KEY_KBDILLUMUP } },
+	{ KE_KEY, 0xc5, { KEY_KBDILLUMDOWN } },
+	{ KE_END, 0},
+};
+
+static struct asus_wmi_driver asus_nb_wmi_driver = {
+	.name = ASUS_NB_WMI_FILE,
+	.owner = THIS_MODULE,
+	.event_guid = ASUS_NB_WMI_EVENT_GUID,
+	.keymap = asus_nb_wmi_keymap,
+	.input_name = "Asus WMI hotkeys",
+	.input_phys = ASUS_NB_WMI_FILE "/input0",
+};
+
+
+static int __init asus_nb_wmi_init(void)
+{
+	return asus_wmi_register_driver(&asus_nb_wmi_driver);
+}
+
+static void __exit asus_nb_wmi_exit(void)
+{
+	asus_wmi_unregister_driver(&asus_nb_wmi_driver);
+}
+
+module_init(asus_nb_wmi_init);
+module_exit(asus_nb_wmi_exit);
-- 
1.7.4


------------------------------------------------------------------------------
Free Software Download: Index, Search & Analyze Logs and other IT data in 
Real-Time with Splunk. Collect, index and harness all the fast moving IT data 
generated by your applications, servers and devices whether physical, virtual
or in the cloud. Deliver compliance at lower cost and gain new business 
insights. http://p.sf.net/sfu/splunk-dev2dev 
