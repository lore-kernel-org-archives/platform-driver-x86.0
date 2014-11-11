From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v2] dell-wmi: Update code for processing WMI events
Date: Tue, 11 Nov 2014 20:21:22 +0100
Message-ID: <1415733682-8699-1-git-send-email-pali.rohar@gmail.com>
References: <20141111060243.GC56947@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:34890 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751287AbaKKTVk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 11 Nov 2014 14:21:40 -0500
In-Reply-To: <20141111060243.GC56947@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

WMI buffer can contains more events. First value in buffer is length of=
 event
followed by data of specified length. After that is next length and nex=
t data.
When length is zero then there is no more events in bufffer.

This patch adds support for processing all events in buffer (not only f=
irst)
and parse more event types (not only hotkey events). Because of variabl=
e length
of events sometimes BIOS fills more hotkeys (or other values) into sing=
le WMI
event. In this case this patch process also these multiple hotkeys (and=
 not
only first one).

Some event types are just ignored because kernel is not interested for =
them
(e.g. NIC Link status, battery unplug, ...).

This patch is based on DSDT table from Dell Latitude E6440. Code should=
 be
backward compatible so will process other events of old types same as b=
efore
this patch.

This patch also fixes problem when in kernel log are written messages a=
bout
unknown WMI events. Now all know events are parsed and those which are =
not
interesting for kernel are dropped without unknown message.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Tested-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
Changes since v1:
* change some pr_info calls with pr_warn
* fix coding style
---
 drivers/platform/x86/dell-wmi.c |  159 +++++++++++++++++++++++++++++++=
--------
 1 file changed, 128 insertions(+), 31 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
