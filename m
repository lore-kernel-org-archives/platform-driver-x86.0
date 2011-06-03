From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 11/25] sony-laptop:  rfkill improvements
Date: Fri, 03 Jun 2011 17:42:22 +0200
Message-ID: <4DE900DE.9010006@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:58670 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751246Ab1FCPmZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 11:42:25 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

- added sony_nc_get_rfkill_hwblock helper function
- rfkill type now persistent, using the hardware stored device power state
- added support for newer WWAN modules
- handle detection removed because no longer necessary
- now notifying rfkill events to the acpi bus

Signed-off-by: Marco Chiappero <marco@absence.it>
---

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -141,10 +141,7 @@ MODULE_PARM_DESC(kbd_backlight_timeout,
  		 "(default: 0)");


-static int sony_rfkill_handle;
-static struct rfkill *sony_rfkill_devices[N_SONY_RFKILL];
-static int sony_rfkill_address[N_SONY_RFKILL] = {0x300, 0x500, 0x700, 
0x900};
-static void sony_nc_rfkill_update(void);
+static int sony_rfkill_handle = -1;

  /*********** Input Devices ***********/

@@ -1190,6 +1187,26 @@ static int sony_nc_hotkeys_decode(unsign
  	return ret;
  }

+enum sony_nc_rfkill {
+	SONY_WIFI,
+	SONY_BLUETOOTH,
+	SONY_WWAN,
+	SONY_WIMAX,
+	N_SONY_RFKILL,
+};
+static struct rfkill *sony_rfkill_devices[N_SONY_RFKILL];
+static int sony_rfkill_address[N_SONY_RFKILL] = {0x300, 0x500, 0x700, 
0x900};
+
+static int sony_nc_get_rfkill_hwblock(void)
+{
+	unsigned int result;
+
+	if (sony_call_snc_handle(sony_rfkill_handle, 0x200, &result))
+		return -1;
+
+	return result & 0x1;
+}
+
  static void sony_nc_rfkill_cleanup(void)
  {
  	int i;
@@ -1204,9 +1221,14 @@ static void sony_nc_rfkill_cleanup(void)

  static int sony_nc_rfkill_set(void *data, bool blocked)
  {
-	unsigned int result;
-	unsigned int argument = sony_rfkill_address[(long) data] + 0x100;
+	unsigned int result, argument = sony_rfkill_address[(long) data];

+	/* do not force an already set state */
+	sony_call_snc_handle(sony_rfkill_handle, argument, &result);
+	if ((result & 0x1) == !blocked)
+		return 0;
+
+	argument += 0x100;
  	if (!blocked)
  		argument |= 0xff0000;

@@ -1225,7 +1247,7 @@ static int sony_nc_setup_rfkill(struct a
  	enum rfkill_type type;
  	const char *name;
  	unsigned int result;
-	bool hwblock;
+	bool hwblock, swblock;

  	switch (nc_type) {
  	case SONY_WIFI:
@@ -1255,6 +1277,13 @@ static int sony_nc_setup_rfkill(struct a

  	sony_call_snc_handle(sony_rfkill_handle, 0x200, &result);
  	hwblock = !(result & 0x1);
+
+	result = 0;
+	sony_call_snc_handle(sony_rfkill_handle, sony_rfkill_address[nc_type],
+				&result);
+	swblock = !(result & 0x2);
+
+	rfkill_init_sw_state(rfk, swblock);
  	rfkill_set_hw_state(rfk, hwblock);

  	err = rfkill_register(rfk);
@@ -1281,16 +1310,9 @@ static void sony_nc_rfkill_update(void)
  		if (!sony_rfkill_devices[i])
  			continue;

-		if (hwblock) {
-			if (rfkill_set_hw_state(sony_rfkill_devices[i], true)) {
-				/* we already know we're blocked */
-			}
-			continue;
-		}
-
  		sony_call_snc_handle(sony_rfkill_handle, argument, &result);
  		rfkill_set_states(sony_rfkill_devices[i],
-				  !(result & 0xf), false);
+				  !(result & 0x2), hwblock);
  	}
  }

@@ -1298,17 +1320,7 @@ static int sony_nc_rfkill_setup(struct a
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
  	dprintk("Found rkfill handle: 0x%.4x\n", sony_rfkill_handle);

  	/* need to read the whole buffer returned by the acpi call to SN06
@@ -1327,6 +1339,25 @@ static int sony_nc_rfkill_setup(struct a
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

  		if (dev_code == 0 && !sony_rfkill_devices[SONY_WIFI])
@@ -1335,7 +1366,7 @@ static int sony_nc_rfkill_setup(struct a
  		if (dev_code == 0x10 && !sony_rfkill_devices[SONY_BLUETOOTH])
  			sony_nc_setup_rfkill(device, SONY_BLUETOOTH);

-		if ((0xf0 & dev_code) == 0x20 &&
+		if (((0xf0 & dev_code) == 0x20 || (0xf0 & dev_code) == 0x50) &&
  				!sony_rfkill_devices[SONY_WWAN])
  			sony_nc_setup_rfkill(device, SONY_WWAN);

@@ -1694,6 +1725,7 @@ static void sony_nc_snc_setup_handles(st
  			break;
  		case 0x0124:
  		case 0x0135:
+			sony_rfkill_handle = handle;
  			ret = sony_nc_rfkill_setup(sony_nc_acpi_device);
  			break;
  		default:
@@ -1887,6 +1919,30 @@ static void sony_nc_notify(struct acpi_d
  			ev = 1;
  			break;

+		case 0x0124:
+		case 0x0135:
+			sony_call_snc_handle(sony_rfkill_handle, 0x0100,
+						&result);
+			result &= 0x03;
+			dprintk("sony_nc_notify, RFKILL event received "
+					"(reason: %s)\n", result == 1 ?
+					"switch state changed" : "battery");
+
+			if (result == 1) { /* hw swtich event */
+				sony_nc_rfkill_update();
+				sony_laptop_report_input_event(
+						SONYPI_EVENT_RFKILL_ALL);
+				value = sony_nc_get_rfkill_hwblock();
+			} else if (result == 2) { /* battery event */
+				/*  we should change the WWAN rfkill
+				    state when the battery state changes
+				 */
+				return;
+			}
+
+			ev = 2;
+			break;
+
  		default:
  			value = event;
  			dprintk("Unknowk event for handle: 0x%x\n", handle);
