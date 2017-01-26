From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH 1/3] intel_sgx: do not use BUG() in sgx_free_page()
Date: Thu, 26 Jan 2017 23:20:36 +0200
Message-ID: <20170126212038.12809-2-jarkko.sakkinen@linux.intel.com>
References: <20170126212038.12809-1-jarkko.sakkinen@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170126212038.12809-1-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: intel-sgx-kernel-dev@lists.01.org
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Darren Hart <dvhart@infradead.org>, "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

EREMOVE fails on non-EPC page or when a SECS page with children is to be
removed. These do not happen if the driver is working correctly. Log the
error but do not crash the driver.

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 drivers/platform/x86/intel_sgx_page_cache.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel_sgx_page_cache.c b/drivers/platform/x86/intel_sgx_page_cache.c
index d073057..7f73ac7 100644
--- a/drivers/platform/x86/intel_sgx_page_cache.c
+++ b/drivers/platform/x86/intel_sgx_page_cache.c
@@ -551,10 +551,8 @@ void sgx_free_page(struct sgx_epc_page *entry,
 		ret = __eremove(epc);
 		sgx_put_epc_page(epc);
 
-		if (ret) {
-			pr_err("EREMOVE returned %d\n", ret);
-			BUG();
-		}
+		if (ret)
+			sgx_err(encl, "EREMOVE returned %d\n", ret);
 	}
 
 	spin_lock(&sgx_free_list_lock);
-- 
2.9.3
