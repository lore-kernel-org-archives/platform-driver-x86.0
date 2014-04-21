From: Konrad Zapalowicz <bergo.torino@gmail.com>
Subject: [PATCH 09/11] driver: thinkpad_acpi: replace simple_strtoul with kstrtoul
Date: Mon, 21 Apr 2014 21:10:54 +0200
Message-ID: <1398107456-31080-10-git-send-email-bergo.torino@gmail.com>
References: <1398107456-31080-1-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-2-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-3-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-4-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-5-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-6-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-7-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-8-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-9-git-send-email-bergo.torino@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f49.google.com ([74.125.83.49]:41514 "EHLO
	mail-ee0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754218AbaDUTLQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Apr 2014 15:11:16 -0400
Received: by mail-ee0-f49.google.com with SMTP id c41so3853774eek.36
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2014 12:11:15 -0700 (PDT)
In-Reply-To: <1398107456-31080-9-git-send-email-bergo.torino@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Konrad Zapalowicz <bergo.torino@gmail.com>

This commit fixes the "simple_strtoul is obsolete, use kstrtoul instead"
checkpatch warning.

Signed-off-by: Konrad Zapalowicz <bergo.torino@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 8631981..9456e3f 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1067,14 +1067,16 @@ static void delete_attr_set(struct attribute_set *s, struct kobject *kobj)
 static int parse_strtoul(const char *buf,
 		unsigned long max, unsigned long *value)
 {
-	char *endp;
+	int error = 0;
 
-	*value = simple_strtoul(skip_spaces(buf), &endp, 0);
-	endp = skip_spaces(endp);
-	if (*endp || *value > max)
-		return -EINVAL;
+	error = kstrtoul(skip_spaces(buf), 0, &(*value));
+	if (error)
+		goto out;
 
-	return 0;
+	if (*value > max)
+		error = -EINVAL;
+out:
+	return error;
 }
 
 static void tpacpi_disable_brightness_delay(void)
-- 
1.8.1.2
