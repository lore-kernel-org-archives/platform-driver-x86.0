From: Andy Lutomirski <luto@MIT.EDU>
Subject: [PATCH] thinkpad_acpi: Add ACPI HID for ThinkPad X220
Date: Sat,  7 May 2011 19:41:14 -0400
Message-ID: <5b395b26bb6325a484fc1f6ea935a66822fa232a.1304811242.git.luto@mit.edu>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from DMZ-MAILSEC-SCANNER-3.MIT.EDU ([18.9.25.14]:60583 "EHLO
	dmz-mailsec-scanner-3.mit.edu" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756336Ab1EGXqX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 7 May 2011 19:46:23 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@mit.edu>

It looks like Lenovo is starting to remove old IBM references.

Signed-off-by: Andy Lutomirski <luto@mit.edu>
---

This patch is needed for thinkpad_acpi to load automatically on my
ThinkPad X220.  (It seems to *work* without the patch, though.)

 drivers/platform/x86/thinkpad_acpi.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index eb99223..4025d84 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -129,6 +129,7 @@ enum {
 
 /* ACPI HIDs */
 #define TPACPI_ACPI_HKEY_HID		"IBM0068"
+#define TPACPI_ACPI_HKEY_HID_LEN	"LEN0068"
 #define TPACPI_ACPI_EC_HID		"PNP0C09"
 
 /* Input IDs */
@@ -3880,6 +3881,7 @@ errexit:
 
 static const struct acpi_device_id ibm_htk_device_ids[] = {
 	{TPACPI_ACPI_HKEY_HID, 0},
+	{TPACPI_ACPI_HKEY_HID_LEN, 0},
 	{"", 0},
 };
 
-- 
1.7.4.4
