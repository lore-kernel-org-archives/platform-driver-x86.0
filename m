From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 5/6] platform/x86: intel_ips: Remove unneeded fields and label
Date: Thu,  5 Oct 2017 14:54:19 +0300
Message-ID: <20171005115420.2786-5-andriy.shevchenko@linux.intel.com>
References: <20171005115420.2786-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005115420.2786-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

There are fields in the struct ips_mcp_limits which are not used
anywhere and a label which we may get rid of.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_ips.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 27e70637e40b..9f5afdd123bb 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -259,8 +259,6 @@ static const int IPS_SAMPLE_WINDOW = 5000; /* 5s moving window of samples */
 
 /* Per-SKU limits */
 struct ips_mcp_limits {
-	int cpu_family;
-	int cpu_model; /* includes extended model... */
 	int mcp_power_limit; /* mW units */
 	int core_power_limit;
 	int mch_power_limit;
@@ -1374,7 +1372,7 @@ static struct ips_mcp_limits *ips_detect_cpu(struct ips_driver *ips)
 
 	if (!(boot_cpu_data.x86 == 6 && boot_cpu_data.x86_model == 37)) {
 		dev_info(ips->dev, "Non-IPS CPU detected.\n");
-		goto out;
+		return NULL;
 	}
 
 	rdmsrl(IA32_MISC_ENABLE, misc_en);
@@ -1396,7 +1394,7 @@ static struct ips_mcp_limits *ips_detect_cpu(struct ips_driver *ips)
 		limits = &ips_ulv_limits;
 	else {
 		dev_info(ips->dev, "No CPUID match found.\n");
-		goto out;
+		return NULL;
 	}
 
 	rdmsrl(TURBO_POWER_CURRENT_LIMIT, turbo_power);
@@ -1410,7 +1408,6 @@ static struct ips_mcp_limits *ips_detect_cpu(struct ips_driver *ips)
 		limits->core_power_limit = (tdp / 8) * 1000;
 	}
 
-out:
 	return limits;
 }
 
-- 
2.14.2
