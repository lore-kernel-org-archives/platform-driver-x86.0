Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057314;
	b=GRJqaDZ5Lg01e1m4wmkYnoqjXPe208/jmqYM5jG6eNdIL85NsgshFBOYUpuBHaVPA/re
	 /kkhTPFUvGplTsFF6XoB66LgyFKlicS9/SqhhSNZn+YSPj28asDYYWBIi73dT/ZhCIbXH
	 NgA+6C9hD2wun9r03oWGC9cTIk+1wCTdpvbsGSW6ov0VC3A7xhULwR3p1JEf5+MhteT8F
	 S/dYHuFJnP+hZF6eBgwHpj1wVvETYIrwteLNHq+tJdfQcp+d3ZMcIbYX66lVk+h4VGcKQ
	 gbk5E4bITv0jHpQcjjDwE4DrMrlCa+uNDOJyIRMBqXmDU80mg3Ll2I4+Ny0+xM21YPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057314;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wPH94bFi8hPEE5TiHYlawpVv0uEItiQYJIMZ7P/XwS0=;
	b=UdnRrQ4eQjFwmdJ5dxYB7d3TTLW0SOXHIt661PxMUqnKi/sZsFIHQcbvy1P9LbkXCzth
	 2ShbHIP24qkol57kONRwP+j43cOm0MGghSxneWHcIl+CPZKLycVHgjLqh+tPpvSxpCzkx
	 55p6nqYExfzdUSiGGgLZzRpTiO/GbpWfuQ/+xtct2bYIzuUjXUUXARG/Te84ytww4PqO5
	 1uHDvEaWUapSJb2jXwJ3KyK0l5TW2mYkEm40sm/V+zcn40LcBTH9WBaSQAUtlVGlOMGxy
	 pQUB1IIgsASlY7EsHj4RwS4D6E7QZP8OirUoQp5QJeHUv4Q7mVFhhxPxYg0uhVQ6JKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gy50EYI2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B67660A3806;
	Thu, 19 Nov 2026 03:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gy50EYI2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40B91F000C5;
	Thu, 19 Nov 2026 03:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795057314;
	bh=wPH94bFi8hPEE5TiHYlawpVv0uEItiQYJIMZ7P/XwS0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gy50EYI2gIdq49uJqiC6+FdAe7Atc4RHZQI+9OArss4Ld8VWbwXhjt2SZDpAgUchF
	 Ese7gtexfWC1seEoxkRdZ98jvJAGOAkZsGfih7uEO9dJCmqukDr3tpBV4NXi3f4Tab
	 8Spm2jPUKGpCYnGwK4VjjywgqkgWfyoPTjf3wRTa7NM3nUhpC3KsO3borFvgXOW1bp
	 83dRRDvlLLzRT4oKLO4hQ1As9RFBTAJ4Ht9iK57B14NbH3PgVMjrlD2kbbaVzTv0A2
	 b8c3cKffSp3qxI2GIvWQkRWIvyvirVGfICZEpekE8Vs9kh/XAnjMEY/h8jYqKj4L86
	 t9i2iCSiPLTcA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org,
	tfiga@chromium.org
Subject: [PATCH v4 2/3] platform/x86/intel/pmc: Support disabling ACPI PM timer during suspend
Date: Thu, 19 Nov 2026 03:01:16 +0000
Message-ID: <20261119030117.3943303-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <20261119030117.3943303-1-tzungbi@kernel.org>
References: <20261119030117.3943303-1-tzungbi@kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ACPI PM timer is used to drive the ACPI Watchdog Action Table
(wdat_wdt) hardware watchdog.  Since the watchdog is stopped during
suspend, the timer does not need to remain active while suspended, and
leaving it running can block deep S0ix states.

Add acpi_pm_tmr_ctl_offset and acpi_pm_tmr_disable_bit to
struct pmc_reg_map so platforms can opt in to disabling the ACPI PM
timer on suspend and re-enabling it on resume only if it was enabled
prior to suspend.

When CONFIG_X86_PM_TIMER is set, toggle the timer via
acpi_pmtmr_register_suspend_resume_callback() so it runs inside
clocksource_suspend()/clocksource_resume() and never stops an active
acpi_pm clocksource while timekeeping reads it.

When CONFIG_X86_PM_TIMER is not set, fall back to
pmc_core_suspend()/pmc_core_resume().

