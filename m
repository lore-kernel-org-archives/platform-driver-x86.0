From: kernel test robot <lkp@intel.com>
Subject: [RFC PATCH linux-next] platform/x86: thinkpad_acpi:
 dev_attr_charge_start_threshold can be static
Date: Sat, 1 Aug 2020 16:36:54 +0800
Message-ID: <20200801083654.GA31368@144836a6079b>
References: <202008011649.b8CEYWIz%lkp@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <202008011649.b8CEYWIz%lkp@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: kbuild-all@lists.01.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


Fixes: e33929537b76 ("platform/x86: thinkpad_acpi: use standard charge control attribute names")
Signed-off-by: kernel test robot <lkp@intel.com>
---
 thinkpad_acpi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 9eda2f84a3cf98..4864a5c189d464 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9633,13 +9633,13 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
 
 static DEVICE_ATTR_RW(charge_control_start_threshold);
 static DEVICE_ATTR_RW(charge_control_end_threshold);
-struct device_attribute dev_attr_charge_start_threshold = __ATTR(
+static struct device_attribute dev_attr_charge_start_threshold = __ATTR(
 	charge_start_threshold,
 	0644,
 	charge_control_start_threshold_show,
 	charge_control_start_threshold_store
 );
-struct device_attribute dev_attr_charge_stop_threshold = __ATTR(
+static struct device_attribute dev_attr_charge_stop_threshold = __ATTR(
 	charge_stop_threshold,
 	0644,
 	charge_control_end_threshold_show,
