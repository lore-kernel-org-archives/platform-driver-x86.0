From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v4 33/38] platform/x86: intel_pmc_ipc: Use octal permissions in sysfs attributes
Date: Tue, 21 Jan 2020 19:01:09 +0300
Message-ID: <20200121160114.60007-34-mika.westerberg@linux.intel.com>
References: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mark Brown <broonie@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
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
index 9796656f534a..f912f2a40512 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -215,6 +215,7 @@ static ssize_t intel_pmc_ipc_simple_cmd_store(struct device *dev,
 	}
 	return (ssize_t)count;
 }
+static DEVICE_ATTR(simplecmd, 0200, NULL, intel_pmc_ipc_simple_cmd_store);
 
 static ssize_t intel_pmc_ipc_northpeak_store(struct device *dev,
 					     struct device_attribute *attr,
@@ -239,11 +240,7 @@ static ssize_t intel_pmc_ipc_northpeak_store(struct device *dev,
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
