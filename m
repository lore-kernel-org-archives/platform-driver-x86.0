From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [PATCH v2 6/8] platform/x86: huawei-wmi: add fn-lock support
Date: Wed, 12 Jun 2019 23:04:13 -0400
Message-ID: <20190613030416.25807-8-ayman.bagabas@gmail.com>
References: <20190613030416.25807-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613030416.25807-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ayman.bagabas@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

The behavior of hotkeys is not the same among all models. Some models
require fn-lock to do things like `Ctrl-Ins` or `Alt-PrtSc`. By default,
hotkeys behave as special keys (media keys, Ins, etc), but if a modifier
is used (ctrl, alt, shift) these keys behave as F1-F12 keys. If the Fn
key is toggled on, the hotkeys with or without a modifier, behave as
F1-F12 keys. This makes it impossible to use a modifier and `PrtSc` or
`Ins`.

Now, some models fix this by excluding `PrtSc` and `Ins` keys from
being treated as F11 and F12 keys with the use of a modifier. However,
some models do not, and fixes this by the so called fn-lock.

Fn-lock inverts the behavior of the top row from special keys to F1-F12
keys. So a modifier and a special key would be possible which make
things like `Alt-Ins` possible. Now, with fn-lock we would have 4 modes:
* Fn-key off & fn-lock off - hotkeys treated as special keys using a
  modifier gives F1-F12 keys.
* Fn-key on & fn-lock off - hotkeys treated as F1-F12 keys and using a
  modifier gives F1-F12.
* Fn-key off & fn-lock on - hotkeys are treated as F1-F12 keys and using
  a modifier gives special keys.
* Fn-key on & fn-lock on - hotkeys are treated as special keys and using
  a modifier gives special keys.

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 06d83e613504..aac9b80f9976 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -357,6 +357,37 @@ static int huawei_wmi_battery_set(struct device *dev, int low, int high)
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
+	if (err) {
+		return err;
+	}
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
