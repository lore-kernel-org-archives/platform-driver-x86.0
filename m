From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] platform/x86: ISST: Fix wrong unregister type
Date: Tue,  3 Mar 2020 14:53:54 -0800
Message-ID: <20200303225354.363038-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

The MMIO driver is not unregistering with the correct type with the ISST
common core during module removal. This should be unregistered with
ISST_IF_DEV_MMIO instead of ISST_IF_DEV_MBOX.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c b/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
index ad8c7c0df4d9..3584859fcc42 100644
--- a/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
+++ b/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
@@ -126,7 +126,7 @@ static void isst_if_remove(struct pci_dev *pdev)
 	struct isst_if_device *punit_dev;
 
 	punit_dev = pci_get_drvdata(pdev);
-	isst_if_cdev_unregister(ISST_IF_DEV_MBOX);
+	isst_if_cdev_unregister(ISST_IF_DEV_MMIO);
 	mutex_destroy(&punit_dev->mutex);
 }
 
-- 
2.24.1
