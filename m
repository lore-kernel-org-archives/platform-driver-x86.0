From: Marco Chiappero <marco@absence.it>
Subject: [PATCH V2 RESEND 8/14] sony-laptop: sony_nc_notify rewritten and
 improved
Date: Tue, 13 Sep 2011 22:47:12 +0200
Message-ID: <1315946832.14415.138.camel@air.vesuvio.absence.it>
References: <1315585214.3613.51.camel@vesuvio>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from s1.powermailhost.com ([93.95.221.60]:33812 "EHLO
	s1.powermailhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756122Ab1IMUrO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Sep 2011 16:47:14 -0400
In-Reply-To: <1315585214.3613.51.camel@vesuvio>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

sony_nc_notify rewritten (and placed near the other acpi callbacks), the
hotkey decoding code moved to a new function sony_nc_hotkeys_decode.


Signed-off-by: Marco Chiappero <marco@absence.it> 
--- 

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1151,62 +1151,6 @@ static struct sony_nc_event sony_127_eve
 /*
  * ACPI callbacks
  */
-static void sony_nc_notify(struct acpi_device *device, u32 event)
-{
-	u32 ev = event;
-
-	if (ev >= 0x90) {
-		/* New-style event */
-		unsigned int result;
-		int key_handle = 0;
-		ev -= 0x90;
-
-		if (sony_find_snc_handle(0x100) == ev)
-			key_handle = 0x100;
-		if (sony_find_snc_handle(0x127) == ev)
-			key_handle = 0x127;
-
-		if (key_handle) {
-			struct sony_nc_event *key_event;
-
-			if (sony_call_snc_handle(key_handle, 0x200, &result)) {
-				dprintk("sony_nc_notify, unable to decode"
-					" event 0x%.2x 0x%.2x\n", key_handle,
-					ev);
-				/* restore the original event */
-				ev = event;
-			} else {
-				ev = result & 0xFF;
-
-				if (key_handle == 0x100)
-					key_event = sony_100_events;
-				else
-					key_event = sony_127_events;
-
-				for (; key_event->data; key_event++) {
-					if (key_event->data == ev) {
-						ev = key_event->event;
-						break;
-					}
-				}
-
-				if (!key_event->data)
-					pr_info("Unknown event: 0x%x 0x%x\n",
-						key_handle, ev);
-				else
-					sony_laptop_report_input_event(ev);
-			}
-		} else if (sony_find_snc_handle(sony_rfkill_handle) == ev) {
-			sony_nc_rfkill_update();
-			return;
-		}
-	} else
-		sony_laptop_report_input_event(ev);
-
-	dprintk("sony_nc_notify, event: 0x%.2x\n", ev);
-	acpi_bus_generate_proc_event(sony_nc_acpi_device, 1, ev);
-}
-
 static acpi_status sony_walk_callback(acpi_handle handle, u32 level,
 				      void *context, void **return_value)
 {
@@ -1237,6 +1181,41 @@ static int sony_nc_function_setup(unsign
 	return 0;
 }
 
+static int sony_nc_hotkeys_decode(unsigned int handle)
+{
+	int ret = -EINVAL;
+	unsigned int result = 0;
+	struct sony_nc_event *key_event;
+
+	if (sony_call_snc_handle(handle, 0x200, &result)) {
+		dprintk("sony_nc_hotkeys_decode,"
+				" unable to retrieve the hotkey\n");
+	} else {
+		result &= 0xff;
+
+		if (handle == 0x100)
+			key_event = sony_100_events;
+		else
+			key_event = sony_127_events;
+
+		for (; key_event->data; key_event++) {
+			if (key_event->data == result) {
+				ret = key_event->event;
+				break;
+			}
+		}
+
+		if (!key_event->data)
+			pr_info("Unknown hotkey 0x%.2x (handle 0x%.2x)\n",
+							result, handle);
+		else
+			dprintk("sony_nc_hotkeys_decode, hotkey 0x%.2x decoded "
+					"to event 0x%.2x\n", result, ret);
+	}
+
+	return ret;
+}
+
 static void sony_nc_rfkill_cleanup(void)
 {
 	int i;
@@ -1832,6 +1811,65 @@ static int sony_nc_handles_resume(void)
 	return 0;
 }
 
+static void sony_nc_notify(struct acpi_device *device, u32 event)
+{
+	dprintk("sony_nc_notify, event: 0x%.2x\n", event);
+
+	/* handles related events */
+	if (event >= 0x90) {
+		unsigned int result = 0, handle = 0, value = 0;
+
+		/* the event should corrispond to the offset of the method */
+		unsigned int offset = event - 0x90;
+
+		handle = handles->cap[offset];
+		switch (handle) {
+		/* list of handles known for generating events */
+		case 0x0100:
+		case 0x0127:
+			/* hotkey event, a key has been pressed, retrieve it */
+			value = sony_nc_hotkeys_decode(handle);
+			if (value > 0) { /* known event */
+				sony_laptop_report_input_event(value);
+			} else {
+				/* restore the original event for
+				   the acpi bus notification */
+				value = event;
+			}
+
+			acpi_bus_generate_proc_event(sony_nc_acpi_device, 1,
+									value);
+
+			break;
+
+		case 0x0124:
+		case 0x0135:
+			sony_call_snc_handle(handle, 0x0100, &result);
+			result &= 0x03;
+			dprintk("sony_nc_notify, RFKILL event received "
+					"(reason: %s)\n", result == 1 ?
+					"switch state changed" : "battery");
+
+			if (result == 1) { /* hw swtich event */
+				sony_nc_rfkill_update();
+			}
+
+			break;
+
+		default:
+			dprintk("Unknowk event for handle: 0x%x\n", handle);
+			break;
+		}
+
+		/* clear the event (and the event reason when present) */
+		acpi_callsetfunc(sony_nc_acpi_handle, "SN05", 1 << offset,
+				&result);
+	} else {
+		sony_laptop_report_input_event(event);
+		acpi_bus_generate_proc_event(sony_nc_acpi_device, 1, event);
+	}
+}
+
 static int sony_nc_add(struct acpi_device *device)
 {
 	acpi_status status;
