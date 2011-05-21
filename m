From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH 4/4] acer-wmi: support to set communication device state by new wmid method
Date: Sun, 22 May 2011 07:33:54 +0800
Message-ID: <1306020834-5186-5-git-send-email-jlee@novell.com>
References: <1306020834-5186-1-git-send-email-jlee@novell.com>
 <1306020834-5186-2-git-send-email-jlee@novell.com>
 <1306020834-5186-3-git-send-email-jlee@novell.com>
 <1306020834-5186-4-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f173.google.com ([209.85.212.173]:61624 "EHLO
	mail-px0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757263Ab1EUXf2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 21 May 2011 19:35:28 -0400
Received: by pxi16 with SMTP id 16so3226370pxi.4
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 May 2011 16:35:28 -0700 (PDT)
In-Reply-To: <1306020834-5186-4-git-send-email-jlee@novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

Have many Acer notebooks' BIOS already support new WMID_GUID3 method.
On those machines, that will be better set communication device by
evaluate WMID_GUID3 method.

Tested on Acer Travelmate 8572

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 drivers/platform/x86/acer-wmi.c |  111 ++++++++++++++++++++++++++++++++++++++-
 1 files changed, 110 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 73a7b63..a36937c 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -122,6 +122,7 @@ struct event_return_value {
  */
 #define ACER_WMID3_GDS_WIRELESS		(1<<0)	/* WiFi */
 #define ACER_WMID3_GDS_THREEG		(1<<6)	/* 3G */
+#define ACER_WMID3_GDS_WIMAX		(1<<7)	/* WiMAX */
 #define ACER_WMID3_GDS_BLUETOOTH	(1<<11)	/* BT */
 
 struct lm_input_params {
@@ -1129,6 +1130,114 @@ static acpi_status get_device_status(u32 *value, u32 cap)
 	}
 }
 
+static acpi_status wmid3_set_device_status(u32 value, u16 device)
+{
+	struct wmid3_gds_return_value return_value;
+	acpi_status status;
+	union acpi_object *obj;
+	u16 devices;
+	struct wmid3_gds_input_param params = {
+		.function_num = 0x1,
+		.hotkey_number = 0x01,
+		.devices = ACER_WMID3_GDS_WIRELESS &
+				ACER_WMID3_GDS_THREEG &
+				ACER_WMID3_GDS_WIMAX &
+				ACER_WMID3_GDS_BLUETOOTH,
+	};
+	struct acpi_buffer input = {
+		sizeof(struct wmid3_gds_input_param),
+		&params
+	};
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer output2 = { ACPI_ALLOCATE_BUFFER, NULL };
+
+	status = wmi_evaluate_method(WMID_GUID3, 0, 0x2, &input, &output);
+	if (ACPI_FAILURE(status))
+		return status;
+
+	obj = output.pointer;
+
+	if (!obj)
+		return AE_ERROR;
+	else if (obj->type != ACPI_TYPE_BUFFER) {
+		kfree(obj);
+		return AE_ERROR;
+	}
+	if (obj->buffer.length != 8) {
+		pr_warning("Unknown buffer length %d\n", obj->buffer.length);
+		kfree(obj);
+		return AE_ERROR;
+	}
+
+	return_value = *((struct wmid3_gds_return_value *)obj->buffer.pointer);
+	kfree(obj);
+
+	if (return_value.error_code || return_value.ec_return_value) {
+		pr_warning("Get Current Device Status failed: "
+			"0x%x - 0x%x\n", return_value.error_code,
+			return_value.ec_return_value);
+		return status;
+	}
+
+	devices = return_value.devices;
+	params.function_num = 0x2;
+	params.hotkey_number = 0x01;
+	params.devices = (value) ? (devices | device) : (devices & ~device);
+
+	status = wmi_evaluate_method(WMID_GUID3, 0, 0x1, &input, &output2);
+	if (ACPI_FAILURE(status))
+		return status;
+
+	obj = output2.pointer;
+
+	if (!obj)
+		return AE_ERROR;
+	else if (obj->type != ACPI_TYPE_BUFFER) {
+		kfree(obj);
+		return AE_ERROR;
+	}
+	if (obj->buffer.length != 4) {
+		pr_warning("Unknown buffer length %d\n", obj->buffer.length);
+		kfree(obj);
+		return AE_ERROR;
+	}
+
+	return_value = *((struct wmid3_gds_return_value *)obj->buffer.pointer);
+	kfree(obj);
+
+	if (return_value.error_code || return_value.ec_return_value)
+		pr_warning("Set Device Status failed: "
+			"0x%x - 0x%x\n", return_value.error_code,
+			return_value.ec_return_value);
+
+	return status;
+}
+
+static acpi_status set_device_status(u32 value, u32 cap)
+{
+	if (wmi_has_guid(WMID_GUID3)) {
+		u16 device;
+
+		switch (cap) {
+		case ACER_CAP_WIRELESS:
+			device = ACER_WMID3_GDS_WIRELESS;
+			break;
+		case ACER_CAP_BLUETOOTH:
+			device = ACER_WMID3_GDS_BLUETOOTH;
+			break;
+		case ACER_CAP_THREEG:
+			device = ACER_WMID3_GDS_THREEG;
+			break;
+		default:
+			return AE_ERROR;
+		}
+		return wmid3_set_device_status(value, device);
+
+	} else {
+		return set_u32(value, cap);
+	}
+}
+
 /*
  * Rfkill devices
  */
@@ -1165,7 +1274,7 @@ static int acer_rfkill_set(void *data, bool blocked)
 	u32 cap = (unsigned long)data;
 
 	if (rfkill_inited) {
-		status = set_u32(!blocked, cap);
+		status = set_device_status(!blocked, cap);
 		if (ACPI_FAILURE(status))
 			return -ENODEV;
 	}
-- 
1.6.0.2
