Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EEB18E04E
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Aug 2024 13:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723209238; cv=none; b=L8VLCbeeY2RZEU0urSlWXT443ijsacxzENFKVzLt64J/cbB3LaCh6BIjsOs4KroFyjGsTEjVeGRr9H9pGYJhcDOXMHKHxfCRGMv4YSqV8rKQ4Sn3EtApaE2oqCdkO5AC85prz1S1qTPotaZmGcHPi6tkjQYCXUyksHHKhT3XLA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723209238; c=relaxed/simple;
	bh=z1ryOnyNdiWyCiOOsK0lRasJ82np/w5l9XEXaAZssw4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BFSShZcSl8YmOjAEVj8CrLZTKkJTTGFhtFLpe44KWYWG/UqslcYOsJ+bms1PIH+/dqBL6EGhvQ4sWZyfVEfg2h40A7a9E7blpD14MdRvLCMESVGVMYIRSWlOaymD29uqVb455FczIeSWrmdf0K/Hv36tuZcC3+Df40i0FRhELRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VsSN4ooo; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VsSN4ooo"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e0e6c47daf7so3717892276.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Aug 2024 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723209235; x=1723814035; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xmVbmThHac5nMA9h4YL4w474nHF4zJOg9scQJM/O2jo=;
        b=VsSN4ooo4lO/Y3QBpFrCYJf+dtM4vmQ60stNvjxQdMPY5SF+xTfwyVpZckj9bp+tmK
         jyPvqcyATGHZeRWyFG7ish/TlvMjjnUHVeWgf32X7BPLqBQyNme8RQ7tGlwoG6ACD9Dh
         6FQXpAWYO6AfaMuh7Iz5WTGWelclC253gMUWCCFlVbXw8afutiL39NaJORSWiqPyf1Ny
         y33KneZaKdcKBDgiy+IX9XeX+md1PAuuzAu7W2vg4n+pE3iHf3QmvJS4H5dqFKhaGHpC
         /UCqRQrjJ+UeRzw+QzsP2XPF0aX9yDNZZXWNrpExicUa5HZNi0XGYDUqfYSRN0U6pYvs
         vnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723209235; x=1723814035;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xmVbmThHac5nMA9h4YL4w474nHF4zJOg9scQJM/O2jo=;
        b=ECNUUhiyF6z2mxuyQlXK/g/dTZViBAF2iCAoQ1x1M43/nisyf/+ZWdbh3M22As/HMa
         mNWxgOkWmTv+CfwFxfv3hVlerO3AMvjTYLNlq1axgPrDDVG5UY7HLQJExfu1lpbEOxWt
         ObpMQD9GmZO64lThZGmt81MSEuO1QlJ+uVlw7flY5LNj/wOyYiUTS2C6uUiboZDve7xo
         R/6oiIV/4k/EkElodYnkgeyvQSyrXY9SHoKVkt58lpXDrYkP7yPwzOEoQnjSR5GDHIgG
         YYX6GmzuSH5uvz1eyw/1UJ9JIefn/6fBGKu8JQJMOm6bqAuZyC2GvGB/tdO5CCcTBFat
         WJQA==
X-Forwarded-Encrypted: i=1; AJvYcCUSycOpiHnNmI7CxEfKHCiZY5UWJChcKNA4anUMC691nSFR7gJXqcboD+/mcKoYXrYs23OG3fCcXsYvQuQlk9u1b5bh@vger.kernel.org
X-Gm-Message-State: AOJu0YzGmv/cZULFrgFUAwvJMt9Z2aMsTRcPRNVy7yHAunJFhWSRIJlF
	U2c/1jq+iS60zdG1loB1x2B6+gq15Im/jDJuJLBwE4gS8lXtqahApQRUT3gUcQLLQI8BWTuIIMi
	v8tsmElyLou51pA==
