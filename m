From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3 01/36] platform/x86: intel_mid_powerbtn: Take a copy of ddata
Date: Mon, 13 Jan 2020 16:55:48 +0300
Message-ID: <20200113135623.56286-2-mika.westerberg@linux.intel.com>
References: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The driver gets driver_data from memory that is marked as const (which
is probably put to read-only memory) and it then modifies it. This
likely causes some sort of fault to happen.

Fix this by taking a copy of the structure.

Fixes: c94a8ff14de3 ("platform/x86: intel_mid_powerbtn: make mid_pb_ddata const")
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 292bace83f1e..6f436836fe50 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -146,9 +146,10 @@ static int mid_pb_probe(struct platform_device *pdev)
 
 	input_set_capability(input, EV_KEY, KEY_POWER);
 
-	ddata = (struct mid_pb_ddata *)id->driver_data;
+	ddata = devm_kmemdup(&pdev->dev, (void *)id->driver_data,
+			     sizeof(*ddata), GFP_KERNEL);
 	if (!ddata)
-		return -ENODATA;
+		return -ENOMEM;
 
 	ddata->dev = &pdev->dev;
 	ddata->irq = irq;
-- 
2.24.1
