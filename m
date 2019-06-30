From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [RFC 7/9] platform/x86: huawei-wmi: Add fn-lock support
Date: Sun, 30 Jun 2019 01:41:06 -0400
Message-ID: <20190630054108.19205-8-ayman.bagabas@gmail.com>
References: <20190630054108.19205-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190630054108.19205-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ayman.bagabas@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

Huawei Matebook laptops uses Fn key and toggle to access F1-F12 keys.
Along with that, there is this feature called fn-lock that inverts the
behavior of this Fn key.

Implement the basic functionality of this feature to be used later by
sysfs interface support introduced in this series.

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index da3986cd0428..4159e10bda26 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -351,6 +351,36 @@ static int huawei_wmi_battery_set(struct device *dev, int low, int high)
 	return err;
 }
 
+/* Fn lock */
+
+static int huawei_wmi_fn_lock_get(struct device *dev, int *on)
+{
+	u8 ret[0x100] = { 0 };
+	int err, i;
+
+	err = huawei_wmi_cmd(dev, FN_LOCK_GET, ret, 0x100);
+	if (err)
+		return err;
+
+	/* Find the first non-zero value. Return status is ignored. */
+	i = 1;
+	do {
+		*on = ret[i] - 1; // -1 undefined, 0 off, 1 on.
+	} while (i < 0x100 && !ret[i++]);
+
+	return 0;
+}
+
+static int huawei_wmi_fn_lock_set(struct device *dev, int on)
+{
+	u8 arg[8];
+
+	*(u64 *)arg = FN_LOCK_SET;
+	arg[2] = on + 1; // 0 undefined, 1 off, 2 on.
+
+	return huawei_wmi_cmd(dev, *(u64 *)arg, NULL, NULL);
+}
+
 /* Input */
 
 static void huawei_wmi_process_key(struct input_dev *idev, int code)
-- 
2.20.1
