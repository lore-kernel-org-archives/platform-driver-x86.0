From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 01/19] sony-laptop: use soft rfkill status stored in hw
Date: Sat, 19 May 2012 22:35:44 +0900
Message-ID: <1337434562-12283-2-git-send-email-malattia@linux.it>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47641 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756335Ab2ESNpM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:12 -0400
In-Reply-To: <1337434562-12283-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Marco Chiappero <marco@absence.it>, Mattia Dongili <malattia@linux.it>

From: Marco Chiappero <marco@absence.it>

The SNC device on recent Vaio laptops also stores the soft status and
leaves it available after reboot. Use it and always set the last soft
and hard status on module load.

[malattia@linux.it: patch taken from a largely modified sony-laptop.c,
smaller modifications to the original code to simplify it]

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |   21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 8a51795..c6dc3f7 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1213,7 +1213,7 @@ static int sony_nc_rfkill_set(void *data, bool blocked)
 	int argument = sony_rfkill_address[(long) data] + 0x100;
 
 	if (!blocked)
-		argument |= 0xff0000;
+		argument |= 0x030000;
 
 	return sony_call_snc_handle(sony_rfkill_handle, argument, &result);
 }
@@ -1230,7 +1230,7 @@ static int sony_nc_setup_rfkill(struct acpi_device *device,
 	enum rfkill_type type;
 	const char *name;
 	int result;
-	bool hwblock;
+	bool hwblock, swblock;
 
 	switch (nc_type) {
 	case SONY_WIFI:
@@ -1258,8 +1258,21 @@ static int sony_nc_setup_rfkill(struct acpi_device *device,
 	if (!rfk)
 		return -ENOMEM;
 
-	sony_call_snc_handle(sony_rfkill_handle, 0x200, &result);
+	if (sony_call_snc_handle(sony_rfkill_handle, 0x200, &result) < 0) {
+		rfkill_destroy(rfk);
+		return -1;
+	}
 	hwblock = !(result & 0x1);
+
+	if (sony_call_snc_handle(sony_rfkill_handle,
+				sony_rfkill_address[nc_type],
+				&result) < 0) {
+		rfkill_destroy(rfk);
+		return -1;
+	}
+	swblock = !(result & 0x2);
+
+	rfkill_init_sw_state(rfk, swblock);
 	rfkill_set_hw_state(rfk, hwblock);
 
 	err = rfkill_register(rfk);
@@ -1295,7 +1308,7 @@ static void sony_nc_rfkill_update(void)
 
 		sony_call_snc_handle(sony_rfkill_handle, argument, &result);
 		rfkill_set_states(sony_rfkill_devices[i],
-				  !(result & 0xf), false);
+				  !(result & 0x2), false);
 	}
 }
 
-- 
1.7.10
