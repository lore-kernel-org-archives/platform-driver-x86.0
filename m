From: Li Dongyang <jerry87905@gmail.com>
Subject: [PATCH 2/3] thinkpad_acpi: Fix a memory leak during module exit
Date: Wed, 25 Jul 2012 10:45:08 +1000
Message-ID: <1343177109-1664-2-git-send-email-Jerry87905@gmail.com>
References: <1343177109-1664-1-git-send-email-Jerry87905@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:36685 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753460Ab2GYAnQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Jul 2012 20:43:16 -0400
Received: by mail-pb0-f46.google.com with SMTP id rp8so459929pbb.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jul 2012 17:43:16 -0700 (PDT)
In-Reply-To: <1343177109-1664-1-git-send-email-Jerry87905@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: ibm-acpi@hmh.eng.br, mjg@redhat.com

We should free the thinkpad_id.nummodel_str during exit as it's allocated
in get_thinkpad_module_data().

Signed-off-by: Li Dongyang <Jerry87905@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index c85b666..ae20355 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8970,6 +8970,7 @@ static void thinkpad_acpi_module_exit(void)
 	kfree(thinkpad_id.bios_version_str);
 	kfree(thinkpad_id.ec_version_str);
 	kfree(thinkpad_id.model_str);
+	kfree(thinkpad_id.nummodel_str);
 }
 
 
-- 
1.7.11.3
