From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH v1 5/6] intel_pmc_core: Add LTR IGNORE debug feature
Date: Fri,  7 Oct 2016 16:01:16 +0530
Message-ID: <1475836277-4788-6-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1475836277-4788-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475836277-4788-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

SPT LTR_IGN register provides a means to make the PMC ignore the LTR values
reported by the individual PCH devices.

echo <IP Offset> > /sys/kernel/debug/pmc_core/ltr_ignore.

When a particular IP Offset bit is set the PMC will ignore the LTR value
reported by the corresponding IP when the PMC performs the latency
coalescing.

IP Offset	IP Name
0		SPA
1		SPB
2		SATA
3		GBE
4		XHCI
5		RSVD
6		ME
7		EVA
8		SPC
9		Azalia/ADSP
10		RSVD
11		LPSS
12		SPD
13		SPE
14		Camera
15		ESPI
16		SCC
17		ISH

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 57 ++++++++++++++++++++++++++++++++++-
 drivers/platform/x86/intel_pmc_core.h |  2 ++
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 4840158..5b867b7 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -19,11 +19,12 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/pci.h>
-#include <linux/delay.h>
+#include <linux/uaccess.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
@@ -373,6 +374,53 @@ static const struct file_operations pmc_core_pll_ops = {
 	.release        = single_release,
 };
 
+static ssize_t pmc_core_ltr_ignore_write(struct file *file, const char __user
+*userbuf, size_t count, loff_t *ppos)
+{
+	u32 val, buf_size, fd;
+	int err = 0;
+	struct pmc_dev *pmcdev = &pmc;
+
+	buf_size = count < 64 ? count : 64;
+	mutex_lock(&pmcdev->lock);
+
+	if (kstrtou32_from_user(userbuf, buf_size, 10, &val)) {
+		err = -EFAULT;
+		goto out_unlock;
+	}
+
+	if (val > NUM_IP_IGN_ALLOWED) {
+		err = -EINVAL;
+		goto out_unlock;
+	}
+
+	fd = pmc_core_reg_read(pmcdev, SPT_PMC_LTR_IGNORE_OFFSET);
+	fd |= (1U << val);
+	pmc_core_reg_write(pmcdev, SPT_PMC_LTR_IGNORE_OFFSET, fd);
+
+out_unlock:
+	mutex_unlock(&pmcdev->lock);
+	return err == 0 ? count : err;
+}
+
+static int pmc_core_ltr_ignore_show(struct seq_file *s, void *unused)
+{
+	return 0;
+}
+
+static int pmc_core_ltr_ignore_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, pmc_core_ltr_ignore_show, inode->i_private);
+}
+
+static const struct file_operations pmc_core_ltr_ignore_ops = {
+	.open           = pmc_core_ltr_ignore_open,
+	.read           = seq_read,
+	.write          = pmc_core_ltr_ignore_write,
+	.llseek         = seq_lseek,
+	.release        = single_release,
+};
+
 static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 {
 	debugfs_remove_recursive(pmcdev->dbgfs_dir);
@@ -410,6 +458,13 @@ static int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 	if (!file)
 		goto err;
 
+	file = debugfs_create_file("ltr_ignore",
+				   S_IFREG | S_IRUGO, dir, pmcdev,
+				   &pmc_core_ltr_ignore_ops);
+
+	if (!file)
+		goto err;
+
 	return 0;
 err:
 	pmc_core_dbgfs_unregister(pmcdev);
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index 07161fb..5a48e77 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -30,6 +30,7 @@
 #define SPT_PMC_PM_STS_OFFSET			0x1c
 #define SPT_PMC_MTPMC_OFFSET			0x20
 #define SPT_PMC_MFPMC_OFFSET			0x38
+#define SPT_PMC_LTR_IGNORE_OFFSET		0x30C
 #define SPT_PMC_MPHY_CORE_STS_0			0x1143
 #define SPT_PMC_MPHY_CORE_STS_1			0x1142
 #define SPT_PMC_MPHY_COM_STS_0			0x1155
@@ -41,6 +42,7 @@
 #define SPT_PMC_READ_DISABLE_BIT		0x16
 #define SPT_PMC_MSG_FULL_STS_BIT		0x18
 #define NUM_RETRIES				100
+#define NUM_IP_IGN_ALLOWED			17
 
 /* Sunrise Point: PGD PFET Enable Ack Status Registers */
 enum ppfear_regs {
-- 
1.9.1
