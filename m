From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 07/37] platform/x86: intel_scu_ipc: Sleeping is fine when polling
Date: Mon, 23 Dec 2019 17:16:46 +0300
Message-ID: <20191223141716.13727-8-mika.westerberg@linux.intel.com>
References: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, x86@kernel.org
Cc: Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

There is no reason why the driver would need to block other threads from
running the CPU while it is waiting for the SCU IPC to complete its
work. For this reason switch the driver to use usleep_range() instead
with a bit more relaxed polling loop.

Also add constant for the timeout and use the same value for both
polling and interrupt modes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c | 29 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 43eaf9400c67..8db0644900a3 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -79,6 +79,9 @@ static struct intel_scu_ipc_dev  ipcdev; /* Only one for now */
 #define IPC_WRITE_BUFFER	0x80
 #define IPC_READ_BUFFER		0x90
 
+/* Timeout in jiffies */
+#define IPC_TIMEOUT		(3 * HZ)
+
 static DEFINE_MUTEX(ipclock); /* lock used to prevent multiple call to SCU */
 
 /*
@@ -132,24 +135,20 @@ static inline u32 ipc_data_readl(struct intel_scu_ipc_dev *scu, u32 offset)
 /* Wait till scu status is busy */
 static inline int busy_loop(struct intel_scu_ipc_dev *scu)
 {
-	u32 status = ipc_read_status(scu);
-	u32 loop_count = 100000;
+	unsigned long end = jiffies + msecs_to_jiffies(IPC_TIMEOUT);
 
-	/* break if scu doesn't reset busy bit after huge retry */
-	while ((status & IPC_STATUS_BUSY) && --loop_count) {
-		udelay(1); /* scu processing time is in few u secods */
-		status = ipc_read_status(scu);
-	}
+	do {
+		u32 status;
 
-	if (status & IPC_STATUS_BUSY) {
-		dev_err(scu->dev, "IPC timed out");
-		return -ETIMEDOUT;
-	}
+		status = ipc_read_status(scu);
+		if (!(status & IPC_STATUS_BUSY))
+			return (status & IPC_STATUS_ERR) ? -EIO : 0;
 
-	if (status & IPC_STATUS_ERR)
-		return -EIO;
+		usleep_range(50, 100);
+	} while (time_before(jiffies, end));
 
-	return 0;
+	dev_err(scu->dev, "IPC timed out");
+	return -ETIMEDOUT;
 }
 
 /* Wait till ipc ioc interrupt is received or timeout in 3 HZ */
@@ -157,7 +156,7 @@ static inline int ipc_wait_for_interrupt(struct intel_scu_ipc_dev *scu)
 {
 	int status;
 
-	if (!wait_for_completion_timeout(&scu->cmd_complete, 3 * HZ)) {
+	if (!wait_for_completion_timeout(&scu->cmd_complete, IPC_TIMEOUT)) {
 		dev_err(scu->dev, "IPC timed out\n");
 		return -ETIMEDOUT;
 	}
-- 
2.24.0
