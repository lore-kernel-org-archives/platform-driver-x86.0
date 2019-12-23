From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 15/37] platform/x86: intel_mid_powerbtn: Convert to use new SCU IPC API
Date: Mon, 23 Dec 2019 17:16:54 +0300
Message-ID: <20191223141716.13727-16-mika.westerberg@linux.intel.com>
References: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, x86@kernel.org
Cc: Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This converts the power button driver to use the new SCU IPC API where
the SCU IPC instance is passed to the functions.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 6f436836fe50..1fdcdef1d89f 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -46,6 +46,7 @@ struct mid_pb_ddata {
 	unsigned short mirqlvl1_addr;
 	unsigned short pbstat_addr;
 	u8 pbstat_mask;
+	struct intel_scu_ipc_dev *scu;
 	int (*setup)(struct mid_pb_ddata *ddata);
 };
 
@@ -55,7 +56,8 @@ static int mid_pbstat(struct mid_pb_ddata *ddata, int *value)
 	int ret;
 	u8 pbstat;
 
-	ret = intel_scu_ipc_ioread8(ddata->pbstat_addr, &pbstat);
+	ret = intel_scu_ipc_dev_ioread8(ddata->scu, ddata->pbstat_addr,
+					&pbstat);
 	if (ret)
 		return ret;
 
@@ -67,14 +69,15 @@ static int mid_pbstat(struct mid_pb_ddata *ddata, int *value)
 
 static int mid_irq_ack(struct mid_pb_ddata *ddata)
 {
-	return intel_scu_ipc_update_register(ddata->mirqlvl1_addr, 0, MSIC_PWRBTNM);
+	return intel_scu_ipc_dev_update(ddata->scu, ddata->mirqlvl1_addr, 0,
+					MSIC_PWRBTNM);
 }
 
 static int mrfld_setup(struct mid_pb_ddata *ddata)
 {
 	/* Unmask the PBIRQ and MPBIRQ on Tangier */
-	intel_scu_ipc_update_register(BCOVE_PBIRQ, 0, MSIC_PWRBTNM);
-	intel_scu_ipc_update_register(BCOVE_PBIRQMASK, 0, MSIC_PWRBTNM);
+	intel_scu_ipc_dev_update(ddata->scu, BCOVE_PBIRQ, 0, MSIC_PWRBTNM);
+	intel_scu_ipc_dev_update(ddata->scu, BCOVE_PBIRQMASK, 0, MSIC_PWRBTNM);
 
 	return 0;
 }
@@ -161,6 +164,10 @@ static int mid_pb_probe(struct platform_device *pdev)
 			return error;
 	}
 
+	ddata->scu = devm_intel_scu_ipc_dev_get(&pdev->dev);
+	if (!ddata->scu)
+		return -EPROBE_DEFER;
+
 	error = devm_request_threaded_irq(&pdev->dev, irq, NULL, mid_pb_isr,
 					  IRQF_ONESHOT, DRIVER_NAME, ddata);
 	if (error) {
-- 
2.24.0
