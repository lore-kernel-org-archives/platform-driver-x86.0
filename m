From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH] platform: x86: pcengines-apuv2: detect apuv4 board
Date: Tue, 20 Aug 2019 11:56:32 +0200
Message-ID: <1566294992-703-1-git-send-email-info@metux.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: info@metux.net, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

GPIO stuff on APUv4 seems to be the same as on APUv2, so we just
need to match on DMI data.

Fixes: f8eb0235f65989fc5521c40c78d1261e7f25cdbe
---
 drivers/platform/x86/pcengines-apuv2.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index e4c68ef..ea0c6bb 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -178,6 +178,33 @@
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
1.9.1
