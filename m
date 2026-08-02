Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34CC28CF5F;
	Sun,  2 Aug 2026 12:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785674745; cv=none; b=EARUbzG4O9QQ8OWjgrZn8CjkTjJ6uuZjVsR9XYE3/kvlvAawg3OcTpDj4dVIqzPNACCDoTum//2QWSqcGrwxAP2T1dk765yrDir7SReZW2jI2kuiXBZm2IwwnoMpYmpw926r9ZwJLo4KaZd8Gdskq1p5LVMQPpjFLQ9CLttU02Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785674745; c=relaxed/simple;
	bh=NV+5pzOkQNrOPJCX6QWYMVQ7WXxsHTGWfmNwSy8ZG54=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=olMcrex/cPIVzCoLOPP2KgnRlqISbsROOVxB3WsfcGeL27PvAnhWkGGQb3NlatTaU/Y5YjqacJjTbxnvEag08ru0LvTWmlmZDCc+l3CB8+KxHBf6SH8XJpNXrvx+8GOMWEgd5pf3VSU+lsDkgKWJn9BLeMmkJt8T7n9D3kfH+pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=SOKDyXM3; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="SOKDyXM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785674737; x=1786279537; i=w_armin@gmx.de;
	bh=9AuHjNJx5jG0ncbLMqNfhmeoa/m7ZnjAOnZJCO5CV0c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SOKDyXM3rXlGMIQ/FROozl1ZM9EQ5eo2GHfcT5w2oULgrK2JdhzEMnNmHK9dFXK/
	 TX8n8f7WFIwEvIkKIUYPGfcY1dnOubwoumkOLTHvL5FA2GrXNEfvMbQ/nErlu7qZ7
	 8+2yZsNG8oAbgWpL5avXMh4Ch/lvaU8y3zpoSGmRKzAP/ciowrlka+60Sy/oE+F64
	 2ijW5XG+RiWSwTjFlwYx7KSM652nCLqPP35jmoD9TG3UELAfQnVGhsnaJGWOZW3CL
	 2GUKWRwql3f1Dvw+WaCopyuaNP43rzZoChHCK3wqxgQbo6q4PVgX+nUNusYZ2W+Vj
	 8wAy01HypGirf5mRuw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNcA-1xPqK03kBs-00kGq9; Sun, 02
 Aug 2026 14:45:36 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-wmi-aio: Convert to use the bus-based WMI API
Date: Sun,  2 Aug 2026 14:45:30 +0200
Message-Id: <20260802124530.7116-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qlrr5AyvwlLDhyHCg83NbDRdDaTLXCwY3XIAxF4Yq4LR+z+EPsS
 nAFIj2HX0oP4uePTXIL5rj2QHaFZgJ3QYhpZGpMOkxhFTCtNCS2qp/EQtCbtyU1pHVu4ipv
 tU8AnLtB1o6KzCztSbG6g2T5y79aH7GluU+j6c7XDn+3ugNfylzl2dsfvSxMu6jhDTTTkwV
 RxCaYB+myDmy4nciU2TLQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:l34HSmjVpPM=;ViYU0H4+RzK7n1DbslCFyTNfQnZ
 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
 9/XUuFA==

It turns out that some devices like the Dell Inspiron One 2310
contain multiple WMI event devices with a matching GUID of
284A0E6B-380E-472A-921F-E52786257FB4, each handling a separate
hotkey (volume up, volume down, ...). The dell-wmi-aio driver
however still uses the legacy GUID-based WMI API and can thus
only see the first of those WMI event devices, preventing the
remaining buttons from working.

Fix this by converting the driver to use the modern bus-based
WMI API. This also includes replacing the usage of
union acpi_object with struct wmi_buffer.

Tested using the ACPI-WMI ASL code from the Dell Inspiron One 2310
together with some changes to allow injecting events.

Link: https://linux-hardware.org/?probe=3De86d77e44d
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-wmi-aio.c | 198 +++++++++--------------
 1 file changed, 78 insertions(+), 120 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-aio.c b/drivers/platform/x=
86/dell/dell-wmi-aio.c
index 54096495719b..8849ad93480b 100644
=2D-- a/drivers/platform/x86/dell/dell-wmi-aio.c
+++ b/drivers/platform/x86/dell/dell-wmi-aio.c
@@ -5,14 +5,20 @@
=20
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
+#include <linux/cleanup.h>
+#include <linux/compiler_attributes.h>
+#include <linux/device.h>
+#include <linux/device/driver.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/overflow.h>
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
-#include <linux/acpi.h>
 #include <linux/string.h>
