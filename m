From: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Subject: [PATCH v2] platform/x86/asus-nb-wmi.c: Add X45U quirk
Date: Mon, 31 Oct 2016 23:56:10 -0200
Message-ID: <1477965370-24892-1-git-send-email-marcos.souza.org@gmail.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: corentin.chary@gmail.com, dvhart@infradead.org, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcos Paulo de Souza <marcos.souza.org@gmail.com>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Without this patch, the Asus X45U wireless card can't be turned
on (hard-blocked), but after a suspend/resume it just starts working.

Following this bug report[1], there are other cases like this one, but
this Asus is the only model that I can test.

[1] https://ubuntuforums.org/showthread.php?t=2181558

Signed-off-by: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Cc: <stable@vger.kernel.org>

---
This patch applies smoothly in 4.8.6 and 4.4.29. I hope now I followed
the instructions correctly.

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
