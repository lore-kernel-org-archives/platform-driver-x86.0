Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453664;
	b=NK6VCcvusDBPD2ZxHEaGemFd7pzXLeyXIha838d8R50TYkYL1Z/px+zB8obv2mA/Bq1g
	 joPQZ+44U+ZnOQzdsrfQvX0Gsjw900KQADEbGNurigScS70Id0gG1jAbnlK9Q34w7FhkK
	 9RHGLjpWf3/5L3h6IgspFexRRx+FhUtMD2kFIs1yzfOwmaiJ09q3ovUtBLxTsQWsurqww
	 vwjnkZItD0wcTXKw6f6O1DURVwEPcA/1cyCXQy0bAs+yzryCPmllsGwTtRbYLeYGiOpi8
	 I0N0tO9jRalV/bsyPNjOqnMMrTdJQ/nYgMIiLbWSAGmcZa5khIDTWaEdRfTSV2OsP/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453664;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vjqzfI3kBk9VsnXsXYhQULegPd/JbZIMjkpOTq8gnXk=;
	b=kqTT+ivo4/LaDJiJq2Vh6onv3ZrDeet8AZGvkD6VhTvDGDbuJ8AHDn/zzreRC9hWYPDX
	 Du1Zk4vmypSGsuxbtjQ5EQH0MybrpTkY2JDdhpxmsFMa0rpGfqXjGqK+dTMOLYUmNzIdc
	 EjOCVUU3gS5RjT+LPJyTESl4aad1S4r3uP58yuaFkLTaBNkCIY2uG1PjzCjf4ndM3WBQy
	 fh/Ll5VCtQuJHPSD7xt37KRDfgV9hIT88VfeKTT1BGTUMBvXf6OpRBFnSOHVnUA8EZ4Qc
	 GK8CiILCVB2yvNQFN2cnB5J5gmHOiy7Km33KmdoVy8qwY2l2cW8/2TfQWfDXF6hPBwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZS83T9z3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E5E606A31C;
	Thu, 12 Nov 2026 03:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZS83T9z3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39D01F00A05;
	Thu, 12 Nov 2026 03:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794453664;
	bh=vjqzfI3kBk9VsnXsXYhQULegPd/JbZIMjkpOTq8gnXk=;
	h=From:To:Cc:Subject:Date;
	b=ZS83T9z3FJ62AcoRdct4nMhDDLrwv97PkyjVDfMb6DnrHYyQ7yq38IB/0Gzde09nD
	 Z/1sMrcNlXxIWi6NNUtGsdLvv448GBTf0X8XWe010a7fAjvHLYiT/7iu9GGpScsZ0g
	 EzKqXjUDjoGPhd7YWi0em4VLI9OqdSAlD1ga1wN9ZceKpSgC8H6GdYhA6Uws/ustZn
	 jnRO7i0Ct8qPQe7ORE4t9CM9VxF8dfVl3LXrvWasty6S9EDmzQbRS/O8AXi7uTwXuJ
	 pJcZD782aHmMcogDVSeYVD3JWSQobt15QhsIIESLWL2jRKn7zvtH4x55Ea7EOlWJn8
	 x6JdwmtXylSfg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tzungbi@kernel.org,
	tfiga@chromium.org
Subject: [PATCH v3] platform/x86/intel/pmc: Disable ACPI PM timer during suspend on Panther Lake
Date: Thu, 12 Nov 2026 03:20:40 +0000
Message-ID: <20261112032040.930597-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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
v3:
- Rebase to next-20261111.

v2: https://lore.kernel.org/all/20261016075416.3139759-1-tzungbi@kernel.org
 - Include <linux/bits.h> for BIT().
 - Rename ptl_set_acpi_pm_timer_on_suspend() -> ptl_set_acpi_pm_timer().
 - Update register values on separate lines.

v1: https://lore.kernel.org/all/20261015035712.3604634-1-tzungbi@kernel.org
---
 drivers/platform/x86/intel/pmc/core.h |  2 ++
 drivers/platform/x86/intel/pmc/ptl.c  | 40 ++++++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index e55164e5807f..8aae69775ab3 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -487,6 +487,7 @@ struct pmc {
  * @s0ix_counter:	S0ix residency (step adjusted)
  * @suspend:		Function to perform platform specific suspend
  * @resume:		Function to perform platform specific resume
+ * @pm_timer_enabled:	Whether the ACPI PM timer was enabled before suspend
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
index a7d5d4f77934..3cb063944007 100644
--- a/drivers/platform/x86/intel/pmc/ptl.c
+++ b/drivers/platform/x86/intel/pmc/ptl.c
@@ -6,6 +6,8 @@
  * Copyright (c) 2025, Intel Corporation.
  */
 
+#include <linux/bits.h>
+#include <linux/io.h>
 #include <linux/pci.h>
 
 #include "core.h"
@@ -548,6 +550,9 @@ static const u8 ptl_pmc_list[] = {PMC_IDX_MAIN};
 #define PTL_NPU_PCI_DEV                0xb03e
 #define PTL_IPU_PCI_DEV                0xb05d
 
+#define ACPI_TMR_CTL_OFFSET            0x18fc
+#define ACPI_TIM_DIS                   BIT(1)
+
 /*
  * Set power state of select devices that do not have drivers to D3
  * so that they do not block Package C entry.
@@ -558,9 +563,42 @@ static void ptl_d3_fixup(void)
 	pmc_core_set_device_d3(PTL_NPU_PCI_DEV);
 }
 
+static void ptl_set_acpi_pm_timer(struct pmc_dev *pmcdev, bool suspend)
+{
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	u8 val, old_val;
+
+	if (!pmc || !pmc->regbase)
+		return;
+
+	if (!suspend && !pmcdev->pm_timer_enabled)
+		return;
+
+	val = readb(pmc->regbase + ACPI_TMR_CTL_OFFSET);
+	old_val = val;
+
+	if (suspend) {
+		pmcdev->pm_timer_enabled = !(old_val & ACPI_TIM_DIS);
+		if (pmcdev->pm_timer_enabled)
+			val |= ACPI_TIM_DIS;
+	} else {
+		val &= ~ACPI_TIM_DIS;
+	}
+
+	if (val != old_val)
+		writeb(val, pmc->regbase + ACPI_TMR_CTL_OFFSET);
+}
+
+static void ptl_suspend(struct pmc_dev *pmcdev)
+{
+	ptl_set_acpi_pm_timer(pmcdev, true);
+	cnl_suspend(pmcdev);
+}
+
 static int ptl_resume(struct pmc_dev *pmcdev)
 {
 	ptl_d3_fixup();
+	ptl_set_acpi_pm_timer(pmcdev, false);
 	return cnl_resume(pmcdev);
 }
 
@@ -576,7 +614,7 @@ struct pmc_dev_info ptl_pmc_dev = {
 	.regmap_list = ptl_pmc_info_list,
 	.map = &ptl_pcdp_reg_map,
 	.sub_req_show = &pmc_core_substate_blk_req_fops,
-	.suspend = cnl_suspend,
+	.suspend = ptl_suspend,
 	.resume = ptl_resume,
 	.init = ptl_core_init,
 	.sub_req = pmc_core_pmt_get_blk_sub_req,
-- 
2.56.0.567.gdb80ae8cd5-goog