+#include <linux/wmi.h>
=20
 MODULE_DESCRIPTION("WMI hotkeys driver for Dell All-In-One series");
 MODULE_LICENSE("GPL");
@@ -20,22 +26,19 @@ MODULE_LICENSE("GPL");
 #define EVENT_GUID1 "284A0E6B-380E-472A-921F-E52786257FB4"
 #define EVENT_GUID2 "02314822-307C-4F66-BF0E-48AEAEB26CC8"
=20
+struct dell_wmi_aio_data {
+	struct input_dev *input_device;
+	/* Protects the input sequence */
+	struct mutex input_lock;
+};
+
 struct dell_wmi_event {
-	u16	length;
+	__le16	length;
 	/* 0x000: A hot key pressed or an event occurred
 	 * 0x00F: A sequence of hot keys are pressed */
-	u16	type;
-	u16	event[];
-};
-
-static const char *dell_wmi_aio_guids[] =3D {
-	EVENT_GUID1,
-	EVENT_GUID2,
-	NULL
-};
-
-MODULE_ALIAS("wmi:"EVENT_GUID1);
-MODULE_ALIAS("wmi:"EVENT_GUID2);
+	__le16	type;
+	__le16	event[];
+} __packed;
=20
 static const struct key_entry dell_wmi_aio_keymap[] =3D {
 	{ KE_KEY, 0xc0, { KEY_VOLUMEUP } },
@@ -50,137 +53,92 @@ static const struct key_entry dell_wmi_aio_keymap[] =
=3D {
 	{ KE_END, 0 }
 };
=20
-static struct input_dev *dell_wmi_aio_input_dev;
-
 /*
  * The new WMI event data format will follow the dell_wmi_event structure
  * So, we will check if the buffer matches the format
  */
-static bool dell_wmi_aio_event_check(u8 *buffer, int length)
+static bool dell_wmi_aio_event_check(const struct wmi_buffer *buffer)
 {
-	struct dell_wmi_event *event =3D (struct dell_wmi_event *)buffer;
+	struct dell_wmi_event *event;
+	u16 length, type;
=20
-	if (event =3D=3D NULL || length < 6)
+	if (buffer->length < struct_size(event, event, 1))
 		return false;
=20
-	if ((event->type =3D=3D 0 || event->type =3D=3D 0xf) &&
-			event->length >=3D 2)
+	event =3D buffer->data;
+	length =3D le16_to_cpu(event->length);
+	type =3D le16_to_cpu(event->type);
+	if ((type =3D=3D 0 || type =3D=3D 0xf) && length >=3D 2)
 		return true;
=20
 	return false;
 }
=20
-static void dell_wmi_aio_notify(union acpi_object *obj, void *context)
+static void dell_wmi_aio_notify(struct wmi_device *wdev, const struct wmi=
_buffer *data)
 {
-	struct dell_wmi_event *event;
-
-	if (obj) {
-		unsigned int scancode =3D 0;
-
-		switch (obj->type) {
-		case ACPI_TYPE_INTEGER:
-			/* Most All-In-One correctly return integer scancode */
-			scancode =3D obj->integer.value;
-			sparse_keymap_report_event(dell_wmi_aio_input_dev,
-				scancode, 1, true);
-			break;
-		case ACPI_TYPE_BUFFER:
-			if (dell_wmi_aio_event_check(obj->buffer.pointer,
-						obj->buffer.length)) {
-				event =3D (struct dell_wmi_event *)
-					obj->buffer.pointer;
-				scancode =3D event->event[0];
-			} else {
-				/* Broken machines return the scancode in a
-				   buffer */
-				if (obj->buffer.pointer &&
-						obj->buffer.length > 0)
-					scancode =3D obj->buffer.pointer[0];
-			}
-			if (scancode)
-				sparse_keymap_report_event(
-					dell_wmi_aio_input_dev,
-					scancode, 1, true);
-			break;
-		}
-	}
-}
-
-static int __init dell_wmi_aio_input_setup(void)
-{
-	int err;
-
-	dell_wmi_aio_input_dev =3D input_allocate_device();
-
-	if (!dell_wmi_aio_input_dev)
-		return -ENOMEM;
-
-	dell_wmi_aio_input_dev->name =3D "Dell AIO WMI hotkeys";
-	dell_wmi_aio_input_dev->phys =3D "wmi/input0";
-	dell_wmi_aio_input_dev->id.bustype =3D BUS_HOST;
-
-	err =3D sparse_keymap_setup(dell_wmi_aio_input_dev,
-			dell_wmi_aio_keymap, NULL);
-	if (err) {
-		pr_err("Unable to setup input device keymap\n");
-		goto err_free_dev;
-	}
-	err =3D input_register_device(dell_wmi_aio_input_dev);
-	if (err) {
-		pr_info("Unable to register input device\n");
-		goto err_free_dev;
+	struct dell_wmi_aio_data *drvdata =3D dev_get_drvdata(&wdev->dev);
+	const struct dell_wmi_event *new_event;
+	unsigned int scancode;
+	const u8 *old_event;
+
+	if (dell_wmi_aio_event_check(data)) {
+		new_event =3D data->data;
+		scancode =3D le16_to_cpu(new_event->event[0]);
+	} else {
+		old_event =3D data->data;
+		scancode =3D old_event[0];
 	}
-	return 0;
-
-err_free_dev:
-	input_free_device(dell_wmi_aio_input_dev);
-	return err;
-}
-
-static const char *dell_wmi_aio_find(void)
-{
-	int i;
=20
-	for (i =3D 0; dell_wmi_aio_guids[i] !=3D NULL; i++)
-		if (wmi_has_guid(dell_wmi_aio_guids[i]))
-			return dell_wmi_aio_guids[i];
+	guard(mutex)(&drvdata->input_lock);
=20
-	return NULL;
+	sparse_keymap_report_event(drvdata->input_device, scancode, 1, true);
 }
=20
-static int __init dell_wmi_aio_init(void)
+static int dell_wmi_aio_probe(struct wmi_device *wdev, const void *contex=
t)
 {
-	int err;
-	const char *guid;
+	struct dell_wmi_aio_data *data;
+	int ret;
=20
-	guid =3D dell_wmi_aio_find();
-	if (!guid) {
-		pr_warn("No known WMI GUID found\n");
-		return -ENXIO;
-	}
+	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
=20
-	err =3D dell_wmi_aio_input_setup();
-	if (err)
-		return err;
+	dev_set_drvdata(&wdev->dev, data);
+	ret =3D devm_mutex_init(&wdev->dev, &data->input_lock);
+	if (ret < 0)
+		return ret;
=20
-	err =3D wmi_install_notify_handler(guid, dell_wmi_aio_notify, NULL);
-	if (err) {
-		pr_err("Unable to register notify handler - %d\n", err);
-		input_unregister_device(dell_wmi_aio_input_dev);
-		return err;
-	}
+	data->input_device =3D devm_input_allocate_device(&wdev->dev);
+	if (!data->input_device)
+		return -ENOMEM;
=20
-	return 0;
-}
+	data->input_device->name =3D "Dell AIO WMI hotkeys";
+	data->input_device->phys =3D "wmi/input0";
+	data->input_device->id.bustype =3D BUS_HOST;
=20
-static void __exit dell_wmi_aio_exit(void)
-{
-	const char *guid;
+	ret =3D sparse_keymap_setup(data->input_device, dell_wmi_aio_keymap, NUL=
L);
+	if (ret < 0)
+		return ret;
=20
-	guid =3D dell_wmi_aio_find();
-	wmi_remove_notify_handler(guid);
-	input_unregister_device(dell_wmi_aio_input_dev);
+	return input_register_device(data->input_device);
 }
=20
-module_init(dell_wmi_aio_init);
-module_exit(dell_wmi_aio_exit);
+static const struct wmi_device_id dell_wmi_aio_id_table[] =3D {
+	{ EVENT_GUID1, NULL },
+	{ EVENT_GUID2, NULL },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, dell_wmi_aio_id_table);
+
+static struct wmi_driver dell_wmi_aio_driver =3D {
+	.driver =3D {
+		.name =3D "dell-wmi-aio",
+		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table =3D dell_wmi_aio_id_table,
+	.probe =3D dell_wmi_aio_probe,
+	.notify_new =3D dell_wmi_aio_notify,
+	.min_event_size =3D sizeof(u8),
+	.no_singleton =3D true,
+};
+module_wmi_driver(dell_wmi_aio_driver);
=2D-=20
2.39.5

