From: Aaron Ma <aaron.ma@canonical.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: not loading brightness_init when _BCL invalid
Date: Thu,  2 Jul 2020 16:55:20 +0800
Message-ID: <20200702085520.16901-1-aaron.ma@canonical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: aaron.ma@canonical.com, mapengyu@gmail.com, ibm-acpi@hmh.eng.br, dvhart@infradead.org, andy@infradead.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

When _BCL invalid, disable thinkpad_acpi backlight brightness control.

brightness_enable is already checked at the beginning,
Always print notice when enabled brightness control.

Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index ff7f0a4f2475..a52d6d457d6c 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -6955,10 +6955,13 @@ static int __init brightness_init(struct ibm_init_struct *iibm)
 			pr_warn("Cannot enable backlight brightness support, ACPI is already handling it.  Refer to the acpi_backlight kernel parameter.\n");
 			return 1;
 		}
-	} else if (tp_features.bright_acpimode && brightness_enable > 1) {
-		pr_notice("Standard ACPI backlight interface not available, thinkpad_acpi native brightness control enabled\n");
+	} else if (!tp_features.bright_acpimode) {
+		pr_notice("thinkpad_acpi backlight interface not available\n");
+		return 1;
 	}
 
+	pr_notice("thinkpad_acpi native brightness control enabled\n");
+
 	/*
 	 * Check for module parameter bogosity, note that we
 	 * init brightness_mode to TPACPI_BRGHT_MODE_MAX in order to be
-- 
2.26.2
