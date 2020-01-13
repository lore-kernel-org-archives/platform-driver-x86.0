From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3 18/36] platform/x86: intel_pmc_ipc: Make intel_pmc_gcr_update() static
Date: Mon, 13 Jan 2020 16:56:05 +0300
Message-ID: <20200113135623.56286-19-mika.westerberg@linux.intel.com>
References: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This function is not called outside of intel_pmc_ipc.c so we can make it
static instead.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/include/asm/intel_pmc_ipc.h | 6 ------
 drivers/platform/x86/intel_pmc_ipc.c | 3 +--
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/intel_pmc_ipc.h b/arch/x86/include/asm/intel_pmc_ipc.h
index 9e7adcdbe031..3b2e8b461520 100644
--- a/arch/x86/include/asm/intel_pmc_ipc.h
+++ b/arch/x86/include/asm/intel_pmc_ipc.h
@@ -40,7 +40,6 @@ int intel_pmc_s0ix_counter_read(u64 *data);
 int intel_pmc_gcr_read(u32 offset, u32 *data);
 int intel_pmc_gcr_read64(u32 offset, u64 *data);
 int intel_pmc_gcr_write(u32 offset, u32 data);
-int intel_pmc_gcr_update(u32 offset, u32 mask, u32 val);
 
 #else
 
@@ -81,11 +80,6 @@ static inline int intel_pmc_gcr_write(u32 offset, u32 data)
 	return -EINVAL;
 }
 
-static inline int intel_pmc_gcr_update(u32 offset, u32 mask, u32 val)
-{
-	return -EINVAL;
-}
-
 #endif /*CONFIG_INTEL_PMC_IPC*/
 
 #endif
diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 5c1da2bb1435..9229c7a16536 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -309,7 +309,7 @@ EXPORT_SYMBOL_GPL(intel_pmc_gcr_write);
  *
  * Return:	negative value on error or 0 on success.
  */
-int intel_pmc_gcr_update(u32 offset, u32 mask, u32 val)
+static int intel_pmc_gcr_update(u32 offset, u32 mask, u32 val)
 {
 	u32 new_val;
 	int ret = 0;
@@ -339,7 +339,6 @@ int intel_pmc_gcr_update(u32 offset, u32 mask, u32 val)
 	spin_unlock(&ipcdev.gcr_lock);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(intel_pmc_gcr_update);
 
 static int update_no_reboot_bit(void *priv, bool set)
 {
-- 
2.24.1
