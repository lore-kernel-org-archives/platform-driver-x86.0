From: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Subject: [PATCH RESENT] platform: asus-nb-wmi: Make use of dmi->ident
Date: Tue, 29 Nov 2016 23:08:49 -0200
Message-ID: <20161130010937.6059-1-marcos.souza.org@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:36229 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751726AbcK3BK3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Nov 2016 20:10:29 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: andy.shevchenko@gmail.com
Cc: Marcos Paulo de Souza <marcos.souza.org@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

as other drives also do, like fujitsu, intel, hp and samsung.

Signed-off-by: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 26e4cbc..c3abfc8 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -118,6 +118,7 @@ static struct quirk_entry quirk_asus_ux303ub = {
 
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
+	pr_info("Identified laptop model '%s'\n", dmi->ident);
 	quirks = dmi->driver_data;
 	return 1;
 }
-- 
2.7.4
