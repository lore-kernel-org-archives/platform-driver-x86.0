From: David Cohen <david.a.cohen@linux.intel.com>
Subject: [PATCH 01/10] mrst: Fixed printk/pr_* related issues
Date: Wed,  9 Oct 2013 22:51:39 -0700
Message-ID: <1381384308-14066-2-git-send-email-david.a.cohen@linux.intel.com>
References: <1381384308-14066-1-git-send-email-david.a.cohen@linux.intel.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1381384308-14066-1-git-send-email-david.a.cohen@linux.intel.com>
Sender: linux-doc-owner@vger.kernel.org
To: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com
Cc: linux-doc@vger.kernel.org, x86@kernel.org, platform-driver-x86@vger.kernel.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, David Cohen <david.a.cohen@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Fixed printk and pr_* related issues in mrst related files.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: David Cohen <david.a.cohen@linux.intel.com>
---
 arch/x86/platform/mrst/early_printk_mrst.c |    2 +-
 arch/x86/platform/mrst/mrst.c              |    2 +-
 arch/x86/platform/mrst/vrtc.c              |    5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/x86/platform/mrst/early_printk_mrst.c b/arch/x86/platform/mrst/early_printk_mrst.c
index 028454f..95880f7 100644
--- a/arch/x86/platform/mrst/early_printk_mrst.c
+++ b/arch/x86/platform/mrst/early_printk_mrst.c
@@ -213,7 +213,7 @@ static void early_mrst_spi_putc(char c)
 	}
 
 	if (!timeout)
-		pr_warning("MRST earlycon: timed out\n");
+		pr_warn("MRST earlycon: timed out\n");
 	else
 		max3110_write_data(c);
 }
diff --git a/arch/x86/platform/mrst/mrst.c b/arch/x86/platform/mrst/mrst.c
index 3ca5957..b9aeb54 100644
--- a/arch/x86/platform/mrst/mrst.c
+++ b/arch/x86/platform/mrst/mrst.c
@@ -328,7 +328,7 @@ static inline int __init setup_x86_mrst_timer(char *arg)
 	else if (strcmp("lapic_and_apbt", arg) == 0)
 		mrst_timer_options = MRST_TIMER_LAPIC_APBT;
 	else {
-		pr_warning("X86 MRST timer option %s not recognised"
+		pr_warn("X86 MRST timer option %s not recognised"
 			   " use x86_mrst_timer=apbt_only or lapic_and_apbt\n",
 			   arg);
 		return -EINVAL;
diff --git a/arch/x86/platform/mrst/vrtc.c b/arch/x86/platform/mrst/vrtc.c
index 5e355b1..ca4f7d9 100644
--- a/arch/x86/platform/mrst/vrtc.c
+++ b/arch/x86/platform/mrst/vrtc.c
@@ -79,7 +79,7 @@ void vrtc_get_time(struct timespec *now)
 	/* vRTC YEAR reg contains the offset to 1972 */
 	year += 1972;
 
-	printk(KERN_INFO "vRTC: sec: %d min: %d hour: %d day: %d "
+	pr_info("vRTC: sec: %d min: %d hour: %d day: %d "
 		"mon: %d year: %d\n", sec, min, hour, mday, mon, year);
 
 	now->tv_sec = mktime(year, mon, mday, hour, min, sec);
@@ -109,8 +109,7 @@ int vrtc_set_mmss(const struct timespec *now)
 		vrtc_cmos_write(tm.tm_sec, RTC_SECONDS);
 		spin_unlock_irqrestore(&rtc_lock, flags);
 	} else {
-		printk(KERN_ERR
-		       "%s: Invalid vRTC value: write of %lx to vRTC failed\n",
+		pr_err("%s: Invalid vRTC value: write of %lx to vRTC failed\n",
 			__FUNCTION__, now->tv_sec);
 		retval = -EINVAL;
 	}
-- 
1.7.9.5

