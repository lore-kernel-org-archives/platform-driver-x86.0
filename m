From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v4 3/5] dell-wmi: enable receiving WMI events on Dell Vostro V131
Date: Wed, 24 Feb 2016 08:20:13 +0100
Message-ID: <1456298416-29683-4-git-send-email-kernel@kempniu.pl>
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

On some laptop models (e.g. Dell Vostro V131), WMI events are not
generated until a specific SMBIOS request is issued to register an even=
t
listener [1].  As there seems to be no ACPI method or SMBIOS request to
determine without possible side effects whether a given machine needs t=
o
issue this SMBIOS request in order to receive WMI events, DMI matching
is used to whitelist the models which need it.

[1] https://lists.us.dell.com/pipermail/libsmbios-devel/2015-July/00061=
2.html

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/Kconfig    |    1 +
 drivers/platform/x86/dell-wmi.c |   66 +++++++++++++++++++++++++++++++=
++++++++
 2 files changed, 67 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
index 659e13b..176c666 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -123,6 +123,7 @@ config DELL_WMI
 	depends on ACPI_WMI
 	depends on INPUT
 	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
+	depends on DELL_SMBIOS
 	select INPUT_SPARSEKMAP
 	select DMI
 	---help---
diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
index e38258a..65edd93 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -37,6 +37,7 @@
 #include <linux/string.h>
 #include <linux/dmi.h>
 #include <acpi/video.h>
+#include "dell-smbios.h"
=20
 MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
 MODULE_AUTHOR("Pali Roh=C3=A1r <pali.rohar@gmail.com>");
@@ -47,10 +48,29 @@ MODULE_LICENSE("GPL");
 #define DELL_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
=20
 static u32 dell_wmi_interface_version;
+static bool wmi_requires_smbios_request;
=20
 MODULE_ALIAS("wmi:"DELL_EVENT_GUID);
 MODULE_ALIAS("wmi:"DELL_DESCRIPTOR_GUID);
=20
+static int __init dmi_matched(const struct dmi_system_id *dmi)
+{
+	wmi_requires_smbios_request =3D 1;
+	return 1;
+}
+
+static const struct dmi_system_id dell_wmi_smbios_list[] __initconst =3D=
 {
+	{
+		.callback =3D dmi_matched,
+		.ident =3D "Dell Vostro V131",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V131"),
+		},
+	},
+	{ }
+};
+
 /*
  * Certain keys are flagged as KE_IGNORE. All of these are either
  * notifications (rather than requests for change) or are also sent
@@ -597,6 +617,38 @@ static int __init dell_wmi_check_descriptor_buffer=
(void)
 	return 0;
 }
=20
+/*
+ * According to Dell SMBIOS documentation:
+ *
+ * 17  3  Application Program Registration
+ *
+ *     cbArg1 Application ID 1 =3D 0x00010000
+ *     cbArg2 Application ID 2
+ *            QUICKSET/DCP =3D 0x51534554 "QSET"
+ *            ALS Driver   =3D 0x416c7353 "AlsS"
+ *            Latitude ON  =3D 0x4c6f6e52 "LonR"
+ *     cbArg3 Application version or revision number
+ *     cbArg4 0 =3D Unregister application
+ *            1 =3D Register application
+ *     cbRes1 Standard return codes (0, -1, -2)
+ */
+
+static int dell_wmi_events_set_enabled(bool enable)
+{
+	struct calling_interface_buffer *buffer;
+	int ret;
+
+	buffer =3D dell_smbios_get_buffer();
+	buffer->input[0] =3D 0x10000;
+	buffer->input[1] =3D 0x51534554;
+	buffer->input[3] =3D enable;
+	dell_smbios_send_request(17, 3);
+	ret =3D buffer->output[0];
+	dell_smbios_release_buffer();
+
+	return dell_smbios_error(ret);
+}
+
 static int __init dell_wmi_init(void)
 {
 	int err;
@@ -624,12 +676,26 @@ static int __init dell_wmi_init(void)
 		return -ENODEV;
 	}
=20
+	dmi_check_system(dell_wmi_smbios_list);
+
+	if (wmi_requires_smbios_request) {
+		err =3D dell_wmi_events_set_enabled(true);
+		if (err) {
+			pr_err("Failed to enable WMI events\n");
+			wmi_remove_notify_handler(DELL_EVENT_GUID);
+			dell_wmi_input_destroy();
+			return err;
+		}
+	}
+
 	return 0;
 }
 module_init(dell_wmi_init);
=20
 static void __exit dell_wmi_exit(void)
 {
+	if (wmi_requires_smbios_request)
+		dell_wmi_events_set_enabled(false);
 	wmi_remove_notify_handler(DELL_EVENT_GUID);
 	dell_wmi_input_destroy();
 }
--=20
1.7.10.4