X-Google-Smtp-Source: AGHT+IHjs6fU9ID4XekBygu4qpGC/paqaxDgn1Rv4wwNJ+wwvsZBJcgiJbkad/eSq9rbZyy9KYLGzBwmWXPh+8k=
X-Received: from mmaslanka2.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:b8d])
 (user=mmaslanka job=sendgmr) by 2002:a25:2bc8:0:b0:e0b:ab63:b9c7 with SMTP id
 3f1490d57ef6-e0eb9a4606amr3324276.7.1723209235532; Fri, 09 Aug 2024 06:13:55
 -0700 (PDT)
Date: Fri,  9 Aug 2024 13:13:33 +0000
In-Reply-To: <20240809131343.1173369-1-mmaslanka@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <28567169-4588-002d-85b8-906d22f12f05@linux.intel.com> <20240809131343.1173369-1-mmaslanka@google.com>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
Message-ID: <20240809131343.1173369-2-mmaslanka@google.com>
Subject: [PATCH v4 2/2] platform/x86:intel/pmc: Enable the ACPI PM Timer to be
 turned off when suspended
From: Marek Maslanka <mmaslanka@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marek Maslanka <mmaslanka@google.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
	David E Box <david.e.box@intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Allow to disable ACPI PM Timer on suspend and enable on resume. A
disabled timer helps optimise power consumption when the system is
suspended. On resume the timer is only reactivated if it was activated
prior to suspend, so unless the ACPI PM timer is enabled in the BIOS,
this won't change anything.

The ACPI PM timer is used by Intel's iTCO/wdat_wdt watchdog to drive the
watchdog, so it doesn't need to run during suspend.

Signed-off-by: Marek Maslanka <mmaslanka@google.com>

---
Changes in v4:
- Enable/disable ACPI PM Timer with the clocksource resume/suspend
  process instead of during pmc_core resume/suspend. Use added callback
  in acpi_pm to do this.
- Do not rely on current set clocksource to check if ACPI PM Timer can
  be disabled.
- Link to v3: https://lore.kernel.org/lkml/20240730120546.1042515-1-mmaslanka@google.com/
---
---
 drivers/platform/x86/intel/pmc/adl.c  |  2 ++
 drivers/platform/x86/intel/pmc/cnp.c  |  2 ++
 drivers/platform/x86/intel/pmc/core.c | 49 +++++++++++++++++++++++++++
 drivers/platform/x86/intel/pmc/core.h |  8 +++++
 drivers/platform/x86/intel/pmc/icl.c  |  2 ++
 drivers/platform/x86/intel/pmc/mtl.c  |  2 ++
 drivers/platform/x86/intel/pmc/spt.c  |  2 ++
 drivers/platform/x86/intel/pmc/tgl.c  |  2 ++
 8 files changed, 69 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/adl.c b/drivers/platform/x86/intel/pmc/adl.c
