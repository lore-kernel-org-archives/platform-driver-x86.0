From: Zhang Xianwei <zhang.xianwei8@zte.com.cn>
Subject: [PATCH] platform/x86: ideapad-laptop: Use __func__ instead of read_ec_cmd in pr_err
Date: Tue, 4 Sep 2018 15:08:19 +0800
Message-ID: <1536044899-10452-1-git-send-email-zhang.xianwei8@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ike.pan@canonical.com, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, zhong.weidong@zte.com.cn, jiang.biao2@zte.com.cn, zhang.xianwei8@zte.com.cn
List-Id: platform-driver-x86.vger.kernel.org

Refer to the commit f1395edbcec8 ("platform/x86: ideapad-laptop: Use
__func__ instead of write_ec_cmd in pr_err"), prefer using '"%s...",
__func__' to using 'read_ec_cmd' in read_ec_data.

Signed-off-by: Zhang Xianwei <zhang.xianwei8@zte.com.cn>
---
 drivers/platform/x86/ideapad-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index d4f1259..f856d59 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -212,7 +212,7 @@ static int read_ec_data(acpi_handle handle, int cmd, unsigned long *data)
 			return 0;
 		}
 	}
-	pr_err("timeout in read_ec_cmd\n");
+	pr_err("timeout in %s\n", __func__);
 	return -1;
 }
 
-- 
2.9.5
