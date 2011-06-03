From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 22/25] sony-laptop: forward Hybrid GFX notifications to userspace
Date: Fri, 03 Jun 2011 21:27:00 +0200
Message-ID: <4DE93584.3070205@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:54149 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752096Ab1FCT1E (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 15:27:04 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Some Vaios come with both integrated and discrete graphics, plus a 
switch for choosing one of the two. When the switch position is changed, 
a notification is generated, now forwarded to userspace for example for 
visual notifications, user scripts, and so on.

Signed-off-by: Marco Chiappero <marco@absence.it>
---

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -3118,6 +3118,14 @@ static void sony_nc_notify(struct acpi_d

  	dprintk("sony_nc_notify, event: 0x%.2x\n", event);

+	/* events codes list
+	 * 1    Hotkeys
+	 * 2    RFKILL
+	 * 3    ALS
+	 * 4    HDD protection
+	 * 5	Hybrid GFX
+	 */
+
  	/* handles related events */
  	if (event >= 0x90) {
  		unsigned int result = 0, handle = 0;
@@ -3169,6 +3177,23 @@ static void sony_nc_notify(struct acpi_d
  			/* hdd protection event, notify userspace */
  			break;

+		case 0x0128:
+		case 0x0146:
+			/* Hybrid GFX switching, 1 */
+			sony_call_snc_handle(handle, 0x0000, &result);
+			dprintk("sony_nc_notify, Hybrid GFX event received "
+					"(reason: %s)\n", (result & 0x01) ?
+					"switch position change" : "unknown");
+
+			/* verify the switch state
+			   (1: discrete GFX, 0: integrated GFX)*/
+			result = 0;
+			sony_call_snc_handle(handle, 0x0100, &result);
+
+			ev = 5;
+			value = result & 0xff;
+			break;
+
  		default:
  			value = event;
  			dprintk("Unknowk event for handle: 0x%x\n", handle);
