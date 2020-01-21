From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v4 34/38] platform/x86: intel_pmc_ipc: Propagate error from kstrtoul()
Date: Tue, 21 Jan 2020 19:01:10 +0300
Message-ID: <20200121160114.60007-35-mika.westerberg@linux.intel.com>
References: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mark Brown <broonie@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

kstrtoul() already returns negative error if the input was not valid so
return it directly.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index f912f2a40512..eb4d65768531 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -226,8 +226,9 @@ static ssize_t intel_pmc_ipc_northpeak_store(struct device *dev,
 	int subcmd;
 	int ret;
 
-	if (kstrtoul(buf, 0, &val))
-		return -EINVAL;
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
 
 	if (val)
 		subcmd = 1;
-- 
2.24.1
