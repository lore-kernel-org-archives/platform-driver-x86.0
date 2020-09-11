From: "David E. Box" <david.e.box@linux.intel.com>
Subject: [PATCH 2/3] mfd: intel_pmt: Add Alder Lake (ADL) support
Date: Fri, 11 Sep 2020 12:45:48 -0700
Message-ID: <20200911194549.12780-3-david.e.box@linux.intel.com>
References: <20200911194549.12780-1-david.e.box@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200911194549.12780-1-david.e.box@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: david.e.box@linux.intel.com, lee.jones@linaro.org, dvhart@infradead.org, andy@infradead.org, alexander.h.duyck@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add PMT support for Alder Lake (ADL). Use same quirks as Tiger Lake since
the design is the same, meaning no support for Watcher or Crashlog.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/mfd/intel_pmt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/intel_pmt.c b/drivers/mfd/intel_pmt.c
index 8f9970ab3026..1b57a970a9d7 100644
--- a/drivers/mfd/intel_pmt.c
+++ b/drivers/mfd/intel_pmt.c
@@ -202,9 +202,11 @@ static void pmt_pci_remove(struct pci_dev *pdev)
 	pm_runtime_get_sync(&pdev->dev);
 }
 
+#define PCI_DEVICE_ID_INTEL_PMT_ADL	0x467d
 #define PCI_DEVICE_ID_INTEL_PMT_OOBMSM	0x09a7
 #define PCI_DEVICE_ID_INTEL_PMT_TGL	0x9a0d
 static const struct pci_device_id pmt_pci_ids[] = {
+	{ PCI_DEVICE_DATA(INTEL, PMT_ADL, &tgl_info) },
 	{ PCI_DEVICE_DATA(INTEL, PMT_OOBMSM, &pmt_info) },
 	{ PCI_DEVICE_DATA(INTEL, PMT_TGL, &tgl_info) },
 	{ }
-- 
2.20.1
