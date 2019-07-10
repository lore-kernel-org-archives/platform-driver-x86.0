From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH] platform/x86: hp_accel: Add support for HP ZBook 17 G5
Date: Wed, 10 Jul 2019 13:33:26 +0800
Message-ID: <20190710053326.26247-1-kai.heng.feng@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: eric.piel@tremplin-utc.net, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>
List-Id: platform-driver-x86.vger.kernel.org

HP ZBook 17 G5 needs a non-standard mapping, x_inverted.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/platform/x86/hp_accel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
index f61b8a176e20..cfc0e36a7a5e 100644
--- a/drivers/platform/x86/hp_accel.c
+++ b/drivers/platform/x86/hp_accel.c
@@ -239,6 +239,7 @@ static const struct dmi_system_id lis3lv02d_dmi_ids[] = {
 	AXIS_DMI_MATCH("HPB64xx", "HP EliteBook 84", xy_swap),
 	AXIS_DMI_MATCH("HPB65xx", "HP ProBook 65", x_inverted),
 	AXIS_DMI_MATCH("HPZBook15", "HP ZBook 15", x_inverted),
+	AXIS_DMI_MATCH("HPZBook17G5", "HP ZBook 17 G5", x_inverted),
 	AXIS_DMI_MATCH("HPZBook17", "HP ZBook 17", xy_swap_yz_inverted),
 	{ NULL, }
 /* Laptop models without axis info (yet):
-- 
2.17.1
