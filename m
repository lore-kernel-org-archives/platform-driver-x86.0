From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v3 3/5] dell-wmi: enable receiving WMI events on Dell Vostro V131
Date: Tue, 16 Feb 2016 15:50:28 +0100
Message-ID: <1455634230-1487-4-git-send-email-kernel@kempniu.pl>
References: <20160121090401.GR7192@pali>
 <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
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
 drivers/platform/x86/dell-wmi.c |   49 +++++++++++++++++++++++++++++++=
++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
index 3e4d9c3..5ceb53a 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -122,6 +122,7 @@ config DELL_WMI
 	depends on ACPI_WMI
 	depends on INPUT
 	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
+	depends on DELL_SMBIOS
 	select INPUT_SPARSEKMAP
 	---help---
 	  Say Y here if you want to support WMI-based hotkeys on Dell laptops=
=2E
diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
index 368e193..ca8233a 100644
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
@@ -513,6 +533,7 @@ static int __init dell_wmi_init(void)
 {
 	int err;
 	acpi_status status;
+	struct calling_interface_buffer *buffer;
=20
 	if (!wmi_has_guid(DELL_EVENT_GUID) ||
 	    !wmi_has_guid(DELL_DESCRIPTOR_GUID)) {
@@ -538,12 +559,40 @@ static int __init dell_wmi_init(void)
 		return -ENODEV;
 	}
=20
+	dmi_check_system(dell_wmi_smbios_list);
+
+	if (wmi_requires_smbios_request) {
+		buffer =3D dell_smbios_get_buffer();
+		buffer->input[0] =3D 0x10000;
+		buffer->input[1] =3D 0x51534554;
+		buffer->input[3] =3D 0x1;
+		dell_smbios_send_request(17, 3);
+		err =3D buffer->output[0];
+		dell_smbios_release_buffer();
+		if (err) {
+			pr_err("Failed to enable WMI (error %d)\n", err);
+			wmi_remove_notify_handler(DELL_EVENT_GUID);
+			dell_wmi_input_destroy();
+			return dell_smbios_error(err);
+		}
+	}
+
 	return 0;
 }
 module_init(dell_wmi_init);
=20
 static void __exit dell_wmi_exit(void)
 {
+	struct calling_interface_buffer *buffer;
+
+	if (wmi_requires_smbios_request) {
+		buffer =3D dell_smbios_get_buffer();
+		buffer->input[0] =3D 0x10000;
+		buffer->input[1] =3D 0x51534554;
+		dell_smbios_send_request(17, 3);
+		dell_smbios_release_buffer();
+	}
+
 	wmi_remove_notify_handler(DELL_EVENT_GUID);
 	dell_wmi_input_destroy();
 }
--=20
1.7.10.4
