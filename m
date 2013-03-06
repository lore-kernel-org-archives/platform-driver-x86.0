From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] dell: add new dell WMI format for the AIO machines
Date: Wed,  6 Mar 2013 15:51:18 +0800
Message-ID: <1362556278-19571-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ia0-f170.google.com ([209.85.210.170]:56942 "EHLO
	mail-ia0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754142Ab3CFHv0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 Mar 2013 02:51:26 -0500
Received: by mail-ia0-f170.google.com with SMTP id h8so1908055iaa.15
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Mar 2013 23:51:25 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Colin Ian King <colin.king@canonical.com>

There is a new DELL WMI spec. with new WMI event format.
I'm working on the AIO machines, but I think the new format will apply to
all the Dell's machines, not only for AIO, which will be released later
this year.

The new format of the WMI buffer is shown as below
word 0 - the number of words following in the WMI buffer(not including
        this word.
word 1 - the event type
	0x0000 - A hot key is pressed or an event occurred
	0x000F - A sequence of hot keys are pressed
word 2 and on - the event data

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/dell-wmi-aio.c | 50 +++++++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi-aio.c b/drivers/platform/x86/dell-wmi-aio.c
index 3f94545..d77fa86 100644
--- a/drivers/platform/x86/dell-wmi-aio.c
+++ b/drivers/platform/x86/dell-wmi-aio.c
@@ -34,6 +34,14 @@ MODULE_LICENSE("GPL");
 #define EVENT_GUID1 "284A0E6B-380E-472A-921F-E52786257FB4"
 #define EVENT_GUID2 "02314822-307C-4F66-BF0E-48AEAEB26CC8"
 
+struct dell_wmi_event {
+	u16	length;
+	/* 0x000: A hot key pressed or an event occurred
+	 * 0x00F: A sequence of hot keys are pressed */
+	u16	type;
+	u16	event[];
+};
+
 static const char *dell_wmi_aio_guids[] = {
 	EVENT_GUID1,
 	EVENT_GUID2,
@@ -46,11 +54,35 @@ MODULE_ALIAS("wmi:"EVENT_GUID2);
 static const struct key_entry dell_wmi_aio_keymap[] = {
 	{ KE_KEY, 0xc0, { KEY_VOLUMEUP } },
 	{ KE_KEY, 0xc1, { KEY_VOLUMEDOWN } },
+	{ KE_KEY, 0xe030, { KEY_VOLUMEUP } },
+	{ KE_KEY, 0xe02e, { KEY_VOLUMEDOWN } },
+	{ KE_KEY, 0xe020, { KEY_MUTE } },
+	{ KE_KEY, 0xe027, { KEY_DISPLAYTOGGLE } },
+	{ KE_KEY, 0xe006, { KEY_BRIGHTNESSUP } },
+	{ KE_KEY, 0xe005, { KEY_BRIGHTNESSDOWN } },
+	{ KE_KEY, 0xe00b, { KEY_SWITCHVIDEOMODE } },
 	{ KE_END, 0 }
 };
 
 static struct input_dev *dell_wmi_aio_input_dev;
 
+/*
+ * The new WMI event data format will follow the dell_wmi_event structure
+ * So, we will check if the buffer matches the format
+ */
+static bool dell_wmi_aio_event_check(u8 *buffer)
+{
+	dell_wmi_event *event = (dell_wmi_event *)buffer;
+
+	/* longest length is 6 right now */
+	if (event->length > 10)
+		return false;
+	if (event->type != 0 && event->type != 0xf)
+		return false;
+
+	return true;
+}
+
 static void dell_wmi_aio_notify(u32 value, void *context)
 {
 	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
@@ -65,7 +97,7 @@ static void dell_wmi_aio_notify(u32 value, void *context)
 
 	obj = (union acpi_object *)response.pointer;
 	if (obj) {
-		unsigned int scancode;
+		unsigned int scancode = 0;
 
 		switch (obj->type) {
 		case ACPI_TYPE_INTEGER:
@@ -75,13 +107,21 @@ static void dell_wmi_aio_notify(u32 value, void *context)
 				scancode, 1, true);
 			break;
 		case ACPI_TYPE_BUFFER:
-			/* Broken machines return the scancode in a buffer */
-			if (obj->buffer.pointer && obj->buffer.length > 0) {
-				scancode = obj->buffer.pointer[0];
+			if (dell_wmi_aio_event_check(obj->buffer.pointer)) {
+				dell_wmi_event *event =
+					(dell_wmi_event *)obj->buffer.pointer;
+				scancode = event->event[0];
+			} else {
+				/* Broken machines return the scancode in a
+				   buffer */
+				if (obj->buffer.pointer &&
+						obj->buffer.length > 0)
+					scancode = obj->buffer.pointer[0];
+			}
+			if (scancode)
 				sparse_keymap_report_event(
 					dell_wmi_aio_input_dev,
 					scancode, 1, true);
-			}
 			break;
 		}
 	}
-- 
1.8.1.2
