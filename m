From: JingYi Hou <houjingyi647@gmail.com>
Subject: [PATCH] fix double fetch in wmi_ioctl.
Date: Wed, 8 May 2019 16:23:19 +0800
Message-ID: <20190508082319.GA8817@hjy-HP-Notebook>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

There is a double fetch problem in function wmi_ioctl.
After second fetch overwrite the length to avoid this.
buf->length is not used now,but it may in the future.
It is good to get it fixed up.

Signed-off-by: JingYi Hou <houjingyi647@gmail.com>
---
 drivers/platform/x86/wmi.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 7b26b6ccf1a0..628b9730b4d7 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -823,6 +823,7 @@ static long wmi_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	struct wmi_ioctl_buffer *buf = NULL;
 	struct wmi_driver *wdriver = NULL;
 	int ret;
+	__u64 length;
 
 	if (_IOC_TYPE(cmd) != WMI_IOC)
 		return -ENOTTY;
@@ -833,24 +834,24 @@ static long wmi_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 
 	mutex_lock(&wblock->char_mutex);
 	buf = wblock->handler_data;
-	if (get_user(buf->length, &input->length)) {
+	if (get_user(length, &input->length)) {
 		dev_dbg(&wblock->dev.dev, "Read length from user failed\n");
 		ret = -EFAULT;
 		goto out_ioctl;
 	}
 	/* if it's too small, abort */
-	if (buf->length < wblock->req_buf_size) {
+	if (length < wblock->req_buf_size) {
 		dev_err(&wblock->dev.dev,
 			"Buffer %lld too small, need at least %lld\n",
-			buf->length, wblock->req_buf_size);
+			length, wblock->req_buf_size);
 		ret = -EINVAL;
 		goto out_ioctl;
 	}
 	/* if it's too big, warn, driver will only use what is needed */
-	if (buf->length > wblock->req_buf_size)
+	if (length > wblock->req_buf_size)
 		dev_warn(&wblock->dev.dev,
 			"Buffer %lld is bigger than required %lld\n",
-			buf->length, wblock->req_buf_size);
+			length, wblock->req_buf_size);
 
 	/* copy the structure from userspace */
 	if (copy_from_user(buf, input, wblock->req_buf_size)) {
@@ -860,6 +861,9 @@ static long wmi_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		goto out_ioctl;
 	}
 
+	/* Override length in case it is changed between two userspace fetches */
+	buf->length = length;
+
 	/* let the driver do any filtering and do the call */
 	wdriver = container_of(wblock->dev.dev.driver,
 			       struct wmi_driver, driver);
-- 
2.20.1
