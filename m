From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/6] platform/x86: intel_ips: Keep pointer to struct device
Date: Thu,  5 Oct 2017 14:54:18 +0300
Message-ID: <20171005115420.2786-4-andriy.shevchenko@linux.intel.com>
References: <20171005115420.2786-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005115420.2786-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

...instead of keeping pointer to struct pci_dev.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_ips.c | 51 ++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 489ff6fff9f9..27e70637e40b 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -295,7 +295,7 @@ static struct ips_mcp_limits ips_ulv_limits = {
 };
 
 struct ips_driver {
-	struct pci_dev *dev;
+	struct device *dev;
 	void __iomem *regmap;
 	int irq;
 
@@ -596,7 +596,7 @@ static void ips_disable_gpu_turbo(struct ips_driver *ips)
 		return;
 
 	if (!ips->gpu_turbo_disable())
-		dev_err(&ips->dev->dev, "failed to disable graphics turbo\n");
+		dev_err(ips->dev, "failed to disable graphics turbo\n");
 	else
 		ips->__gpu_turbo_on = false;
 }
@@ -651,8 +651,7 @@ static bool cpu_exceeded(struct ips_driver *ips, int cpu)
 	spin_unlock_irqrestore(&ips->turbo_status_lock, flags);
 
 	if (ret)
-		dev_info(&ips->dev->dev,
-			 "CPU power or thermal limit exceeded\n");
+		dev_info(ips->dev, "CPU power or thermal limit exceeded\n");
 
 	return ret;
 }
@@ -771,7 +770,7 @@ static int ips_adjust(void *data)
 	struct ips_driver *ips = data;
 	unsigned long flags;
 
