From: Colin King <colin.king@canonical.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: fix spelling mistake "capabilites" -> "capabilities"
Date: Mon, 15 Apr 2019 13:52:04 +0100
Message-ID: <20190415125204.7386-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a module parameter description. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 57d9ae9d8e56..9192b686e9a6 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10269,7 +10269,7 @@ MODULE_PARM_DESC(volume_mode,
 
 module_param_named(volume_capabilities, volume_capabilities, uint, 0444);
 MODULE_PARM_DESC(volume_capabilities,
-		 "Selects the mixer capabilites: 0=auto, 1=volume and mute, 2=mute only");
+		 "Selects the mixer capabilities: 0=auto, 1=volume and mute, 2=mute only");
 
 module_param_named(volume_control, volume_control_allowed, bool, 0444);
 MODULE_PARM_DESC(volume_control,
-- 
2.20.1
