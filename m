Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B0313D538
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 04:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723437645; cv=none; b=WKsAWt7ZS25MKYpRhDsQAkOciUoJ5/gS/vus9WVy9S2wgJUuiKYotdj8H7nQs2tk7wkFKZhHF+2XShYzI7QbfG7sAhRN5NY6MHqJob3pK5jkH6jG/wevfHwsrVyqwbg6i3pygfR62Re6tqMsO6H3PyZ3e+ITFXySGZ7bVS+PptI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723437645; c=relaxed/simple;
	bh=QNHPrpxL+0sgE/AyG37tJ3Bz2m+41t/dYw/Gsq55ehM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dQbnceFyTDAY/vfSjYj2BIpL4B9Lk4n9dTg0UgG/4i4+x7dVxFaXCr2mcBICj26H9fGpLJXtGa4XtN032+8fin3E0RMQ3xKTSZYrCUZKjrWkSc+5UF75WFq6/nqpNp2VJGJ6TGu/87GA57d2YDQqoVicURwjAs2SDJXYLs9M7S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v96/l6cp; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v96/l6cp"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-68f95e37bbfso100125847b3.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Aug 2024 21:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723437642; x=1724042442; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H7zTpz2DMvimTNNLr+qMsA7Dd9v4fiwi/bdtdNpJM3k=;
        b=v96/l6cp3Pu1rrj8RAHjUNOFppFosIje+e0Po9Smb+OFy94E4JUEAtkVptdZd4hxAC
         H/zB5qynawHRhyKQnUeWEWIzyabaoYnRl169h0533nR3LOcCdj9PxHH/vNJKngzNtCtw
         be421bf6gTaQnTGZoOCVkQGk2j10hSUOSTyY2ZZlTZaXqJKk3evEOW0TNoAslPNc/5Iw
         rbfge6/F6+uWJtwq0zucVaZImDhxlElr3kG51xc2haRTo5k8LeoCtXy3UKvqZcX3FcYG
         eYABmcoGnFXsvEHKvQ9MO9QH8+zd1B0ppDfUqMNGs5y2E55O622e2AdGB6rtlj3dK+vt
         SOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723437642; x=1724042442;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7zTpz2DMvimTNNLr+qMsA7Dd9v4fiwi/bdtdNpJM3k=;
        b=GjxmdN3QcYY6Mg0cyBCPufG6zE9DAwE0NMg4EvQPjUHKH/TskwrUqLTjyq0kpYqTje
         yHX4cWaGg3sEUyiIj7/YmP2HHDCb+QPDcAhO6GdYkvxqppoSS5OuSTZadlAU1RI1bR9U
         jt0MCExgAxaDbfcsENnpIUBzrr3Ir8SqKwtd2ee7V7ocFmZ0uYFwDafWBnF4kXW8Bqvh
         DnhvxKCLB0Q5uLdu2I/zwX5Zsh0JcSTJpNvIPnjaifJAyh05AFKQp6usFysgbVAlZzF9
         oh4zG3GtpKPSRCUeMFgZlwZr0CyJ396FN8CJpWAyIunYmFZd2JHJdXtyi0zloZgEL7aS
         fb/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUc+VvN1TvL+uLTNuxLVYTseWgD0ffrLxRf7Fos2N7GnEOgYRp8UUSxMzDuPSkXzmhKZhVfrlK0tZNnXeBmTATMMQWXCOKkrfcHGHwKUxBaU+Mwg==
X-Gm-Message-State: AOJu0YxFqIojJJziO+pDXVoeLzpYfYaoVibqffLuHL7htRufPPxvTNgE
	PeEwfQOe6gihOsGHEZg3KabQkrpf3r3ZRcH+evYMi5+6y0nYzdrbbAWg+OIuoLeE2DFe8TskP+s
	CTwiyox3AVuezaQ==
X-Google-Smtp-Source: AGHT+IF/SFG1go6c+EX5iNA+YPCcacRoHMoHjkk2tzq7SuIw188amey35LllQMrreFvbpA3jmWcZqONK3c0AdEg=
X-Received: from mmaslanka2.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:b8d])
 (user=mmaslanka job=sendgmr) by 2002:a81:be0d:0:b0:622:cd7d:fec4 with SMTP id
 00721157ae682-69ec9a11e0dmr6654427b3.9.1723437642380; Sun, 11 Aug 2024
 21:40:42 -0700 (PDT)
Date: Mon, 12 Aug 2024 04:40:20 +0000
In-Reply-To: <87h6bttzzh.ffs@tglx>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <87h6bttzzh.ffs@tglx>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
Message-ID: <20240812044028.3439329-1-mmaslanka@google.com>
Subject: [PATCH v5 2/2] platform/x86:intel/pmc: Enable the ACPI PM Timer to be
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
Changes in v5:
- Use renamed acpi_pmtmr_register_suspend_resume_callback instead of
  acpi_pm_register_suspend_resume_callback
- Link to v4: https://lore.kernel.org/lkml/20240809131343.1173369-2-mmaslanka@google.com/
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
index 10c96c1a850af..d65e3e77ec2ca 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -11,6 +11,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/acpi_pmtmr.h>
 #include <linux/bitfield.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
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
+		acpi_pmtmr_register_suspend_resume_callback(pmc_core_acpi_pm_timer_suspend_resume,
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
+		acpi_pmtmr_register_suspend_resume_callback(NULL, NULL);
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

