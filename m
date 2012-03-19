From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH 2/2] acer-wmi: fix out of input parameter size when set
Date: Mon, 19 Mar 2012 17:37:33 +0800
Message-ID: <1332149854-2576-2-git-send-email-jlee@suse.com>
References: <1332149854-2576-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:35665 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754173Ab2CSJjY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Mar 2012 05:39:24 -0400
Received: by obbeh20 with SMTP id eh20so893796obb.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Mar 2012 02:39:23 -0700 (PDT)
In-Reply-To: <1332149854-2576-1-git-send-email-jlee@suse.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

From: "Lee, Chun-Yi" <jlee@suse.com>

The input parameter of set device status is different with get device
status. There have volume value element for set status but don't need
for get action.

On Acer TravelMate 4750 creates field on volume value element even
doesn't use it in DSDT. So, add this patch for separate input paramter
between set device status with get status.

Tested on Acer TravelMate 4750

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |   38 ++++++++++++++++++++++++++------------
 1 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index e1266b5..904ad65 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -153,7 +153,14 @@ struct lm_return_value {
 	u16 reserved;
 } __attribute__((packed));
 
-struct wmid3_gds_input_param {	/* Get Device Status input parameter */
+struct wmid3_gds_set_input_param {     /* Set Device Status input parameter */
+	u8 function_num;        /* Function Number */
+	u8 hotkey_number;       /* Hotkey Number */
+	u16 devices;            /* Set Device */
+	u8 volume_value;        /* Volume Value */
+} __attribute__((packed));
+
+struct wmid3_gds_get_input_param {     /* Get Device Status input parameter */
 	u8 function_num;	/* Function Number */
 	u8 hotkey_number;	/* Hotkey Number */
 	u16 devices;		/* Get Device */
@@ -918,13 +925,13 @@ static acpi_status wmid3_get_device_status(u32 *value, u16 device)
 	struct wmid3_gds_return_value return_value;
 	acpi_status status;
 	union acpi_object *obj;
-	struct wmid3_gds_input_param params = {
+	struct wmid3_gds_get_input_param params = {
 		.function_num = 0x1,
 		.hotkey_number = commun_fn_key_number,
 		.devices = device,
 	};
 	struct acpi_buffer input = {
-		sizeof(struct wmid3_gds_input_param),
+		sizeof(struct wmid3_gds_get_input_param),
 		&params
 	};
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
@@ -987,19 +994,28 @@ static acpi_status wmid3_set_device_status(u32 value, u16 device)
 	acpi_status status;
 	union acpi_object *obj;
 	u16 devices;
-	struct wmid3_gds_input_param params = {
+	struct wmid3_gds_get_input_param get_params = {
 		.function_num = 0x1,
 		.hotkey_number = commun_fn_key_number,
 		.devices = commun_func_bitmap,
 	};
-	struct acpi_buffer input = {
-		sizeof(struct wmid3_gds_input_param),
-		&params
+	struct acpi_buffer get_input = {
+		sizeof(struct wmid3_gds_get_input_param),
+		&get_params
+	};
+	struct wmid3_gds_set_input_param set_params = {
+		.function_num = 0x2,
+		.hotkey_number = commun_fn_key_number,
+		.devices = commun_func_bitmap,
+	};
+	struct acpi_buffer set_input = {
+		sizeof(struct wmid3_gds_set_input_param),
+		&set_params
 	};
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 	struct acpi_buffer output2 = { ACPI_ALLOCATE_BUFFER, NULL };
 
-	status = wmi_evaluate_method(WMID_GUID3, 0, 0x2, &input, &output);
+	status = wmi_evaluate_method(WMID_GUID3, 0, 0x2, &get_input, &output);
 	if (ACPI_FAILURE(status))
 		return status;
 
@@ -1028,11 +1044,9 @@ static acpi_status wmid3_set_device_status(u32 value, u16 device)
 	}
 
 	devices = return_value.devices;
-	params.function_num = 0x2;
-	params.hotkey_number = commun_fn_key_number;
-	params.devices = (value) ? (devices | device) : (devices & ~device);
+	set_params.devices = (value) ? (devices | device) : (devices & ~device);
 
-	status = wmi_evaluate_method(WMID_GUID3, 0, 0x1, &input, &output2);
+	status = wmi_evaluate_method(WMID_GUID3, 0, 0x1, &set_input, &output2);
 	if (ACPI_FAILURE(status))
 		return status;
 
-- 
1.7.7
