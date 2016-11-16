From: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Subject: [PATCH] platform: asus-nb-wmi: Make use of dmi->ident
Date: Wed, 16 Nov 2016 07:45:08 -0200
Message-ID: <1479289508-6482-1-git-send-email-marcos.souza.org@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Marcos Paulo de Souza <marcos.souza.org@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

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
