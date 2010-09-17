From: minskey guo <chaohong.guo@linux.intel.com>
Subject: [PATCH 4/4] [intel_ips] NULL pointer might be used in ips_monitor()
Date: Fri, 17 Sep 2010 14:03:27 +0800
Message-ID: <1284703407-7802-1-git-send-email-chaohong.guo@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:35192 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752948Ab0IQGHG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 17 Sep 2010 02:07:06 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jbarnes@virtuousgeek.org, mjg@redhat.com
Cc: chaohong.guo@intel.com, minskey guo <chaohong.guo@linux.intel.com>

 The patch is to create ips_adjust thread before ips_monitor begins
 to run  because the latter will kthread_stop() or wake up the former
 via ips->adjust pointer. Without this change, it is possible that
 ips->adjust is NULL when kthread_stop() or wake_up_process() is
 called in ips_monitor().

Signed-off-by: minskey guo <chaohong.guo@intel.com>
Acked-by: Jesse Barnes <jbarnes@virtuousgeek.org>
---
 drivers/platform/x86/intel_ips.c |   22 +++++++++++++---------
 1 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 71dcc41..cb59ebd 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -940,7 +940,6 @@ static int ips_monitor(void *data)
 		kfree(mch_samples);
 		kfree(cpu_samples);
 		kfree(mchp_samples);
-		kthread_stop(ips->adjust);
 		return -ENOMEM;
 	}
 
@@ -1535,19 +1534,24 @@ static int ips_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	ips_enable_cpu_turbo(ips);
 	ips->cpu_turbo_enabled = true;
 
-	/* Set up the work queue and monitor/adjust threads */
-	ips->monitor = kthread_run(ips_monitor, ips, "ips-monitor");
-	if (IS_ERR(ips->monitor)) {
+	/* Create thermal adjust thread */
+	ips->adjust = kthread_create(ips_adjust, ips, "ips-adjust");
+	if (IS_ERR(ips->adjust)) {
 		dev_err(&dev->dev,
-			"failed to create thermal monitor thread, aborting\n");
+			"failed to create thermal adjust thread, aborting\n");
 		ret = -ENOMEM;
 		goto error_free_irq;
+
 	}
 
-	ips->adjust = kthread_create(ips_adjust, ips, "ips-adjust");
-	if (IS_ERR(ips->adjust)) {
+	/*
+	 * Set up the work queue and monitor thread. The monitor thread
+	 * will wake up ips_adjust thread.
+	 */
+	ips->monitor = kthread_run(ips_monitor, ips, "ips-monitor");
+	if (IS_ERR(ips->monitor)) {
 		dev_err(&dev->dev,
-			"failed to create thermal adjust thread, aborting\n");
+			"failed to create thermal monitor thread, aborting\n");
 		ret = -ENOMEM;
 		goto error_thread_cleanup;
 	}
@@ -1566,7 +1570,7 @@ static int ips_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	return ret;
 
 error_thread_cleanup:
-	kthread_stop(ips->monitor);
+	kthread_stop(ips->adjust);
 error_free_irq:
 	free_irq(ips->dev->irq, ips);
 error_unmap:
-- 
1.7.1