index e7878558fd909..9d9c07f44ff61 100644
--- a/drivers/platform/x86/intel/pmc/adl.c
+++ b/drivers/platform/x86/intel/pmc/adl.c
@@ -295,6 +295,8 @@ const struct pmc_reg_map adl_reg_map = {
 	.ppfear_buckets = CNP_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
+	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
+	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.ltr_ignore_max = ADL_NUM_IP_IGN_ALLOWED,
 	.lpm_num_modes = ADL_LPM_NUM_MODES,
 	.lpm_num_maps = ADL_LPM_NUM_MAPS,
diff --git a/drivers/platform/x86/intel/pmc/cnp.c b/drivers/platform/x86/intel/pmc/cnp.c
index dd72974bf71e2..513c02670c5aa 100644
--- a/drivers/platform/x86/intel/pmc/cnp.c
+++ b/drivers/platform/x86/intel/pmc/cnp.c
@@ -200,6 +200,8 @@ const struct pmc_reg_map cnp_reg_map = {
 	.ppfear_buckets = CNP_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
+	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
+	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.ltr_ignore_max = CNP_NUM_IP_IGN_ALLOWED,
 	.etr3_offset = ETR3_OFFSET,
 };
diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 10c96c1a850af..f6a29530347bb 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -29,6 +29,7 @@
 
 #include "core.h"
 #include "../pmt/telemetry.h"
+#include "../../../../clocksource/acpi_pm.h"
 
 /* Maximum number of modes supported by platfoms that has low power mode capability */
 const char *pmc_lpm_modes[] = {
@@ -1171,6 +1172,42 @@ static bool pmc_core_is_pson_residency_enabled(struct pmc_dev *pmcdev)
 	return val == 1;
 }
 
+/**
+ * Enable or disable ACPI PM Timer
+ *
+ * This function is intended to be a callback for ACPI PM suspend/resume event.
+ * The ACPI PM Timer is enabled on resume only if it was enabled during suspend.
+ */
+static void pmc_core_acpi_pm_timer_suspend_resume(void *data, bool suspend)
+{
+	struct pmc_dev *pmcdev = data;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const struct pmc_reg_map *map = pmc->map;
+	bool enabled;
+	u32 reg;
+
+	if (!map->acpi_pm_tmr_ctl_offset)
+		return;
+
+	mutex_lock(&pmcdev->lock);
+
+	if (!suspend && !pmcdev->enable_acpi_pm_timer_on_resume) {
+		mutex_unlock(&pmcdev->lock);
+		return;
+	}
+
+	reg = pmc_core_reg_read(pmc, map->acpi_pm_tmr_ctl_offset);
+	enabled = !(reg & map->acpi_pm_tmr_disable_bit);
+	if (suspend)
+		reg |= map->acpi_pm_tmr_disable_bit;
+	else
+		reg &= ~map->acpi_pm_tmr_disable_bit;
+	pmc_core_reg_write(pmc, map->acpi_pm_tmr_ctl_offset, reg);
+
+	pmcdev->enable_acpi_pm_timer_on_resume = suspend && enabled;
+
+	mutex_unlock(&pmcdev->lock);
+}
 
 static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 {
@@ -1362,6 +1399,7 @@ static int pmc_core_probe(struct platform_device *pdev)
 	struct pmc_dev *pmcdev;
 	const struct x86_cpu_id *cpu_id;
 	int (*core_init)(struct pmc_dev *pmcdev);
+	const struct pmc_reg_map *map;
 	struct pmc *primary_pmc;
 	int ret;
 
@@ -1420,6 +1458,11 @@ static int pmc_core_probe(struct platform_device *pdev)
 	pm_report_max_hw_sleep(FIELD_MAX(SLP_S0_RES_COUNTER_MASK) *
 			       pmc_core_adjust_slp_s0_step(primary_pmc, 1));
 
+	map = primary_pmc->map;
+	if (map->acpi_pm_tmr_ctl_offset)
+		acpi_pm_register_suspend_resume_callback(pmc_core_acpi_pm_timer_suspend_resume,
+							 pmcdev);
+
 	device_initialized = true;
 	dev_info(&pdev->dev, " initialized\n");
 
@@ -1429,6 +1472,12 @@ static int pmc_core_probe(struct platform_device *pdev)
 static void pmc_core_remove(struct platform_device *pdev)
 {
 	struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
+	const struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const struct pmc_reg_map *map = pmc->map;
+
+	if (map->acpi_pm_tmr_ctl_offset)
+		acpi_pm_register_suspend_resume_callback(NULL, NULL);
+
 	pmc_core_dbgfs_unregister(pmcdev);
 	pmc_core_clean_structure(pdev);
 }
diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index 83504c49a0e31..fe1a94f693b63 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -67,6 +67,8 @@ struct telem_endpoint;
 #define SPT_PMC_LTR_SCC				0x3A0
 #define SPT_PMC_LTR_ISH				0x3A4
 
+#define SPT_PMC_ACPI_PM_TMR_CTL_OFFSET		0x18FC
+
 /* Sunrise Point: PGD PFET Enable Ack Status Registers */
 enum ppfear_regs {
 	SPT_PMC_XRAM_PPFEAR0A = 0x590,
@@ -147,6 +149,8 @@ enum ppfear_regs {
 #define SPT_PMC_VRIC1_SLPS0LVEN			BIT(13)
 #define SPT_PMC_VRIC1_XTALSDQDIS		BIT(22)
 
+#define SPT_PMC_BIT_ACPI_PM_TMR_DISABLE		BIT(1)
+
 /* Cannonlake Power Management Controller register offsets */
 #define CNP_PMC_SLPS0_DBG_OFFSET		0x10B4
 #define CNP_PMC_PM_CFG_OFFSET			0x1818
@@ -344,6 +348,8 @@ struct pmc_reg_map {
 	const u8  *lpm_reg_index;
 	const u32 pson_residency_offset;
 	const u32 pson_residency_counter_step;
+	const u32 acpi_pm_tmr_ctl_offset;
+	const u32 acpi_pm_tmr_disable_bit;
 };
 
 /**
@@ -417,6 +423,8 @@ struct pmc_dev {
 	u32 die_c6_offset;
 	struct telem_endpoint *punit_ep;
 	struct pmc_info *regmap_list;
+
+	bool enable_acpi_pm_timer_on_resume;
 };
 
 enum pmc_index {
diff --git a/drivers/platform/x86/intel/pmc/icl.c b/drivers/platform/x86/intel/pmc/icl.c
index 71b0fd6cb7d84..cbbd440544688 100644
--- a/drivers/platform/x86/intel/pmc/icl.c
+++ b/drivers/platform/x86/intel/pmc/icl.c
@@ -46,6 +46,8 @@ const struct pmc_reg_map icl_reg_map = {
 	.ppfear_buckets = ICL_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
+	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
+	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.ltr_ignore_max = ICL_NUM_IP_IGN_ALLOWED,
 	.etr3_offset = ETR3_OFFSET,
 };
diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
index c7d15d864039d..91f2fa728f5c8 100644
--- a/drivers/platform/x86/intel/pmc/mtl.c
+++ b/drivers/platform/x86/intel/pmc/mtl.c
@@ -462,6 +462,8 @@ const struct pmc_reg_map mtl_socm_reg_map = {
 	.ppfear_buckets = MTL_SOCM_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
+	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
+	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.lpm_num_maps = ADL_LPM_NUM_MAPS,
 	.ltr_ignore_max = MTL_SOCM_NUM_IP_IGN_ALLOWED,
 	.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,
diff --git a/drivers/platform/x86/intel/pmc/spt.c b/drivers/platform/x86/intel/pmc/spt.c
index ab993a69e33ee..2cd2b3c68e468 100644
--- a/drivers/platform/x86/intel/pmc/spt.c
+++ b/drivers/platform/x86/intel/pmc/spt.c
@@ -130,6 +130,8 @@ const struct pmc_reg_map spt_reg_map = {
 	.ppfear_buckets = SPT_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = SPT_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = SPT_PMC_READ_DISABLE_BIT,
+	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
+	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.ltr_ignore_max = SPT_NUM_IP_IGN_ALLOWED,
 	.pm_vric1_offset = SPT_PMC_VRIC1_OFFSET,
 };
diff --git a/drivers/platform/x86/intel/pmc/tgl.c b/drivers/platform/x86/intel/pmc/tgl.c
index e0580de180773..371b4e30f1426 100644
--- a/drivers/platform/x86/intel/pmc/tgl.c
+++ b/drivers/platform/x86/intel/pmc/tgl.c
@@ -197,6 +197,8 @@ const struct pmc_reg_map tgl_reg_map = {
 	.ppfear_buckets = ICL_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
+	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
+	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.ltr_ignore_max = TGL_NUM_IP_IGN_ALLOWED,
 	.lpm_num_maps = TGL_LPM_NUM_MAPS,
 	.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,
-- 
2.46.0.76.ge559c4bf1a-goog

