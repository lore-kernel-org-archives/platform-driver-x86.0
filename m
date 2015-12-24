From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 1/2] dell-wmi: Check if Dell WMI descriptor structure is valid
Date: Thu, 24 Dec 2015 22:18:45 +0100
Message-ID: <1450991926-20937-2-git-send-email-pali.rohar@gmail.com>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:38787 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753267AbbLXVS7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 24 Dec 2015 16:18:59 -0500
In-Reply-To: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

According to Dell WMI document mentioned in ML dicussion archived at
http://www.spinics.net/lists/platform-driver-x86/msg07220.html OS shoul=
d
check Dell WMI descriptor structure. Structure also provide Dell WMI
interface version which is used later.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
 drivers/platform/x86/dell-wmi.c |   78 +++++++++++++++++++++++++++++++=
+++++++-
 1 file changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
index 57402c4..09ee8ed 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -2,6 +2,7 @@
  * Dell WMI hotkeys
  *
  * Copyright (C) 2008 Red Hat <mjg@redhat.com>
+ * Copyright (C) 2014-2015 Pali Roh=C3=A1r <pali.rohar@gmail.com>
  *
  * Portions based on wistron_btns.c:
  * Copyright (C) 2005 Miloslav Trmac <mitr@volny.cz>
@@ -38,14 +39,18 @@
 #include <acpi/video.h>
=20
 MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
+MODULE_AUTHOR("Pali Roh=C3=A1r <pali.rohar@gmail.com>");
 MODULE_DESCRIPTION("Dell laptop WMI hotkeys driver");
 MODULE_LICENSE("GPL");
=20
 #define DELL_EVENT_GUID "9DBB5994-A997-11DA-B012-B622A1EF5492"
+#define DELL_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
=20
 static int acpi_video;
+static u32 dell_wmi_interface_version;
=20
 MODULE_ALIAS("wmi:"DELL_EVENT_GUID);
+MODULE_ALIAS("wmi:"DELL_DESCRIPTOR_GUID);
=20
 /*
  * Certain keys are flagged as KE_IGNORE. All of these are either
@@ -422,16 +427,85 @@ static void __init find_hk_type(const struct dmi_=
header *dm, void *dummy)
 	}
 }
=20
+/**
+ * Descriptor buffer is 128 byte long and contains:
+ *
+ *       Name             Offset  Length  Value
+ * Vendor Signature          0       4    "DELL"
+ * Object Signature          4       4    " WMI"
+ * WMI Interface Version     8       4    <version>
+ * WMI buffer length        12       4    4096
+ */
+static int __init dell_wmi_check_descriptor_buffer(void)
+{
+	struct acpi_buffer out =3D { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+	u32 *buffer;
+
+	status =3D wmi_query_block(DELL_DESCRIPTOR_GUID, 0, &out);
+	if (ACPI_FAILURE(status)) {
+		pr_err("Cannot read Dell descriptor buffer - %d\n", status);
+		return status;
+	}
+
+	obj =3D (union acpi_object *)out.pointer;
+	if (!obj) {
+		pr_err("Dell descriptor buffer is empty\n");
+		return -EINVAL;
+	}
+
+	if (obj->type !=3D ACPI_TYPE_BUFFER) {
+		pr_err("Cannot read Dell descriptor buffer\n");
+		kfree(obj);
+		return -EINVAL;
+	}
+
+	if (obj->buffer.length !=3D 128) {
+		pr_err("Dell descriptor buffer has invalid length (%d)\n",
+			obj->buffer.length);
+		kfree(obj);
+		return -EINVAL;
+	}
+
+	buffer =3D (u32 *)obj->buffer.pointer;
+
+	if (buffer[0] !=3D 0x4C4C4544 && buffer[1] !=3D 0x494D5720)
+		pr_warn("Dell descriptor buffer has invalid signature (%*ph)\n",
+			8, buffer);
+
+	if (buffer[2] !=3D 0 && buffer[2] !=3D 1)
+		pr_warn("Dell descriptor buffer has unknown version (%d)\n",
+			buffer[2]);
+
+	if (buffer[3] !=3D 4096)
+		pr_warn("Dell descriptor buffer has invalid buffer length (%d)\n",
+			buffer[3]);
+
+	dell_wmi_interface_version =3D buffer[2];
+
+	pr_info("Detected Dell WMI interface version %u\n",
+		dell_wmi_interface_version);
+
+	kfree(obj);
+	return 0;
+}
+
 static int __init dell_wmi_init(void)
 {
 	int err;
 	acpi_status status;
=20
-	if (!wmi_has_guid(DELL_EVENT_GUID)) {
-		pr_warn("No known WMI GUID found\n");
+	if (!wmi_has_guid(DELL_EVENT_GUID) ||
+	    !wmi_has_guid(DELL_DESCRIPTOR_GUID)) {
+		pr_warn("Dell WMI GUID were not found\n");
 		return -ENODEV;
 	}
=20
+	err =3D dell_wmi_check_descriptor_buffer();
+	if (err)
+		return err;
+
 	dmi_walk(find_hk_type, NULL);
 	acpi_video =3D acpi_video_get_backlight_type() !=3D acpi_backlight_ve=
ndor;
=20
--=20
1.7.9.5
