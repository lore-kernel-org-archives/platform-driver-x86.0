Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919D91DA327
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jul 2024 11:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720006743; cv=none; b=V+vcKilQO6KyS3gvUuy4tlIMBvZh1GTyl31efOll+A3FcmQ1OkZomu7ySXCCtgLtiQ1y2sRK9QW++dJaUJ3DZ2O8y7rgaC53Ar7qxpcbVgiR/Biq4mrXpq3ZgoKUUUx/mcbSqWzNtT52sh2B8L8h9ydoAN4pJ8qj2nLpUXUvbqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720006743; c=relaxed/simple;
	bh=MJooJ3APQfv7qGYC27a7K4ufNq7wbf14uUFNF1Y2mk8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VGCbSZyV3AmTwT4bR3LbG1mGimYvU+wusbFEU9l73Fi3C8RE+btz6ques0D2Mf8lrmwXSqpHuWgO+bWTh4RMrVHl6niSGeCldI3tVCHANiDnhVIcKKBnpPBce3ZVhckAcUenvmMRbHQj1Ppt9ASBYS6w5/Wb0Yz3ZWpGgz6LOlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hvE26SOg; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hvE26SOg"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62d054b1ceeso87314097b3.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Jul 2024 04:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720006740; x=1720611540; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g5NUOcnqSgFTC0cjvcAJs2CTu1IFaCLpTQoJfYnl3NA=;
        b=hvE26SOgd3G33gh2/Rl2+OxAisHbuWfaKsfft+u5MrXTSX4qGlbRnpjapfH00/Unq9
         nYdXYUY/OPyN3wlU1bubbxaaqHCIvjqzu9cBuxuLApVqL84zFaGXd1u1qd4bacCCLeMa
         r7fT/i91f8g6y1yJICs+r8X7NLFA00OFSxJXrqB001x+4eGvCnWopXUWY/DqjhGw0cRr
         IcdfYpPhsOqOMmjJpc0qcJl/bU5xqGRqDYJr4K/DEVBP8jxrfbrCMehzhvWilzDTJObC
         EZy37fuwxbADb3QOI4ny1m2+ULrOHfR9Id6C3/rb5d2PEbm4qURL9uZO5i3vWwKCUJUv
         GZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720006740; x=1720611540;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g5NUOcnqSgFTC0cjvcAJs2CTu1IFaCLpTQoJfYnl3NA=;
        b=WGNG2SP940PVxyIiDnrsTcREbIIN4o2BCRYRN9pJxNMbfbannSCxXzEtbJfg6rBh5m
         cs+UXa5BwLbwVfO+280SXSXA0tPerVvfpnbrNKjqVD1DzCCsDHiFMPtf0WntarzFz6eM
         W/l0x+jUeSs+/EnyJSlhl4BhJ1h55vMzFw78oqtlKKUer09KSqii4y+6lHnDGKR4tHc4
         o3K6RlmMbBMLOc8+E9Rl31JVDHpkzRqgCTdAgDXxUomqH3n9w8jDnlNgINSRvvJ5sTqG
         BWgmIRSs05EvxNonVMTgZbtXh/az8d+qpmmmbeUiNnNhP0tGl09+tcXsOZG9wusPLbcK
         Urwg==
X-Forwarded-Encrypted: i=1; AJvYcCUx+T7+Ivo89pBWTHD375Yk9iQulXuDMwTp8FvWVfOvvaU8hnDbM9Hk8pT19Whz8SeX/VlybXZhDSB6rY85yNlXvqOQHcn6yl4Qc9bV76Issa7Bag==
X-Gm-Message-State: AOJu0YxT9kwb0HmLZUPt6NNV8xTiDtI2gCpt25W1HzcJFlB5vsyujGmf
	3XaMthivJxtSmS0FZ9iAPft9zwwLU4F7mizlvtU4fKJVr/7HZpkfAEh2P8GWbazJeAaKC7cIAKT
	Jmse9pF05+DWvFg==
X-Google-Smtp-Source: AGHT+IH1fn2NyleiBE/Y99h9fhkrjRMMh3G9qTAfGpFmRIc1JHDSPiUoqZwI5zM5wzWi3W6XVrH1GB8mJGLV3c4=
X-Received: from mmaslanka2.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:b8d])
 (user=mmaslanka job=sendgmr) by 2002:a0d:eb08:0:b0:648:afcb:a7d1 with SMTP id
 00721157ae682-64c768608edmr364957b3.6.1720006740519; Wed, 03 Jul 2024
 04:39:00 -0700 (PDT)
