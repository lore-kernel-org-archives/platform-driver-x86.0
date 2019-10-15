From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] platform/x86: huawei-wmi: make validation stricter in
 huawei_wmi_battery_set()
Date: Tue, 15 Oct 2019 11:38:38 +0300
Message-ID: <20191015083837.GA29104@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Ayman Bagabas <ayman.bagabas@gmail.com>
Cc: Andy Shevchenko <andy@infradead.org>, Takashi Iwai <tiwai@suse.de>, Mattias Jacobsson <2pi@mok.nu>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

I don't think it makes sense for "end" to be negative or for even for it
to be less than "start".  That also means that "start" can't be more
than 100 which is good.

Fixes: b7527d0f4502 ("platform/x86: huawei-wmi: Add battery charging thresholds")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/x86/huawei-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 6720f78c60c2..02a505a72172 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -343,7 +343,7 @@ static int huawei_wmi_battery_set(int start, int end)
 	union hwmi_arg arg;
 	int err;
 
-	if (start < 0 || end > 100)
+	if (start < 0 || end < start || end > 100)
 		return -EINVAL;
 
 	arg.cmd = BATTERY_THRESH_SET;
-- 
2.20.1
