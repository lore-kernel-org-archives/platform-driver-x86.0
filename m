From: "David E. Box" <david.e.box@linux.intel.com>
Subject: [PATCH 1/3] mfd: intel_pmt: Add OOBMSM device ID
Date: Fri, 11 Sep 2020 12:45:47 -0700
Message-ID: <20200911194549.12780-2-david.e.box@linux.intel.com>
References: <20200911194549.12780-1-david.e.box@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200911194549.12780-1-david.e.box@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: david.e.box@linux.intel.com, lee.jones@linaro.org, dvhart@infradead.org, andy@infradead.org, alexander.h.duyck@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add Out of Band Management Services Module device ID to Intel PMT driver.

Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/mfd/intel_pmt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/intel_pmt.c b/drivers/mfd/intel_pmt.c
index 0e572b105101..8f9970ab3026 100644
--- a/drivers/mfd/intel_pmt.c
+++ b/drivers/mfd/intel_pmt.c
@@ -55,6 +55,8 @@ struct pmt_platform_info {
 	unsigned long quirks;
 };
 
+static const struct pmt_platform_info pmt_info;
+
 static const struct pmt_platform_info tgl_info = {
 	.quirks = PMT_QUIRK_NO_WATCHER | PMT_QUIRK_NO_CRASHLOG |
 		  PMT_QUIRK_TABLE_SHIFT,
@@ -200,8 +202,10 @@ static void pmt_pci_remove(struct pci_dev *pdev)
 	pm_runtime_get_sync(&pdev->dev);
 }
 
+#define PCI_DEVICE_ID_INTEL_PMT_OOBMSM	0x09a7
 #define PCI_DEVICE_ID_INTEL_PMT_TGL	0x9a0d
 static const struct pci_device_id pmt_pci_ids[] = {
+	{ PCI_DEVICE_DATA(INTEL, PMT_OOBMSM, &pmt_info) },
 	{ PCI_DEVICE_DATA(INTEL, PMT_TGL, &tgl_info) },
 	{ }
 };
-- 
2.20.1
