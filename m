From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH v1 6/6] platform/x86: intel_pmc_core: Update Kconfig
Date: Thu, 11 Jan 2018 16:40:36 +0530
Message-ID: <1515669036-3465-7-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1515669036-3465-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515669036-3465-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, srinivas.pandruvada@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

This adds list of supported features by this driver to the Kconfig.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 683a875f3b6c..5d2c2a180f0c 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -958,7 +958,10 @@ config INTEL_PMC_CORE
 	  exposed by the Power Management Controller.
 
 	  Supported features:
-		- SLP_S0_RESIDENCY counter.
+		- SLP_S0_RESIDENCY counter
+		- PCH IP Power Gating status
+		- LTR Ignore
+		- MPHY/PLL gating status (Sunrisepoint PCH only)
 
 config IBM_RTL
 	tristate "Device driver to enable PRTL support"
-- 
2.7.4
