From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 06/14] thinkpad-acpi: fix brightness hotkey poll handling
Date: Wed, 19 May 2010 00:26:16 -0300
Message-ID: <1274239584-17743-7-git-send-email-hmh@hmh.eng.br>
References: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:51339 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756165Ab0ESD0f (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 May 2010 23:26:35 -0400
In-Reply-To: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Handle multiple brightness hotkey presses between two polling cycles.

Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c |   36 ++++++++++++++++++++++-----------
 1 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index b03bf51..fa412a4 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2340,6 +2340,21 @@ static void hotkey_compare_and_issue_event(struct tp_nvram_state *oldn,
 		}
 	}
 
+	void issue_brightnesschange(const unsigned int oldbrt,
+				    const unsigned int newbrt)
+	{
+		unsigned int i = oldbrt;
+
+		while (i > newbrt) {
+			TPACPI_MAY_SEND_KEY(TP_ACPI_HOTKEYSCAN_FNEND);
+			i--;
+		}
+		while (i < newbrt) {
+			TPACPI_MAY_SEND_KEY(TP_ACPI_HOTKEYSCAN_FNHOME);
+			i++;
+		}
+	}
+
 	TPACPI_COMPARE_KEY(TP_ACPI_HOTKEYSCAN_THINKPAD, thinkpad_toggle);
 	TPACPI_COMPARE_KEY(TP_ACPI_HOTKEYSCAN_FNSPACE, zoom_toggle);
 	TPACPI_COMPARE_KEY(TP_ACPI_HOTKEYSCAN_FNF7, display_toggle);
@@ -2394,19 +2409,16 @@ static void hotkey_compare_and_issue_event(struct tp_nvram_state *oldn,
 	}
 
 	/* handle brightness */
-	if (oldn->brightness_toggle != newn->brightness_toggle) {
-		if (oldn->brightness_level < newn->brightness_level) {
-			TPACPI_MAY_SEND_KEY(TP_ACPI_HOTKEYSCAN_FNHOME);
-		} else if (oldn->brightness_level > newn->brightness_level) {
+	if (oldn->brightness_level != newn->brightness_level) {
+		issue_brightnesschange(oldn->brightness_level,
+				       newn->brightness_level);
+	} else if (oldn->brightness_toggle != newn->brightness_toggle) {
+		/* repeated key presses that didn't change state */
+		if (newn->brightness_level == 0)
 			TPACPI_MAY_SEND_KEY(TP_ACPI_HOTKEYSCAN_FNEND);
-		} else {
-			/* repeated key presses that didn't change state */
-			if (newn->brightness_level != 0) {
-				TPACPI_MAY_SEND_KEY(TP_ACPI_HOTKEYSCAN_FNHOME);
-			} else {
-				TPACPI_MAY_SEND_KEY(TP_ACPI_HOTKEYSCAN_FNEND);
-			}
-		}
+		else if (newn->brightness_level >= bright_maxlvl
+				&& !tp_features.bright_unkfw)
+			TPACPI_MAY_SEND_KEY(TP_ACPI_HOTKEYSCAN_FNHOME);
 	}
 
 #undef TPACPI_COMPARE_KEY
-- 
1.7.1

