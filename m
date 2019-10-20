From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [PATCH 1/3] platform/x86: huawei-wmi: Stricter battery thresholds set
Date: Sun, 20 Oct 2019 13:00:07 -0400
Message-ID: <20191020170020.26251-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ayman Bagabas <ayman.bagabas@gmail.com>, Takashi Iwai <tiwai@suse.de>, Mattias Jacobsson <2pi@mok.nu>, kbuild test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Check if battery thresholds are within 0 and 100.

Fixes: 355a070b09ab ("platform/x86: huawei-wmi: Add battery charging thresholds")
Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 5837d1b8693d..26041d44286a 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -345,7 +345,7 @@ static int huawei_wmi_battery_set(int start, int end)
 	union hwmi_arg arg;
 	int err;
 
-	if (start < 0 || end > 100)
+	if (start < 0 || end < 0 || start > 100 || end > 100)
 		return -EINVAL;
 
 	arg.cmd = BATTERY_THRESH_SET;

base-commit: c4b9850b3676869ac0def5885d781d17f64b3a86
-- 
2.21.0
