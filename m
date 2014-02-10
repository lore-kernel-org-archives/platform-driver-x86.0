From: "Luis G.F" <luisgf@luisgf.es>
Subject: [PATCH 1/2] platform / x86: Fix incorrect sscanf() string datatype.
Date: Mon, 10 Feb 2014 11:44:47 +0100
Message-ID: <1392029087-21441-1-git-send-email-luisgf@luisgf.es>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.domainsvm.com ([37.77.82.227]:41085 "EHLO
	cp-nl-1.domainsvm.com" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with ESMTP id S1752107AbaBJLnE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 10 Feb 2014 06:43:04 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: "Luis G.F" <luisgf@luisgf.es>

Fix incorrect sscanf() string datatype in following functions:

- cmos_write()
- beep_write()
- volume_writter().

Change from 'unsigned int *' to 'int *'

Signed-off-by: Luis G.F <luisgf@luisgf.es>
---
 drivers/platform/x86/thinkpad_acpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index defb6af..1646300 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4962,7 +4962,7 @@ static int cmos_write(char *buf)
 	int cmos_cmd, res;
 
 	while ((cmd = next_cmd(&buf))) {
-		if (sscanf(cmd, "%u", &cmos_cmd) == 1 &&
+		if (sscanf(cmd, "%d", &cmos_cmd) == 1 &&
 		    cmos_cmd >= 0 && cmos_cmd <= 21) {
 			/* cmos_cmd set */
 		} else
@@ -5467,7 +5467,7 @@ static int beep_write(char *buf)
 		return -ENODEV;
 
 	while ((cmd = next_cmd(&buf))) {
-		if (sscanf(cmd, "%u", &beep_cmd) == 1 &&
+		if (sscanf(cmd, "%d", &beep_cmd) == 1 &&
 		    beep_cmd >= 0 && beep_cmd <= 17) {
 			/* beep_cmd set */
 		} else
@@ -7047,7 +7047,7 @@ static int volume_write(char *buf)
 				else if (new_level > 0)
 					new_level--;
 				continue;
-			} else if (sscanf(cmd, "level %u", &l) == 1 &&
+			} else if (sscanf(cmd, "level %d", &l) == 1 &&
 				   l >= 0 && l <= TP_EC_VOLUME_MAX) {
 					new_level = l;
 				continue;
-- 
1.8.4.5