index 25721bf..e2b6a64 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -145,57 +145,154 @@ static const u16 bios_to_linux_keycode[256] __in=
itconst =3D {
=20
 static struct input_dev *dell_wmi_input_dev;
=20
+static void dell_wmi_process_key(int reported_key)
+{
+	const struct key_entry *key;
+
+	key =3D sparse_keymap_entry_from_scancode(dell_wmi_input_dev,
+						reported_key);
+	if (!key) {
+		pr_info("Unknown key %x pressed\n", reported_key);
+		return;
+	}
+
+	pr_debug("Key %x pressed\n", reported_key);
+
+	/* Don't report brightness notifications that will also come via ACPI=
 */
+	if ((key->keycode =3D=3D KEY_BRIGHTNESSUP ||
+	     key->keycode =3D=3D KEY_BRIGHTNESSDOWN) && acpi_video)
+		return;
+
+	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
+}
+
 static void dell_wmi_notify(u32 value, void *context)
 {
 	struct acpi_buffer response =3D { ACPI_ALLOCATE_BUFFER, NULL };
 	union acpi_object *obj;
 	acpi_status status;
+	acpi_size buffer_size;
+	u16 *buffer_entry, *buffer_end;
+	int len, i;
=20
 	status =3D wmi_get_event_data(value, &response);
 	if (status !=3D AE_OK) {
-		pr_info("bad event status 0x%x\n", status);
+		pr_warn("bad event status 0x%x\n", status);
 		return;
 	}
=20
 	obj =3D (union acpi_object *)response.pointer;
+	if (!obj) {
+		pr_warn("no response\n");
+		return;
+	}
=20
-	if (obj && obj->type =3D=3D ACPI_TYPE_BUFFER) {
-		const struct key_entry *key;
-		int reported_key;
-		u16 *buffer_entry =3D (u16 *)obj->buffer.pointer;
-		int buffer_size =3D obj->buffer.length/2;
-
-		if (buffer_size >=3D 2 && dell_new_hk_type && buffer_entry[1] !=3D 0=
x10) {
-			pr_info("Received unknown WMI event (0x%x)\n",
-				buffer_entry[1]);
-			kfree(obj);
-			return;
-		}
+	if (obj->type !=3D ACPI_TYPE_BUFFER) {
+		pr_warn("bad response type %x\n", obj->type);
+		kfree(obj);
+		return;
+	}
+
+	pr_debug("Received WMI event (%*ph)\n",
+		obj->buffer.length, obj->buffer.pointer);
=20
-		if (buffer_size >=3D 3 && (dell_new_hk_type || buffer_entry[1] =3D=3D=
 0x0))
-			reported_key =3D (int)buffer_entry[2];
+	buffer_entry =3D (u16 *)obj->buffer.pointer;
+	buffer_size =3D obj->buffer.length/2;
+
+	if (!dell_new_hk_type) {
+		if (buffer_size >=3D 3 && buffer_entry[1] =3D=3D 0x0)
+			dell_wmi_process_key(buffer_entry[2]);
 		else if (buffer_size >=3D 2)
-			reported_key =3D (int)buffer_entry[1] & 0xffff;
-		else {
+			dell_wmi_process_key(buffer_entry[1]);
+		else
 			pr_info("Received unknown WMI event\n");
-			kfree(obj);
-			return;
+		kfree(obj);
+		return;
+	}
+
+	buffer_end =3D buffer_entry + buffer_size;
+
+	while (buffer_entry < buffer_end) {
+
+		len =3D buffer_entry[0];
+		if (len =3D=3D 0)
+			break;
+
+		len++;
+
+		if (buffer_entry + len > buffer_end) {
+			pr_warn("Invalid length of WMI event\n");
+			break;
 		}
=20
-		key =3D sparse_keymap_entry_from_scancode(dell_wmi_input_dev,
-							reported_key);
-		if (!key) {
-			pr_info("Unknown key %x pressed\n", reported_key);
-		} else if ((key->keycode =3D=3D KEY_BRIGHTNESSUP ||
-			    key->keycode =3D=3D KEY_BRIGHTNESSDOWN) && acpi_video) {
-			/* Don't report brightness notifications that will also
-			 * come via ACPI */
-			;
-		} else {
-			sparse_keymap_report_entry(dell_wmi_input_dev, key,
-						   1, true);
+		pr_debug("Process buffer (%*ph)\n", len*2, buffer_entry);
+
+		switch (buffer_entry[1]) {
+		case 0x00:
+			for (i =3D 2; i < len; ++i) {
+				switch (buffer_entry[i]) {
+				case 0xe043:
+					/* NIC Link is Up */
+					pr_debug("NIC Link is Up\n");
+					break;
+				case 0xe044:
+					/* NIC Link is Down */
+					pr_debug("NIC Link is Down\n");
+					break;
+				case 0xe045:
+					/* Unknown event but defined in DSDT */
+				default:
+					/* Unknown event */
+					pr_info("Unknown WMI event type 0x00: "
+						"0x%x\n", (int)buffer_entry[i]);
+					break;
+				}
+			}
+			break;
+		case 0x10:
+			/* Keys pressed */
+			for (i =3D 2; i < len; ++i)
+				dell_wmi_process_key(buffer_entry[i]);
+			break;
+		case 0x11:
+			for (i =3D 2; i < len; ++i) {
+				switch (buffer_entry[i]) {
+				case 0xfff0:
+					/* Battery unplugged */
+					pr_debug("Battery unplugged\n");
+					break;
+				case 0xfff1:
+					/* Battery inserted */
+					pr_debug("Battery inserted\n");
+					break;
+				case 0x01e1:
+				case 0x02ea:
+				case 0x02eb:
+				case 0x02ec:
+				case 0x02f6:
+					/* Keyboard backlight level changed */
+					pr_debug("Keyboard backlight level "
+						 "changed\n");
+					break;
+				default:
+					/* Unknown event */
+					pr_info("Unknown WMI event type 0x11: "
+						"0x%x\n", (int)buffer_entry[i]);
+					break;
+				}
+			}
+			break;
+		default:
+			/* Unknown event */
+			pr_info("Unknown WMI event type 0x%x\n",
+				(int)buffer_entry[1]);
+			break;
 		}
+
+		buffer_entry +=3D len;
+
 	}
+
 	kfree(obj);
 }
=20
--=20
1.7.9.5
