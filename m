From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 35/37] mfd: intel_pmc_bxt: Use octal permissions in sysfs attributes
Date: Mon, 23 Dec 2019 17:17:14 +0300
Message-ID: <20191223141716.13727-36-mika.westerberg@linux.intel.com>
References: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, x86@kernel.org
Cc: Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This is the current preferred way so replace the S_IWUSR with the
corresponding octal value. While there move the attributes to follow
directly their store functions.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/mfd/intel_pmc_bxt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/intel_pmc_bxt.c b/drivers/mfd/intel_pmc_bxt.c
index 850ed55deef0..1591e4ecf5e5 100644
--- a/drivers/mfd/intel_pmc_bxt.c
+++ b/drivers/mfd/intel_pmc_bxt.c
@@ -206,6 +206,7 @@ static ssize_t intel_pmc_simple_cmd_store(struct device *dev,
 	}
 	return (ssize_t)count;
 }
+static DEVICE_ATTR(simplecmd, 0200, NULL, intel_pmc_simple_cmd_store);
 
 static ssize_t intel_pmc_northpeak_store(struct device *dev,
 					 struct device_attribute *attr,
@@ -231,9 +232,7 @@ static ssize_t intel_pmc_northpeak_store(struct device *dev,
 	}
 	return (ssize_t)count;
 }
-
-static DEVICE_ATTR(simplecmd, S_IWUSR, NULL, intel_pmc_simple_cmd_store);
-static DEVICE_ATTR(northpeak, S_IWUSR, NULL, intel_pmc_northpeak_store);
+static DEVICE_ATTR(northpeak, 0200, NULL, intel_pmc_northpeak_store);
 
 static struct attribute *intel_pmc_attrs[] = {
 	&dev_attr_northpeak.attr,
-- 
2.24.0
