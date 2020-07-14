From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 5.8 regression fix] platform/x86: thinkpad_acpi: Revert: Use strndup_user() in dispatch_proc_write()
Date: Tue, 14 Jul 2020 10:15:10 +0200
Message-ID: <20200714081510.6070-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: Hans de Goede <hdegoede@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Commit 35d13c7a0512 ("platform/x86: thinkpad_acpi: Use strndup_user()
in dispatch_proc_write()") cleaned up dispatch_proc_write() by replacing
the code to copy the passed in data from userspae with strndup_user().

But strndup_user() expects a 0 terminated input buffer and the buffer
passed to dispatch_proc_write() is NOT 0 terminated.

So this change leads to strndup_user() copying some extra random bytes
from userspace till it hits a 0 byte.

This commit reverts the change to use strndup_user() fixing the
buffer being passed to the ibm_struct.write() call back containing extra
junk at the end.

Fixes: 35d13c7a0512 ("platform/x86: thinkpad_acpi: Use strndup_user() in dispatch_proc_write()")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 92aad746d1f8..8ae2be5871f5 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -886,11 +886,19 @@ static ssize_t dispatch_proc_write(struct file *file,
 
 	if (!ibm || !ibm->write)
 		return -EINVAL;
+	if (count > PAGE_SIZE - 1)
+		return -EINVAL;
+
+	kernbuf = kmalloc(count + 1, GFP_KERNEL);
+	if (!kernbuf)
+		return -ENOMEM;
 
-	kernbuf = strndup_user(userbuf, PAGE_SIZE);
-	if (IS_ERR(kernbuf))
-		return PTR_ERR(kernbuf);
+	if (copy_from_user(kernbuf, userbuf, count)) {
+		kfree(kernbuf);
+		return -EFAULT;
+	}
 
+	kernbuf[count] = 0;
 	ret = ibm->write(kernbuf);
 	if (ret == 0)
 		ret = count;
-- 
2.26.2
