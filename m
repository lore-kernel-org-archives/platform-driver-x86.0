From: Chen Zhou <chenzhou10@huawei.com>
Subject: [PATCH -next] platform/x86: intel_pmc_core: fix build error without CONFIG_DEBUG_FS
Date: Thu, 20 Feb 2020 11:33:35 +0800
Message-ID: <20200220033335.106963-1-chenzhou10@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rajneesh.bhardwaj@intel.com, vishwanath.somayaji@intel.com
Cc: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, chenzhou10@huawei.com
List-Id: platform-driver-x86.vger.kernel.org

If CONFIG_DEBUG_FS is n, build fails:

drivers/platform/x86/intel_pmc_core.c: In function pmc_core_resume:
drivers/platform/x86/intel_pmc_core.c:1327:3: error: implicit declaration of function pmc_core_slps0_display; did you mean pmc_core_is_pc10_failed? [-Werror=implicit-function-declaration]
   pmc_core_slps0_display(pmcdev, dev, NULL);
      ^~~~~~~~~~~~~~~~~~~~~~

Function pmc_core_slps0_display() is responsible for displaying debug
registers, which is under CONFIG_DEBUG_FS.

Providing the static inline stub whenever CONFIG_DEBUG_FS is disabled
to fix this. Function pmc_core_lpm_display() is the same.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 drivers/platform/x86/intel_pmc_core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index f4a36fb..939f8e0 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -1117,6 +1117,20 @@ static void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 	}
 }
 #else
+static inline void pmc_core_slps0_display(struct pmc_dev *pmcdev,
+					   struct device *dev,
+					   struct seq_file *s)
+{
+}
+
+static inline void pmc_core_lpm_display(struct pmc_dev *pmcdev,
+					 struct device *dev,
+					 struct seq_file *s, u32 offset,
+					 const char *str,
+					 const struct pmc_bit_map **maps)
+{
+}
+
 static inline void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 {
 }
-- 
2.7.4
