From: Marco Chiappero <marco@absence.it>
Subject: [PATCH V2 RESEND 12/14] sony-laptop: rfkill improvements
Date: Tue, 13 Sep 2011 22:53:52 +0200
Message-ID: <1315947232.14415.161.camel@air.vesuvio.absence.it>
References: <1315585214.3613.51.camel@vesuvio>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from s1.powermailhost.com ([93.95.221.60]:34046 "EHLO
	s1.powermailhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932614Ab1IMUxy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Sep 2011 16:53:54 -0400
In-Reply-To: <1315585214.3613.51.camel@vesuvio>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

This patch introduces some rfkill improvements in terms of both code
cleaning and support extension. More precisely:

- removed any handle autodetection inside the setup function as it's now
provided by the caller
- rfkill type now persistent, using the hardware capability of storing
the wireless devices power state
- added support for newer WWAN modules
- removed some global variables now included in a few struct for a
cleaner code. These structs have been placed close to the rfkill
functions for better readability
- minor code improvements


Signed-off-by: Marco Chiappero <marco@absence.it> 
--- 

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -141,19 +141,6 @@ MODULE_PARM_DESC(kbd_backlight_timeout,
 		 "(default: 0)");
 
 
-enum sony_nc_rfkill {
-	SONY_WIFI,
-	SONY_BLUETOOTH,
-	SONY_WWAN,
-	SONY_WIMAX,
-	N_SONY_RFKILL,
-};
-
-static unsigned int sony_rfkill_handle;
-static struct rfkill *sony_rfkill_devices[N_SONY_RFKILL];
-static int sony_rfkill_address[N_SONY_RFKILL] = {0x300, 0x500, 0x700, 0x900};
-static void sony_nc_rfkill_update(void);
-
 /*********** Input Devices ***********/
 
 #define SONY_LAPTOP_BUF_SIZE	128
@@ -1204,30 +1191,51 @@ static int sony_nc_hotkeys_decode(unsign
 	return ret;
 }
 
+enum sony_nc_rfkill {
+	SONY_WIFI,
+	SONY_BLUETOOTH,
+	SONY_WWAN,
+	SONY_WIMAX,
+	N_SONY_RFKILL,
+};
+struct snc_rfkill_data {
+	unsigned int handle;
+	struct rfkill *devices[N_SONY_RFKILL];
+	const unsigned int address[N_SONY_RFKILL];
+};
+static struct snc_rfkill_data snc_rfkill = {
+	0, {NULL}, {0x300, 0x500, 0x700, 0x900}
+};
+
 static void sony_nc_rfkill_cleanup(void)
 {
 	int i;
 
 	for (i = 0; i < N_SONY_RFKILL; i++) {
-		if (sony_rfkill_devices[i]) {
-			rfkill_unregister(sony_rfkill_devices[i]);
-			rfkill_destroy(sony_rfkill_devices[i]);
+		if (snc_rfkill.devices[i]) {
+			rfkill_unregister(snc_rfkill.devices[i]);
+			rfkill_destroy(snc_rfkill.devices[i]);
 		}
 	}
 }
 
 static int sony_nc_rfkill_set(void *data, bool blocked)
 {
-	unsigned int result;
-	unsigned int argument = sony_rfkill_address[(long) data] + 0x100;
+	unsigned int result, argument = snc_rfkill.address[(long) data];
 
+	/* do not force an already set state */
+	sony_call_snc_handle(snc_rfkill.handle, argument, &result);
+	if ((result & 0x1) == !blocked)
+		return 0;
+
+	argument += 0x100;
 	if (!blocked)
 		argument |= 0xff0000;
 
-	return sony_call_snc_handle(sony_rfkill_handle, argument, &result);
+	return sony_call_snc_handle(snc_rfkill.handle, argument, &result);
 }
 
-static const struct rfkill_ops sony_rfkill_ops = {
+static const struct rfkill_ops snc_rfkill_ops = {
 	.set_block = sony_nc_rfkill_set,
 };
 
@@ -1239,7 +1247,7 @@ static int sony_nc_setup_rfkill(struct a
 	enum rfkill_type type;
 	const char *name;
 	unsigned int result;
-	bool hwblock;
+	bool hwblock, swblock;
 
 	switch (nc_type) {
 	case SONY_WIFI:
@@ -1263,12 +1271,19 @@ static int sony_nc_setup_rfkill(struct a
 	}
 
 	rfk = rfkill_alloc(name, &device->dev, type,
-			   &sony_rfkill_ops, (void *)nc_type);
+			   &snc_rfkill_ops, (void *)nc_type);
 	if (!rfk)
 		return -ENOMEM;
 
-	sony_call_snc_handle(sony_rfkill_handle, 0x200, &result);
+	sony_call_snc_handle(snc_rfkill.handle, 0x200, &result);
 	hwblock = !(result & 0x1);
+
+	result = 0;
+	sony_call_snc_handle(snc_rfkill.handle, snc_rfkill.address[nc_type],
+				&result);
+	swblock = !(result & 0x2);
+
+	rfkill_init_sw_state(rfk, swblock);
 	rfkill_set_hw_state(rfk, hwblock);
 
 	err = rfkill_register(rfk);
@@ -1276,7 +1291,7 @@ static int sony_nc_setup_rfkill(struct a
 		rfkill_destroy(rfk);
 		return err;
 	}
-	sony_rfkill_devices[nc_type] = rfk;
+	snc_rfkill.devices[nc_type] = rfk;
 	return err;
 }
 
@@ -1284,51 +1299,35 @@ static void sony_nc_rfkill_update(void)
 {
 	enum sony_nc_rfkill i;
 	unsigned int result;
-	bool hwblock;
+	bool hwblock, swblock;
 
-	sony_call_snc_handle(sony_rfkill_handle, 0x200, &result);
+	sony_call_snc_handle(snc_rfkill.handle, 0x200, &result);
 	hwblock = !(result & 0x1);
 
 	for (i = 0; i < N_SONY_RFKILL; i++) {
-		unsigned int argument = sony_rfkill_address[i];
+		unsigned int argument = snc_rfkill.address[i];
 
-		if (!sony_rfkill_devices[i])
+		if (!snc_rfkill.devices[i])
 			continue;
 
-		if (hwblock) {
-			if (rfkill_set_hw_state(sony_rfkill_devices[i], true))
-				/* we already know we're blocked */ ;
-
-			continue;
-		}
+		sony_call_snc_handle(snc_rfkill.handle, argument, &result);
+		swblock = !(result & 0x2);
 
-		sony_call_snc_handle(sony_rfkill_handle, argument, &result);
-		rfkill_set_states(sony_rfkill_devices[i],
-				  !(result & 0xf), false);
+		rfkill_set_states(snc_rfkill.devices[i], swblock, hwblock);
 	}
 }
 
-static int sony_nc_rfkill_setup(struct acpi_device *device)
+static int sony_nc_rfkill_setup(struct acpi_device *device, unsigned int handle)
 {
 #define	RFKILL_BUFF_SIZE 8
 	u8 dev_code, i, buff[RFKILL_BUFF_SIZE] = { 0 };
-	int offset;
 
-	offset = sony_find_snc_handle(0x124);
-	if (offset == -1) {
-		offset = sony_find_snc_handle(0x135);
-		if (offset == -1)
-			return 0;
-		else
-			sony_rfkill_handle = 0x135;
-	} else
-		sony_rfkill_handle = 0x124;
-	dprintk("Found rkfill handle: 0x%.4x\n", sony_rfkill_handle);
+	snc_rfkill.handle = handle;
 
 	/* need to read the whole buffer returned by the acpi call to SN06
 	 * here otherwise we may miss some features
 	 */
-	if (sony_call_snc_handle_buffer(sony_rfkill_handle, 0x000,
+	if (sony_call_snc_handle_buffer(snc_rfkill.handle, 0x000,
 					buff, RFKILL_BUFF_SIZE) < 0)
 		return -EIO;
 
@@ -1341,19 +1340,38 @@ static int sony_nc_rfkill_setup(struct a
 		if (dev_code == 0xff)
 			break;
 
+		/*
+		   known codes:
+
+		   0x00	WLAN
+		   0x10 BLUETOOTH
+		   0x20 WWAN GPRS-EDGE
+		   0x21 WWAN HSDPA
+		   0x22 WWAN EV-DO
+		   0x23 WWAN GPS
+		   0x25	Gobi WWAN no GPS
+		   0x26 Gobi WWAN + GPS
+		   0x28	Gobi WWAN no GPS
+		   0x29 Gobi WWAN + GPS
+		   0x50	Gobi WWAN no GPS
+		   0x51 Gobi WWAN + GPS
+		   0x30	WIMAX
+		   0x70 no SIM card slot
+		   0x71 SIM card slot
+		*/
 		dprintk("Radio devices, looking at 0x%.2x\n", dev_code);
 
-		if (dev_code == 0 && !sony_rfkill_devices[SONY_WIFI])
+		if (dev_code == 0 && !snc_rfkill.devices[SONY_WIFI])
 			sony_nc_setup_rfkill(device, SONY_WIFI);
 
-		if (dev_code == 0x10 && !sony_rfkill_devices[SONY_BLUETOOTH])
+		if (dev_code == 0x10 && !snc_rfkill.devices[SONY_BLUETOOTH])
 			sony_nc_setup_rfkill(device, SONY_BLUETOOTH);
 
-		if ((0xf0 & dev_code) == 0x20 &&
-				!sony_rfkill_devices[SONY_WWAN])
+		if (((0xf0 & dev_code) == 0x20 || (0xf0 & dev_code) == 0x50) &&
+				!snc_rfkill.devices[SONY_WWAN])
 			sony_nc_setup_rfkill(device, SONY_WWAN);
 
-		if (dev_code == 0x30 && !sony_rfkill_devices[SONY_WIMAX])
+		if (dev_code == 0x30 && !snc_rfkill.devices[SONY_WIMAX])
 			sony_nc_setup_rfkill(device, SONY_WIMAX);
 	}
 
@@ -1717,7 +1735,7 @@ static int sony_nc_handles_setup(struct 
 			ret = sony_nc_kbd_backlight_setup(pd, handle);
 		case 0x0124:
 		case 0x0135:
-			ret = sony_nc_rfkill_setup(sony_nc_acpi_device);
+			ret = sony_nc_rfkill_setup(sony_nc_acpi_device, handle);
 			break;
 		default:
 			continue;
