From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 7/9] platform/x86: intel_pmc_ipc: Use octal permissions in sysfs attributes
Date: Wed, 22 Jan 2020 19:46:17 +0300
Message-ID: <20200122164619.73563-8-mika.westerberg@linux.intel.com>
References: <20200122164619.73563-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200122164619.73563-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This is the current preferred way so replace the S_IWUSR with the
corresponding octal value. While there move the attributes to follow
directly their store functions.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 8527327d88c7..b87036089a54 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -502,6 +502,7 @@ static ssize_t intel_pmc_ipc_simple_cmd_store(struct device *dev,
 	}
 	return (ssize_t)count;
 }
+static DEVICE_ATTR(simplecmd, 0200, NULL, intel_pmc_ipc_simple_cmd_store);
 
 static ssize_t intel_pmc_ipc_northpeak_store(struct device *dev,
 					     struct device_attribute *attr,
@@ -525,11 +526,7 @@ static ssize_t intel_pmc_ipc_northpeak_store(struct device *dev,
 	}
 	return (ssize_t)count;
 }
-
-static DEVICE_ATTR(simplecmd, S_IWUSR,
-		   NULL, intel_pmc_ipc_simple_cmd_store);
-static DEVICE_ATTR(northpeak, S_IWUSR,
-		   NULL, intel_pmc_ipc_northpeak_store);
+static DEVICE_ATTR(northpeak, 0200, NULL, intel_pmc_ipc_northpeak_store);
 
 static struct attribute *intel_ipc_attrs[] = {
 	&dev_attr_northpeak.attr,
-- 
2.24.1
