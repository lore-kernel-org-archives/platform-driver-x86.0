From: Colin King <colin.king@canonical.com>
Subject: [PATCH] tc1100-wmi: fix build warning when CONFIG_PM not enabled
Date: Wed,  6 Jan 2016 18:02:59 +0000
Message-ID: <1452103379-9838-1-git-send-email-colin.king@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Conditionally declare suspend_data on CONFIG_PM to avoid
the following warning when CONFIG_OM is not enabled:

drivers/platform/x86/tc1100-wmi.c:55:27: warning:
  'suspend_data' defined but not used [-Wunused-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/x86/tc1100-wmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/tc1100-wmi.c b/drivers/platform/x86/tc1100-wmi.c
index 89aa976..65b0a48 100644
--- a/drivers/platform/x86/tc1100-wmi.c
+++ b/drivers/platform/x86/tc1100-wmi.c
@@ -52,7 +52,9 @@ struct tc1100_data {
 	u32 jogdial;
 };
 
+#ifdef CONFIG_PM
 static struct tc1100_data suspend_data;
+#endif
 
 /* --------------------------------------------------------------------------
 				Device Management
-- 
2.7.0.rc3
