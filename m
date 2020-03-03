From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v8 02/19] platform/x86: intel_scu_ipc: Log more information if SCU IPC command fails
Date: Tue,  3 Mar 2020 16:36:32 +0300
Message-ID: <20200303133649.39819-3-mika.westerberg@linux.intel.com>
References: <20200303133649.39819-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200303133649.39819-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Currently we only log an error if the command times out which makes it
hard to figure out the failing command. This changes the driver to log
command and subcommand with the error code which should make debugging
easier. This also allows us to simplify the callers as they don't need
to log these errors themselves.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 584e33c37708..e8ea250aeda3 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -147,7 +147,6 @@ static inline int busy_loop(struct intel_scu_ipc_dev *scu)
 		usleep_range(50, 100);
 	} while (time_before(jiffies, end));
 
-	dev_err(&scu->dev, "IPC timed out");
 	return -ETIMEDOUT;
 }
 
@@ -156,10 +155,8 @@ static inline int ipc_wait_for_interrupt(struct intel_scu_ipc_dev *scu)
 {
 	int status;
 
-	if (!wait_for_completion_timeout(&scu->cmd_complete, IPC_TIMEOUT)) {
-		dev_err(&scu->dev, "IPC timed out\n");
+	if (!wait_for_completion_timeout(&scu->cmd_complete, IPC_TIMEOUT))
 		return -ETIMEDOUT;
-	}
 
 	status = ipc_read_status(scu);
 	if (status & IPC_STATUS_ERR)
@@ -331,6 +328,7 @@ EXPORT_SYMBOL(intel_scu_ipc_update_register);
 int intel_scu_ipc_simple_command(int cmd, int sub)
 {
 	struct intel_scu_ipc_dev *scu;
+	u32 cmdval;
 	int err;
 
 	mutex_lock(&ipclock);
@@ -339,9 +337,12 @@ int intel_scu_ipc_simple_command(int cmd, int sub)
 		return -ENODEV;
 	}
 	scu = ipcdev;
-	ipc_command(scu, sub << 12 | cmd);
+	cmdval = sub << 12 | cmd;
+	ipc_command(scu, cmdval);
 	err = intel_scu_ipc_check_status(scu);
 	mutex_unlock(&ipclock);
+	if (err)
+		dev_err(&scu->dev, "IPC command %#x failed with %d\n", cmdval, err);
 	return err;
 }
 EXPORT_SYMBOL(intel_scu_ipc_simple_command);
@@ -362,6 +363,7 @@ int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
 			  u32 *out, int outlen)
 {
 	struct intel_scu_ipc_dev *scu;
+	u32 cmdval;
 	int i, err;
 
 	mutex_lock(&ipclock);
@@ -374,7 +376,8 @@ int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
 	for (i = 0; i < inlen; i++)
 		ipc_data_writel(scu, *in++, 4 * i);
 
-	ipc_command(scu, (inlen << 16) | (sub << 12) | cmd);
+	cmdval = (inlen << 16) | (sub << 12) | cmd;
+	ipc_command(scu, cmdval);
 	err = intel_scu_ipc_check_status(scu);
 
 	if (!err) {
@@ -383,6 +386,8 @@ int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
 	}
 
 	mutex_unlock(&ipclock);
+	if (err)
+		dev_err(&scu->dev, "IPC command %#x failed with %d\n", cmdval, err);
 	return err;
 }
 EXPORT_SYMBOL(intel_scu_ipc_command);
-- 
2.25.1