-	dev_dbg(&ips->dev->dev, "starting ips-adjust thread\n");
+	dev_dbg(ips->dev, "starting ips-adjust thread\n");
 
 	/*
 	 * Adjust CPU and GPU clamps every 5s if needed.  Doing it more
@@ -818,7 +817,7 @@ static int ips_adjust(void *data)
 		schedule_timeout_interruptible(msecs_to_jiffies(IPS_ADJUST_PERIOD));
 	} while (!kthread_should_stop());
 
-	dev_dbg(&ips->dev->dev, "ips-adjust thread stopped\n");
+	dev_dbg(ips->dev, "ips-adjust thread stopped\n");
 
 	return 0;
 }
@@ -978,7 +977,7 @@ static int ips_monitor(void *data)
 	mchp_samples = kzalloc(sizeof(u32) * IPS_SAMPLE_COUNT, GFP_KERNEL);
 	if (!mcp_samples || !ctv1_samples || !ctv2_samples || !mch_samples ||
 			!cpu_samples || !mchp_samples) {
-		dev_err(&ips->dev->dev,
+		dev_err(ips->dev,
 			"failed to allocate sample array, ips disabled\n");
 		kfree(mcp_samples);
 		kfree(ctv1_samples);
@@ -1099,7 +1098,8 @@ static int ips_monitor(void *data)
 			ITV_ME_SEQNO_SHIFT;
 		if (cur_seqno == last_seqno &&
 		    time_after(jiffies, seqno_timestamp + HZ)) {
-			dev_warn(&ips->dev->dev, "ME failed to update for more than 1s, likely hung\n");
+			dev_warn(ips->dev,
+				 "ME failed to update for more than 1s, likely hung\n");
 		} else {
 			seqno_timestamp = get_jiffies_64();
 			last_seqno = cur_seqno;
@@ -1121,7 +1121,7 @@ static int ips_monitor(void *data)
 	del_timer_sync(&timer);
 	destroy_timer_on_stack(&timer);
 
-	dev_dbg(&ips->dev->dev, "ips-monitor thread stopped\n");
+	dev_dbg(ips->dev, "ips-monitor thread stopped\n");
 
 	return 0;
 }
@@ -1130,17 +1130,17 @@ static int ips_monitor(void *data)
 #define THM_DUMPW(reg) \
 	{ \
 	u16 val = thm_readw(reg); \
-	dev_dbg(&ips->dev->dev, #reg ": 0x%04x\n", val); \
+	dev_dbg(ips->dev, #reg ": 0x%04x\n", val); \
 	}
 #define THM_DUMPL(reg) \
 	{ \
 	u32 val = thm_readl(reg); \
-	dev_dbg(&ips->dev->dev, #reg ": 0x%08x\n", val); \
+	dev_dbg(ips->dev, #reg ": 0x%08x\n", val); \
 	}
 #define THM_DUMPQ(reg) \
 	{ \
 	u64 val = thm_readq(reg); \
-	dev_dbg(&ips->dev->dev, #reg ": 0x%016x\n", val); \
+	dev_dbg(ips->dev, #reg ": 0x%016x\n", val); \
 	}
 
 static void dump_thermal_info(struct ips_driver *ips)
@@ -1148,7 +1148,7 @@ static void dump_thermal_info(struct ips_driver *ips)
 	u16 ptl;
 
 	ptl = thm_readw(THM_PTL);
-	dev_dbg(&ips->dev->dev, "Processor temp limit: %d\n", ptl);
+	dev_dbg(ips->dev, "Processor temp limit: %d\n", ptl);
 
 	THM_DUMPW(THM_CTA);
 	THM_DUMPW(THM_TRC);
@@ -1177,8 +1177,8 @@ static irqreturn_t ips_irq_handler(int irq, void *arg)
 	if (!tses && !tes)
 		return IRQ_NONE;
 
-	dev_info(&ips->dev->dev, "TSES: 0x%02x\n", tses);
-	dev_info(&ips->dev->dev, "TES: 0x%02x\n", tes);
+	dev_info(ips->dev, "TSES: 0x%02x\n", tses);
+	dev_info(ips->dev, "TES: 0x%02x\n", tes);
 
 	/* STS update from EC? */
 	if (tes & 1) {
@@ -1216,8 +1216,8 @@ static irqreturn_t ips_irq_handler(int irq, void *arg)
 
 	/* Thermal trip */
 	if (tses) {
-		dev_warn(&ips->dev->dev,
-			 "thermal trip occurred, tses: 0x%04x\n", tses);
+		dev_warn(ips->dev, "thermal trip occurred, tses: 0x%04x\n",
+			 tses);
 		thm_writeb(THM_TSES, tses);
 	}
 
@@ -1332,8 +1332,7 @@ static void ips_debugfs_init(struct ips_driver *ips)
 
 	ips->debug_root = debugfs_create_dir("ips", NULL);
 	if (!ips->debug_root) {
-		dev_err(&ips->dev->dev,
-			"failed to create debugfs entries: %ld\n",
+		dev_err(ips->dev, "failed to create debugfs entries: %ld\n",
 			PTR_ERR(ips->debug_root));
 		return;
 	}
@@ -1347,8 +1346,7 @@ static void ips_debugfs_init(struct ips_driver *ips)
 					  ips->debug_root, node,
 					  &ips_debugfs_ops);
 		if (!ent) {
-			dev_err(&ips->dev->dev,
-				"failed to create debug file: %ld\n",
+			dev_err(ips->dev, "failed to create debug file: %ld\n",
 				PTR_ERR(ent));
 			goto err_cleanup;
 		}
@@ -1375,7 +1373,7 @@ static struct ips_mcp_limits *ips_detect_cpu(struct ips_driver *ips)
 	u16 tdp;
 
 	if (!(boot_cpu_data.x86 == 6 && boot_cpu_data.x86_model == 37)) {
-		dev_info(&ips->dev->dev, "Non-IPS CPU detected.\n");
+		dev_info(ips->dev, "Non-IPS CPU detected.\n");
 		goto out;
 	}
 
@@ -1397,7 +1395,7 @@ static struct ips_mcp_limits *ips_detect_cpu(struct ips_driver *ips)
 	else if (strstr(boot_cpu_data.x86_model_id, "CPU       U"))
 		limits = &ips_ulv_limits;
 	else {
-		dev_info(&ips->dev->dev, "No CPUID match found.\n");
+		dev_info(ips->dev, "No CPUID match found.\n");
 		goto out;
 	}
 
@@ -1406,7 +1404,8 @@ static struct ips_mcp_limits *ips_detect_cpu(struct ips_driver *ips)
 
 	/* Sanity check TDP against CPU */
 	if (limits->core_power_limit != (tdp / 8) * 1000) {
-		dev_info(&ips->dev->dev, "CPU TDP doesn't match expected value (found %d, expected %d)\n",
+		dev_info(ips->dev,
+			 "CPU TDP doesn't match expected value (found %d, expected %d)\n",
 			 tdp / 8, limits->core_power_limit / 1000);
 		limits->core_power_limit = (tdp / 8) * 1000;
 	}
@@ -1461,7 +1460,7 @@ ips_gpu_turbo_enabled(struct ips_driver *ips)
 {
 	if (!ips->gpu_busy && late_i915_load) {
 		if (ips_get_i915_syms(ips)) {
-			dev_info(&ips->dev->dev,
+			dev_info(ips->dev,
 				 "i915 driver attached, reenabling gpu turbo\n");
 			ips->gpu_turbo_enabled = !(thm_readl(THM_HTS) & HTS_GTD_DIS);
 		}
@@ -1523,7 +1522,7 @@ static int ips_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		return -ENOMEM;
 
 	spin_lock_init(&ips->turbo_status_lock);
-	ips->dev = dev;
+	ips->dev = &dev->dev;
 
 	ips->limits = ips_detect_cpu(ips);
 	if (!ips->limits) {
-- 
2.14.2
