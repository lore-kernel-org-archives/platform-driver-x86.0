From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 03/14] thinkpad-acpi: fix volume/mute hotkey poll handling
Date: Wed, 19 May 2010 00:26:13 -0300
Message-ID: <1274239584-17743-4-git-send-email-hmh@hmh.eng.br>
References: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:55183 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756050Ab0ESD0d (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 May 2010 23:26:33 -0400
In-Reply-To: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>

The hotkey polling code is supposed to generate hotkey messages as
close to the way the IBM event-based volume hotkey firmware does as
possible, i.e:

* Pressing MUTE issues a mute hotkey event, even if already mute;

* Pressing Volume up/down issues a volume up/down hotkey event,
  even if already at maximum or minumum volume;

* The act of unmuting issues a volume up/down event, depending on
  which hotkey was used to unmute.

Fix the code to do just that (mute handling was incorrect), and handle
multiple hotkey presses between two polling cycles.

The new code uses the volume_toggle bit in NVRAM only to detect
repeated presses of the mute key and multiple presses of the volume
keys trying to go past the end of the volume scale.  This will work
around a bug in recent Lenovo firmware (e.g. T400), which causes the
firmware to not update the volume_toggle bit in certain situations.

Reported-by: Yang Zhe <yangzhe1990@gmail.com>
Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c |   71 +++++++++++++++++++++++++++-------
 1 files changed, 57 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 7817cef..1f27b35 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -122,6 +122,11 @@ enum {
 	TP_NVRAM_POS_LEVEL_VOLUME	= 0,
 };
 
+/* Misc NVRAM-related */
+enum {
+	TP_NVRAM_LEVEL_VOLUME_MAX = 14,
+};
+
 /* ACPI HIDs */
 #define TPACPI_ACPI_HKEY_HID		"IBM0068"
 
@@ -2418,6 +2423,21 @@ static void hotkey_compare_and_issue_event(struct tp_nvram_state *oldn,
 			tpacpi_hotkey_send_key(__scancode); \
 	} while (0)
 
+	void issue_volchange(const unsigned int oldvol,
+			     const unsigned int newvol)
+	{
+		unsigned int i = oldvol;
+
+		while (i > newvol) {
+			TPACPI_MAY_SEND_KEY(TP_ACPI_HOTKEYSCAN_VOLUMEDOWN);
+			i--;
+		}
+		while (i < newvol) {
+			TPACPI_MAY_SEND_KEY(TP_ACPI_HOTKEYSCAN_VOLUMEUP);
+			i++;
+		}
+	}
+
 	TPACPI_COMPARE_KEY(TP_ACPI_HOTKEYSCAN_THINKPAD, thinkpad_toggle);
 	TPACPI_COMPARE_KEY(TP_ACPI_HOTKEYSCAN_FNSPACE, zoom_toggle);
 	TPACPI_COMPARE_KEY(TP_ACPI_HOTKEYSCAN_FNF7, display_toggle);
@@ -2427,24 +2447,47 @@ static void hotkey_compare_and_issue_event(struct tp_nvram_state *oldn,
 
 	TPACPI_COMPARE_KEY(TP_ACPI_HOTKEYSCAN_FNF8, displayexp_toggle);
 
-	/* handle volume */
-	if (oldn->volume_toggle != newn->volume_toggle) {
-		if (oldn->mute != newn->mute) {
+	/*
+	 * Handle volume
+	 *
+	 * This code is supposed to duplicate the IBM firmware behaviour:
+	 * - Pressing MUTE issues mute hotkey message, even when already mute
+	 * - Pressing Volume up/down issues volume up/down hotkey messages,
+	 *   even when already at maximum or minumum volume
+	 * - The act of unmuting issues volume up/down notification,
+	 *   depending which key was used to unmute
+	 *
+	 * We are constrained to what the NVRAM can tell us, which is not much
+	 * and certainly not enough if more than one volume hotkey was pressed
+	 * since the last poll cycle.
+	 *
+	 * Just to make our life interesting, some newer Lenovo ThinkPads have
+	 * bugs in the BIOS and may fail to update volume_toggle properly.
+	 */
+	if (newn->mute) {
+		/* muted */
+		if (!oldn->mute ||
+		    oldn->volume_toggle != newn->volume_toggle ||
+		    oldn->volume_level != newn->volume_level) {
+			/* recently muted, or repeated mute keypress, or
+			 * multiple presses ending in mute */
+			issue_volchange(oldn->volume_level, newn->volume_level);
 			TPACPI_MAY_SEND_KEY(TP_ACPI_HOTKEYSCAN_MUTE);
 		}
-		if (oldn->volume_level > newn->volume_level) {
-			TPACPI_MAY_SEND_KEY(TP_ACPI_HOTKEYSCAN_VOLUMEDOWN);
-		} else if (oldn->volume_level < newn->volume_level) {
+	} else {
+		/* unmute */
+		if (oldn->mute) {
+			/* recently unmuted, issue 'unmute' keypress */
 			TPACPI_MAY_SEND_KEY(TP_ACPI_HOTKEYSCAN_VOLUMEUP);
-		} else if (oldn->mute == newn->mute) {
-			/* repeated key presses that didn't change state */
-			if (newn->mute) {
-				TPACPI_MAY_SEND_KEY(TP_ACPI_HOTKEYSCAN_MUTE);
-			} else if (newn->volume_level != 0) {
-				TPACPI_MAY_SEND_KEY(TP_ACPI_HOTKEYSCAN_VOLUMEUP);
-			} else {
+		}
+		if (oldn->volume_level != newn->volume_level) {
+			issue_volchange(oldn->volume_level, newn->volume_level);
+		} else if (oldn->volume_toggle != newn->volume_toggle) {
+			/* repeated vol up/down keypress at end of scale ? */
+			if (newn->volume_level == 0)
 				TPACPI_MAY_SEND_KEY(TP_ACPI_HOTKEYSCAN_VOLUMEDOWN);
-			}
+			else if (newn->volume_level >= TP_NVRAM_LEVEL_VOLUME_MAX)
+				TPACPI_MAY_SEND_KEY(TP_ACPI_HOTKEYSCAN_VOLUMEUP);
 		}
 	}
 
-- 
1.7.1

