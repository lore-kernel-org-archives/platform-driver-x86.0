From: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Subject: [PATCH v3] platform/x86/asus-nb-wmi.c: Add X45U quirk
Date: Mon,  7 Nov 2016 22:02:32 -0200
Message-ID: <1478563352-2524-1-git-send-email-marcos.souza.org@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Marcos Paulo de Souza <marcos.souza.org@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Without this patch, the Asus X45U wireless card can't be turned
on (hard-blocked), but after a suspend/resume it just starts working.

Following this bug report[1], there are other cases like this one, but
this Asus is the only model that I can test.

[1] https://ubuntuforums.org/showthread.php?t=2181558

Cc: stable@vger.kernel.org # 4.4.x-
Signed-off-by: Marcos Paulo de Souza <marcos.souza.org@gmail.com>

---
v2 -> v3:
 Add stable version in the CC line of stable email address
v1 -> v2:
 Add stable copy and specify the stable version to apply this patch

 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 26e4cbc..6032b70 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -175,6 +175,15 @@ static const struct dmi_system_id asus_quirks[] = {
 	},
 	{
 		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X45U",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X45U"),
+		},
+		.driver_data = &quirk_asus_wapf4,
+	},
+	{
+		.callback = dmi_matched,
 		.ident = "ASUSTeK COMPUTER INC. X456UA",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
2.7.4
