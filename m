From: Konrad Zapalowicz <bergo.torino@gmail.com>
Subject: [PATCH 02/11] driver: thinkpad_acpi: add parenthesis around complex macro
Date: Mon, 21 Apr 2014 21:10:47 +0200
Message-ID: <1398107456-31080-3-git-send-email-bergo.torino@gmail.com>
References: <1398107456-31080-1-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-2-git-send-email-bergo.torino@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f52.google.com ([74.125.83.52]:61084 "EHLO
	mail-ee0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753716AbaDUTLH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Apr 2014 15:11:07 -0400
Received: by mail-ee0-f52.google.com with SMTP id e49so3779304eek.25
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2014 12:11:06 -0700 (PDT)
In-Reply-To: <1398107456-31080-2-git-send-email-bergo.torino@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Konrad Zapalowicz <bergo.torino@gmail.com>

This commit fixes the "Macros with complex values should be enclosed
in parenthesis" checkpatch error.

Signed-off-by: Konrad Zapalowicz <bergo.torino@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index a306975..9506026 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -5801,7 +5801,7 @@ static struct sensor_device_attribute sensor_dev_attr_thermal_temp_input[] = {
 };
 
 #define THERMAL_ATTRS(X) \
-	&sensor_dev_attr_thermal_temp_input[X].dev_attr.attr
+	(&sensor_dev_attr_thermal_temp_input[X].dev_attr.attr)
 
 static struct attribute *thermal_temp_input_attr[] = {
 	THERMAL_ATTRS(8),
-- 
1.8.1.2
