From: Matteo Croce <mcroce@redhat.com>
Subject: [PATCH 5/4] procfs: utility handler to trigger different errors
Date: Mon,  1 Apr 2019 12:24:56 +0200
Message-ID: <20190401102456.11162-6-mcroce@redhat.com>
References: <20190401102456.11162-1-mcroce@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401102456.11162-1-mcroce@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add a /proc/crashtest handler which triggers different kernel errors.
Just write a single character (if many are written, only the first one
is read), to trigger different errors:
- p: raise a kernel panic
- w: generate a warning
- o: raise an oops
The handler permissions are set to 0220 to avoid non root users to crash
the system.

Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 fs/proc/Makefile    |  1 +
 fs/proc/crashtest.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 fs/proc/crashtest.c

diff --git a/fs/proc/Makefile b/fs/proc/Makefile
index ead487e80510..df99d3245ad9 100644
--- a/fs/proc/Makefile
+++ b/fs/proc/Makefile
@@ -15,6 +15,7 @@ proc-$(CONFIG_TTY)      += proc_tty.o
 proc-y	+= cmdline.o
 proc-y	+= consoles.o
 proc-y	+= cpuinfo.o
+proc-y	+= crashtest.o
 proc-y	+= devices.o
 proc-y	+= interrupts.o
 proc-y	+= loadavg.o
diff --git a/fs/proc/crashtest.c b/fs/proc/crashtest.c
new file mode 100644
index 000000000000..ad7d21cc9d98
--- /dev/null
+++ b/fs/proc/crashtest.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/proc_fs.h>
+#include <linux/uaccess.h>
+
+static ssize_t crashtest_write(struct file *file, const char __user *buf,
+			       size_t count, loff_t *ppos)
+{
+	char cmd;
+
+	if (!count)
+		return 0;
+
+	if (get_user(cmd, buf))
+		return -EFAULT;
+
+	switch (cmd) {
+	case 'p':
+		panic("crashtest");
+		break;
+	case 'w':
+		WARN(1, "crashtest");
+		break;
+	case 'o':
+		*(int*)0 = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return count;
+}
+
+static const struct file_operations proc_crashtest_ops = {
+	.write	= crashtest_write,
+};
+
+static int __init proc_crashtest_init(void)
+{
+	return !proc_create("crashtest", 0220, NULL, &proc_crashtest_ops);
+}
+fs_initcall(proc_crashtest_init);
-- 
2.20.1