Unlike commit e86c8186d03a ("platform/x86:intel/pmc: Enable the ACPI PM
Timer to be turned off when suspended"), which was later reverted in
commit 5fa607880168 ("platform/x86:intel/pmc: Revert "Enable the ACPI
PM Timer to be turned off when suspended""), access the register
without pmcdev->lock so it is safe in tick_freeze() atomic context.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v4:
- New to the series.
- Move code from ptl specific into common path (pmc_core).
---
 drivers/platform/x86/intel/pmc/core.c | 49 +++++++++++++++++++++++++++
 drivers/platform/x86/intel/pmc/core.h | 11 ++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 47759b2a8012..8d9b6962e3bc 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -16,6 +16,7 @@ enum header_type {
 	HEADER_VALUE,
 };
 
+#include <linux/acpi_pmtmr.h>
 #include <linux/bitfield.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -1923,6 +1924,38 @@ static void pmc_core_clean_structure(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static void pmc_core_set_acpi_pm_timer(void *data, bool suspend)
+{
+	struct pmc_dev *pmcdev = data;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const struct pmc_reg_map *map;
+	u8 val, old_val;
+
+	if (!pmc || !pmc->regbase || !pmc->map)
+		return;
+
+	map = pmc->map;
+	if (!map->acpi_pm_tmr_ctl_offset)
+		return;
+
+	if (!suspend && !pmcdev->pm_timer_enabled)
+		return;
+
+	val = readb(pmc->regbase + map->acpi_pm_tmr_ctl_offset);
+	old_val = val;
+
+	if (suspend) {
+		pmcdev->pm_timer_enabled = !(old_val & map->acpi_pm_tmr_disable_bit);
+		if (pmcdev->pm_timer_enabled)
+			val |= map->acpi_pm_tmr_disable_bit;
+	} else {
+		val &= ~map->acpi_pm_tmr_disable_bit;
+	}
+
+	if (val != old_val)
+		writeb(val, pmc->regbase + map->acpi_pm_tmr_ctl_offset);
+}
+
 static int pmc_core_probe(struct platform_device *pdev)
 {
 	static bool device_initialized;
@@ -1985,6 +2018,11 @@ static int pmc_core_probe(struct platform_device *pdev)
 	pm_report_max_hw_sleep(FIELD_MAX(SLP_S0_RES_COUNTER_MASK) *
 			       pmc_core_adjust_slp_s0_step(primary_pmc, 1));
 
+	if (IS_ENABLED(CONFIG_X86_PM_TIMER) &&
+	    primary_pmc->map->acpi_pm_tmr_ctl_offset)
+		acpi_pmtmr_register_suspend_resume_callback(pmc_core_set_acpi_pm_timer,
+							    pmcdev);
+
 	device_initialized = true;
 	dev_info(&pdev->dev, " initialized\n");
 
@@ -1994,6 +2032,11 @@ static int pmc_core_probe(struct platform_device *pdev)
 static void pmc_core_remove(struct platform_device *pdev)
 {
 	struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
+
+	if (IS_ENABLED(CONFIG_X86_PM_TIMER) &&
+	    pmcdev->pmcs[PMC_IDX_MAIN]->map->acpi_pm_tmr_ctl_offset)
+		acpi_pmtmr_unregister_suspend_resume_callback();
+
 	pmc_core_dbgfs_unregister(pmcdev);
 	pmc_core_clean_structure(pdev);
 }
@@ -2032,6 +2075,9 @@ static __maybe_unused int pmc_core_suspend(struct device *dev)
 	if (pmc_core_dev_state_get(pmc, &pmcdev->s0ix_counter))
 		return -EIO;
 
+	if (!IS_ENABLED(CONFIG_X86_PM_TIMER))
+		pmc_core_set_acpi_pm_timer(pmcdev, true);
+
 	return 0;
 }
 
@@ -2124,6 +2170,9 @@ static __maybe_unused int pmc_core_resume(struct device *dev)
 {
 	struct pmc_dev *pmcdev = dev_get_drvdata(dev);
 
+	if (!IS_ENABLED(CONFIG_X86_PM_TIMER))
+		pmc_core_set_acpi_pm_timer(pmcdev, false);
+
 	if (ltr_ignore_all_suspend)
 		pmc_core_ltr_restore_all(pmcdev);
 
diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index e55164e5807f..0ec874f2a992 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -362,6 +362,10 @@ enum ppfear_regs {
 #define PMC_DEVID_NVL_PCDS	0xd47e
 #define PMC_DEVID_NVL_PCHS	0x6e27
 
+/* ACPI PM timer */
+#define ACPI_TMR_CTL_OFFSET	0x18fc
+#define ACPI_TIM_DIS		BIT(1)
+
 extern const char *pmc_lpm_modes[];
 
 struct pmc_bit_map {
@@ -392,6 +396,8 @@ struct pmc_bit_map {
  * @num_s0ix_blocker:	Number of S0ix blockers
  * @blocker_req_offset:	Telemetry offset to S0ix blocker low power mode substate requirement table
  * @lpm_req_guid:	Telemetry GUID to read low power mode substate requirement table
+ * @acpi_pm_tmr_ctl_offset: PWRMBASE offset to ACPI PM timer control register
+ * @acpi_pm_tmr_disable_bit: Bit mask to disable ACPI PM timer
  *
  * Each PCH has unique set of register offsets and bit indexes. This structure
  * captures them to have a common implementation.
@@ -435,6 +441,9 @@ struct pmc_reg_map {
 	const u32 pson_residency_counter_step;
 	/* GUID for telemetry regions */
 	const u32 lpm_req_guid;
+	/* ACPI PM timer registers */
+	const u32 acpi_pm_tmr_ctl_offset;
+	const u8 acpi_pm_tmr_disable_bit;
 };
 
 /**
@@ -487,6 +496,7 @@ struct pmc {
  * @s0ix_counter:	S0ix residency (step adjusted)
  * @suspend:		Function to perform platform specific suspend
  * @resume:		Function to perform platform specific resume
+ * @pm_timer_enabled:	Whether the ACPI PM timer was enabled before suspend
  *
  * @pkgc_ltr_blocker_counters: Array of PKGC LTR blocker counters
  * @pkgc_ltr_blocker_offset: Offset to PKGC LTR blockers in telemetry region
@@ -506,6 +516,7 @@ struct pmc_dev {
 	u64 s0ix_counter;
 	void (*suspend)(struct pmc_dev *pmcdev);
 	int (*resume)(struct pmc_dev *pmcdev);
+	bool pm_timer_enabled;
 
 	u64 *pkgc_res_cnt;
 	u8 num_of_pkgc;
-- 
2.56.1.708.g77570a6a1d-goog

