From: Philipp Hug <philipp@hug.cx>
Subject: [PATCH] platform/x86: ideapad-laptop: Add Lenovo Yoga 920-13IKB to
 no_hw_rfkill dmi list
Date: Tue, 24 Oct 2017 16:32:22 +0200
Message-ID: <20171024143219.GA27308@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
Cc: ike.pan@canonical.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The Lenovo Yoga 920-13IKB does not have a hw rfkill switch, and trying
to read the hw rfkill switch through the ideapad module causes it to
always report as blocked.

This commit adds the Lenovo Yoga 920-13IKB to the no_hw_rfkill dmi list,
fixing the WiFI breakage.

Signed-off-by: Philipp Hug <philipp@hug.cx>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index fe98d4ac0df3..53ab4e0f8962 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1166,6 +1166,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 910-13IKB"),
 		},
 	},
+	{
+		.ident = "Lenovo YOGA 920-13IKB",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 920-13IKB"),
+		},
+	},
 	{}
 };
 
-- 
2.14.2