Date: Wed,  3 Jul 2024 11:38:49 +0000
In-Reply-To: <CAGcaFA3c_rc6HVVqc2=UqOgu2c7zX_XTWNx7Yf-KL7W8LgEi7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAGcaFA3c_rc6HVVqc2=UqOgu2c7zX_XTWNx7Yf-KL7W8LgEi7A@mail.gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240703113850.2726539-1-mmaslanka@google.com>
Subject: [PATCH v2] platform/x86:intel/pmc: Enable the ACPI PM Timer to be
 turned off when suspended
From: Marek Maslanka <mmaslanka@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marek Maslanka <mmaslanka@google.com>, Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
	David E Box <david.e.box@intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Allow to disable ACPI PM Timer on suspend and enable on resume. A
disabled timer helps optimise power consumption when the system is
suspended. On resume the timer is only reactivated if it was activated
prior to suspend, so unless the ACPI PM timer is enabled in the BIOS,
this won't change anything.

Signed-off-by: Marek Maslanka <mmaslanka@google.com>
---
 drivers/platform/x86/intel/pmc/adl.c  |  2 ++
 drivers/platform/x86/intel/pmc/cnp.c  |  2 ++
 drivers/platform/x86/intel/pmc/core.c | 37 +++++++++++++++++++++++++++
 drivers/platform/x86/intel/pmc/core.h |  8 ++++++
 drivers/platform/x86/intel/pmc/icl.c  |  2 ++
 drivers/platform/x86/intel/pmc/mtl.c  |  2 ++
 drivers/platform/x86/intel/pmc/spt.c  |  2 ++
 drivers/platform/x86/intel/pmc/tgl.c  |  2 ++
 8 files changed, 57 insertions(+)

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
index 10c96c1a850af..e97ac7a8a18bc 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1171,6 +1171,35 @@ static bool pmc_core_is_pson_residency_enabled(struct pmc_dev *pmcdev)
 	return val == 1;
 }
 
+/*
+ * Enable or disable APCI PM Timer
+ *
+ * @return: Previous APCI PM Timer enabled state
+ */
+static bool pmc_core_enable_apci_pm_timer(struct pmc_dev *pmcdev, bool enable)
+{
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	const struct pmc_reg_map *map = pmc->map;
+	bool state;
+	u32 reg;
+
+	if (!map->acpi_pm_tmr_ctl_offset)
+		return false;
+
+	mutex_lock(&pmcdev->lock);
+
+	reg = pmc_core_reg_read(pmc, map->acpi_pm_tmr_ctl_offset);
+	state = !(reg & map->acpi_pm_tmr_disable_bit);
+	if (enable)
+		reg &= ~map->acpi_pm_tmr_disable_bit;
+	else
+		reg |= map->acpi_pm_tmr_disable_bit;
+	pmc_core_reg_write(pmc, map->acpi_pm_tmr_ctl_offset, reg);
+
+	mutex_unlock(&pmcdev->lock);
+
+	return state;
+}
 
 static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 {
@@ -1446,6 +1475,10 @@ static __maybe_unused int pmc_core_suspend(struct device *dev)
 	if (pmcdev->suspend)
 		pmcdev->suspend(pmcdev);
 
+	/* Disable APCI PM Timer */
+	pmcdev->enable_acpi_pm_timer_on_resume =
+		pmc_core_enable_apci_pm_timer(pmcdev, false);
+
 	/* Check if the syspend will actually use S0ix */
 	if (pm_suspend_via_firmware())
 		return 0;
@@ -1500,6 +1533,10 @@ int pmc_core_resume_common(struct pmc_dev *pmcdev)
 	int offset = pmc->map->lpm_status_offset;
 	int i;
 
+	/* Enable APCI PM Timer */
+	if (pmcdev->enable_acpi_pm_timer_on_resume)
+		pmc_core_enable_apci_pm_timer(pmcdev, true);
+
 	/* Check if the syspend used S0ix */
 	if (pm_suspend_via_firmware())
 		return 0;
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
2.45.2.803.g4e1b14247a-goog

