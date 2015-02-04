From: Adam Lee <adam.lee@canonical.com>
Subject: [PATCH] thinkpad_acpi: support new BIOS version string pattern
Date: Wed,  4 Feb 2015 17:00:19 +0800
Message-ID: <1423040419-25113-1-git-send-email-adam.lee@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:57736 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754461AbbBDJA1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 4 Feb 2015 04:00:27 -0500
Received: by mail-pa0-f42.google.com with SMTP id bj1so1101984pad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Feb 2015 01:00:27 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: ibm-acpi-devel@lists.sourceforge.net, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>

Latest ThinkPad models use a new string pattern of BIOS version,
thinkpad_acpi won't be loaded automatically without this fix.

Signed-off-by: Adam Lee <adam.lee@canonical.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index c3d11fa..39a1017 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8883,17 +8883,38 @@ static bool __pure __init tpacpi_is_fw_digit(const char c)
 	return (c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z');
 }
 
-/* Most models: xxyTkkWW (#.##c); Ancient 570/600 and -SL lacks (#.##c) */
 static bool __pure __init tpacpi_is_valid_fw_id(const char * const s,
 						const char t)
 {
-	return s && strlen(s) >= 8 &&
+	bool is_most = 0;
+	bool is_new = 0;
+
+	/*
+	 * Most models: xxyTkkWW (#.##c)
+	 * Ancient 570/600 and -SL lacks (#.##c)
+	 */
+	is_most = s && strlen(s) >= 8 &&
 		tpacpi_is_fw_digit(s[0]) &&
 		tpacpi_is_fw_digit(s[1]) &&
 		s[2] == t &&
 		(s[3] == 'T' || s[3] == 'N') &&
 		tpacpi_is_fw_digit(s[4]) &&
 		tpacpi_is_fw_digit(s[5]);
+
+	if (is_most)
+		return is_most;
+
+	/* New models: xxxyTkkW (#.##c); T550 and some others */
+	is_new = s && strlen(s) >= 8 &&
+		tpacpi_is_fw_digit(s[0]) &&
+		tpacpi_is_fw_digit(s[1]) &&
+		tpacpi_is_fw_digit(s[2]) &&
+		s[3] == t &&
+		(s[4] == 'T' || s[4] == 'N') &&
+		tpacpi_is_fw_digit(s[5]) &&
+		tpacpi_is_fw_digit(s[6]);
+
+	return is_new;
 }
 
 /* returns 0 - probe ok, or < 0 - probe error.
-- 
2.1.4
