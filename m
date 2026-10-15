Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC383B42EB;
	Thu, 15 Oct 2026 03:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036654; cv=none; b=gjKTJAn+Nnd8oPxG60LDQBKurQ/CtA211atSqbLSK/5aASZuv9m24/fX3O5VnqxilS1zqwQkaIRc9h6puQNljAAZ4p1Mt6QYDBrd8gFsjgDi8DLTlUPsarxKbhnVD9kHsL3OfU8sVfe2/29CNH546pPx3O5Ucc6cgZHpYNl1Q6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036654; c=relaxed/simple;
	bh=1cDFLBVvvHLcDzWB9OQk3LPuPzmQ98hGevHbDfBVBVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PKcml4u8o/gzMB2tGRVvidG2k9a5mrgSMSzk9+sEmuPqVFJOQ+sF9j2m4JVg5uy30CwiFnpsRbEHSKy4YKAZqIiLYn//GZnrU0PnI0B0X5n/GI4iG0r5Cm38lwLWy/eE8rUwlXydfobfuyvkdraPzVfzYFssP91Qg7dOUidcjBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VvcPsxre; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VvcPsxre"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7F11F000C4;
	Thu, 15 Oct 2026 03:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792036652;
	bh=NdklXL+J+QrsiUIcd4Y8eww9fU6DL57yTDm47tGpRmI=;
	h=From:To:Cc:Subject:Date;
	b=VvcPsxreJKuXnD5r2PsAfUFkASVdn7mi7ckpeO+50e6VrdXkL3InUiEKMMJ8oyseU
	 dt1H1OjTyjc67wdPQxjWjLhi+otu3emPaBCayfLAHC6kTiQhAed/ykBeDf3B9Kb5N6
	 RfgEGpGGoZu4lfyE2EqUhkLjT93Da/LYkD56kdLnOBnlJhUZL6k+EN7p4dJsJvXH0E
	 UZQtCvkxKqPL21MMX2h7yJXM81hSPGI4+A2kim9p45rWoR1Yz2qUYCN49PrIuqV5OD
	 GFhsnoGAgaVu/CNMSeugeFioIpk44SzIr6WnIWp3Jowfx/IkprUuHy2g43ajtLdcG1
	 a3O7rhx2IONOA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tzungbi@kernel.org,
	tfiga@chromium.org
Subject: [PATCH] platform/x86/intel/pmc: Disable ACPI PM timer during suspend on Panther Lake
Date: Thu, 15 Oct 2026 03:57:11 +0000
Message-ID: <20261015035712.3604634-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ACPI PM timer is used to drive the ACPI Watchdog Action Table
(wdat_wdt) hardware watchdog.  When the ACPI PM timer is enabled by
firmware on Panther Lake, leaving it running during s2idle prevents the
SoC from entering its deepest S0i2.2 substate (staying in S0i2.1).

Since the watchdog is stopped during system suspend, the ACPI PM timer
does not need to remain active while suspended.  Disable the timer via
ACPI_TMR_CTL (PWRMBASE + 0x18fc) in ptl_suspend() and re-enable it in
ptl_resume() only if it was active prior to suspend.

Unlike commit e86c8186d03a ("platform/x86:intel/pmc: Enable the ACPI PM
Timer to be turned off when suspended"), which was reverted in commit
5fa607880168 because it acquired pmcdev->lock from the acpi_pm
clocksource suspend callback inside tick_freeze() atomic context, toggle
the register in ptl_suspend() and ptl_resume() without taking
pmcdev->lock.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/x86/intel/pmc/core.h |  2 ++
 drivers/platform/x86/intel/pmc/ptl.c  | 35 ++++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index e55164e5807f..a5bd45c4b44e 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -487,6 +487,7 @@ struct pmc {
  * @s0ix_counter:	S0ix residency (step adjusted)
  * @suspend:		Function to perform platform specific suspend
  * @resume:		Function to perform platform specific resume
+ * @pm_timer_enabled:	Whether the ACPI PM timer enabled before suspend
  *
  * @pkgc_ltr_blocker_counters: Array of PKGC LTR blocker counters
  * @pkgc_ltr_blocker_offset: Offset to PKGC LTR blockers in telemetry region
@@ -506,6 +507,7 @@ struct pmc_dev {
 	u64 s0ix_counter;
 	void (*suspend)(struct pmc_dev *pmcdev);
 	int (*resume)(struct pmc_dev *pmcdev);
+	bool pm_timer_enabled;
 
 	u64 *pkgc_res_cnt;
 	u8 num_of_pkgc;
diff --git a/drivers/platform/x86/intel/pmc/ptl.c b/drivers/platform/x86/intel/pmc/ptl.c
index a7d5d4f77934..8c32f9be9302 100644
--- a/drivers/platform/x86/intel/pmc/ptl.c
+++ b/drivers/platform/x86/intel/pmc/ptl.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2025, Intel Corporation.
  */
 
+#include <linux/io.h>
 #include <linux/pci.h>
 
 #include "core.h"
@@ -548,6 +549,9 @@ static const u8 ptl_pmc_list[] = {PMC_IDX_MAIN};
 #define PTL_NPU_PCI_DEV                0xb03e
 #define PTL_IPU_PCI_DEV                0xb05d
 
+#define ACPI_TMR_CTL_OFFSET            0x18fc
+#define ACPI_TIM_DIS                   BIT(1)
+
 /*
  * Set power state of select devices that do not have drivers to D3
  * so that they do not block Package C entry.
@@ -558,9 +562,38 @@ static void ptl_d3_fixup(void)
 	pmc_core_set_device_d3(PTL_NPU_PCI_DEV);
 }
 
+static void ptl_set_acpi_pm_timer_on_suspend(struct pmc_dev *pmcdev, bool suspend)
+{
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	bool enabled;
+	u8 val;
+
+	if (!pmc || !pmc->regbase)
+		return;
+
+	if (!suspend && !pmcdev->pm_timer_enabled)
+		return;
+
+	val = readb(pmc->regbase + ACPI_TMR_CTL_OFFSET);
+	enabled = !(val & ACPI_TIM_DIS);
+	if (suspend && enabled)
+		writeb(val | ACPI_TIM_DIS, pmc->regbase + ACPI_TMR_CTL_OFFSET);
+	else if (!suspend)
+		writeb(val & ~ACPI_TIM_DIS, pmc->regbase + ACPI_TMR_CTL_OFFSET);
+
+	pmcdev->pm_timer_enabled = suspend && enabled;
+}
+
+static void ptl_suspend(struct pmc_dev *pmcdev)
+{
+	ptl_set_acpi_pm_timer_on_suspend(pmcdev, true);
+	cnl_suspend(pmcdev);
+}
+
 static int ptl_resume(struct pmc_dev *pmcdev)
 {
 	ptl_d3_fixup();
+	ptl_set_acpi_pm_timer_on_suspend(pmcdev, false);
 	return cnl_resume(pmcdev);
 }
 
@@ -576,7 +609,7 @@ struct pmc_dev_info ptl_pmc_dev = {
 	.regmap_list = ptl_pmc_info_list,
 	.map = &ptl_pcdp_reg_map,
 	.sub_req_show = &pmc_core_substate_blk_req_fops,
-	.suspend = cnl_suspend,
+	.suspend = ptl_suspend,
 	.resume = ptl_resume,
 	.init = ptl_core_init,
 	.sub_req = pmc_core_pmt_get_blk_sub_req,
-- 
2.56.0.385.gd3acb90ef8-goog

