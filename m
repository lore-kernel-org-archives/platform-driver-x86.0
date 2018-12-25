From: Kangjie Lu <kjlu@umn.edu>
Subject: [PATCH] wmi: avoid a double-fetch issue in wmi_ioctl
Date: Tue, 25 Dec 2018 13:36:11 -0600
Message-ID: <20181225193611.69216-1-kjlu@umn.edu>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kjlu@umn.edu
Cc: pakki001@umn.edu, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

buf->length is first copied in from user space and security-checked. The
second copy issued by copy_from_user copies it again. The data in user
space may have been modified by malicious users. filter_callback()
further uses the potentially modified data. The fix avoids the
double-fetch that overwrites buf->length.

Signed-off-by: Kangjie Lu <kjlu@umn.edu>
---
 drivers/platform/x86/wmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index bea35be68706..93cab9a70ad7 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -850,7 +850,8 @@ static long wmi_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 			buf->length, wblock->req_buf_size);
 
 	/* copy the structure from userspace */
-	if (copy_from_user(buf, input, wblock->req_buf_size)) {
+	if (copy_from_user(buf->data, input->data,
+				wblock->req_buf_size - sizeof(buf->length))) {
 		dev_dbg(&wblock->dev.dev, "Copy %llu from user failed\n",
 			wblock->req_buf_size);
 		ret = -EFAULT;
-- 
2.17.2 (Apple Git-113)
