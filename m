From: manoj.iyer@canonical.com
Subject: [PATCH] thinkpad-acpi: recognize latest V-Series using DMI_BIOS_VENDOR
Date: Mon,  6 Aug 2012 17:21:09 -0500
Message-ID: <1344291669-9711-1-git-send-email-manoj.iyer@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:53026 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755950Ab2HFWVM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 6 Aug 2012 18:21:12 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, mjg@redhat.com, ibm-acpi@hmh.eng.br

From: Manoj Iyer <manoj.iyer@canonical.com>

In the latest V-series bios DMI_PRODUCT_VERSION does not contain
the string Lenovo or Thinkpad, but is set to the model number, this
causes the thinkpad_acpi module to fail to load. Recognize laptop
as Lenovo using DMI_BIOS_VENDOR instead, which is set to Lenovo.

Signed-off-by: Manoj Iyer <manoj.iyer@canonical.com>
---
 drivers/platform/x86/thinkpad_acpi.c |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index e7f7328..66dfdef 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8663,6 +8663,14 @@ static int __must_check __init get_thinkpad_model_data(
 		if (!tp->model_str)
 			return -ENOMEM;
 	}
+	else {
+		s = dmi_get_system_info(DMI_BIOS_VENDOR);
+		if (s && !(strnicmp(s, "Lenovo", 6))) {
+			tp->model_str = kstrdup(s, GFP_KERNEL);
+			if (!tp->model_str)
+				return -ENOMEM;
+		}
+	} 
 
 	s = dmi_get_system_info(DMI_PRODUCT_NAME);
 	tp->nummodel_str = kstrdup(s, GFP_KERNEL);
-- 
1.7.9.5
