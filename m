From: Colin Sindle <csindle@gmail.com>
Subject: [PATCH] hp_accel: Add support for HP ProBook 450 G0.
Date: Mon,  3 Jun 2019 13:14:46 +0200
Message-ID: <20190603111446.5395-1-csindle@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Piel <eric.piel@tremplin-utc.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Colin Sindle <csindle@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

HP ProBook 450 G0 needs a non-standard mapping (x_inverted).

Signed-off-by: Colin Sindle <csindle@gmail.com>
---
 drivers/platform/x86/hp_accel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
index f61b8a176e20..7a2747455237 100644
--- a/drivers/platform/x86/hp_accel.c
+++ b/drivers/platform/x86/hp_accel.c
@@ -229,6 +229,7 @@ static const struct dmi_system_id lis3lv02d_dmi_ids[] = {
 	AXIS_DMI_MATCH("HPB440G3", "HP ProBook 440 G3", x_inverted_usd),
 	AXIS_DMI_MATCH("HPB440G4", "HP ProBook 440 G4", x_inverted),
 	AXIS_DMI_MATCH("HPB442x", "HP ProBook 442", xy_rotated_left),
+	AXIS_DMI_MATCH("HPB450G0", "HP ProBook 450 G0", x_inverted),
 	AXIS_DMI_MATCH("HPB452x", "HP ProBook 452", y_inverted),
 	AXIS_DMI_MATCH("HPB522x", "HP ProBook 522", xy_swap),
 	AXIS_DMI_MATCH("HPB532x", "HP ProBook 532", y_inverted),
-- 
2.20.1
