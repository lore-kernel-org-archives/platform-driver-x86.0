From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH] platform: x86: pcengines-apuv2: detect apuv4 board
Date: Thu, 12 Dec 2019 14:27:56 +0100
Message-ID: <20191212132756.23767-1-info@metux.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: info@metux.net, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

GPIO stuff on APUv4 seems to be the same as on APUv2, so we just
need to match on DMI data.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/platform/x86/pcengines-apuv2.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index 48b112b4f0b0..49f25bffce3c 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -189,6 +189,33 @@ static const struct dmi_system_id apu_gpio_dmi_table[] __initconst = {
 		},
 		.driver_data = (void *)&board_apu2,
 	},
+	/* APU4 w/ legacy bios < 4.0.8 */
+	{
+		.ident        = "apu4",
+		.matches    = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
+			DMI_MATCH(DMI_BOARD_NAME, "APU4")
+		},
+		.driver_data = (void *)&board_apu2,
+	},
+	/* APU4 w/ legacy bios >= 4.0.8 */
+	{
+		.ident       = "apu4",
+		.matches     = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
+			DMI_MATCH(DMI_BOARD_NAME, "apu4")
+		},
+		.driver_data = (void *)&board_apu2,
+	},
+	/* APU4 w/ mainline bios */
+	{
+		.ident       = "apu4",
+		.matches     = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
+			DMI_MATCH(DMI_BOARD_NAME, "PC Engines apu4")
+		},
+		.driver_data = (void *)&board_apu2,
+	},
 	{}
 };
 
-- 
2.11.0
