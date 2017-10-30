From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] platform/x86: peaq_wmi: Fix missing terminating entry for peaq_dmi_table
Date: Mon, 30 Oct 2017 14:07:37 +0100
Message-ID: <20171030130738.14415-1-hdegoede@redhat.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add missing terminating entry to peaq_dmi_table.

Fixes: 3b95206110a2 ("platform/x86: peaq-wmi: Add DMI check before ...")
Cc: stable@vger.kernel.org
Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/peaq-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/peaq-wmi.c b/drivers/platform/x86/peaq-wmi.c
index 67fa3fa32011..2da48ecc90c1 100644
--- a/drivers/platform/x86/peaq-wmi.c
+++ b/drivers/platform/x86/peaq-wmi.c
@@ -73,6 +73,7 @@ static const struct dmi_system_id peaq_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "PEAQ PMM C1010 MD99187"),
 		},
 	},
+	{}
 };
 
 static int __init peaq_wmi_init(void)
-- 
2.14.2
