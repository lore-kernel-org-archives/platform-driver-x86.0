From: Xiongfeng Wang <wangxiongfeng2@huawei.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Remove always false 'value < 0' statement
Date: Wed, 29 Apr 2020 16:59:40 +0800
Message-ID: <1588150780-53718-1-git-send-email-wangxiongfeng2@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ibm-acpi@hmh.eng.br, dvhart@infradead.org, andy@infradead.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, wangxiongfeng2@huawei.com
List-Id: platform-driver-x86.vger.kernel.org

Since 'value' is declared as unsigned long, the following statement is
always false.
	value < 0

So let's remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 8eaadba..0f70448 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9548,7 +9548,7 @@ static ssize_t tpacpi_battery_store(int what,
 		if (!battery_info.batteries[battery].start_support)
 			return -ENODEV;
 		/* valid values are [0, 99] */
-		if (value < 0 || value > 99)
+		if (value > 99)
 			return -EINVAL;
 		if (value > battery_info.batteries[battery].charge_stop)
 			return -EINVAL;
-- 
1.7.12.4
