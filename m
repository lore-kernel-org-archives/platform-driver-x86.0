Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D43205E02
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Jul 2025 18:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753383123; cv=none; b=gZ9//v8G8QeNIQ8W620iHTcH/+ohye5SecpLp6GC4s/NAXXA8Sv8wG0T6VtfCb1DEhYEugsAtesohgaXqYuvVWfWDTZ13SPf31i+/NvTSam3KcL5X2DQeG+JjSQtgc2NGIeOMvJzRRYKilekWiGb8acf23bw/Gqd1brIyBEkO8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753383123; c=relaxed/simple;
	bh=wc8aXf9PhNdwY64MVcsVu0y41ggeSGE3pH9HwNreO7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oafRjaYnHcM+19VBX8vqC4afbF2PfkJvX57jEfp7/cD2i+aAWl3vMy7K+0DZCEkfZSXfRksMHGma+IEanZH7yPv0orOGBHwQla+oGoxaPxnBj3bzTC0y0H7+iD2EXYANGDu4ukitH/QGBfIQMkVLhKwErkUBY+lJqXukWo2wkqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2kDnV1o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2kDnV1o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC952C4CEED;
	Thu, 24 Jul 2025 18:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753383122;
	bh=wc8aXf9PhNdwY64MVcsVu0y41ggeSGE3pH9HwNreO7c=;
	h=From:To:Cc:Subject:Date:From;
	b=a2kDnV1o+sfwCQfcjBUL41tXjqdXvTIFRZ+C055Wai3hUBefvOf3x+lZHYvwu6lHf
	 dURsFVsRXnRf+JrVbUQXhAlthmqe5E4HLotH/oPYitnWtfCtK9EcNnD7ltGuCcOMUC
	 X1feXOWluoU+FxeVxuzoqTszIX3bF4kEgtuMIDfz0dNp8y6+hgIDXg1r6og+2RN30t
	 KN5fQ4l+PCkE5tZjNCLz/2YHaAu7GMqYCgPdJWkH2Pdy8Uy4Kisz1L3TXhr7+xQ4Ax
	 1W0fLh6EZuLSaybBU2KVkt1x6s4sBnUkp+jmmW7r9gdudy3jGJE5RO/9tjeOUJz0Wd
	 tUtKI4O7gZDvg==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Shyam-sundar.S-k@amd.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Chris Bainbridge <chris.bainbridge@gmail.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86/amd: pmc: Drop SMU F/W match for Cezanne
Date: Thu, 24 Jul 2025 13:51:08 -0500
Message-ID: <20250724185156.1827592-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Chris reported that even on a BIOS that has a new enough SMU F/W
version there is still a spurious IRQ1.  Although the solution was
added to SMU F/W 64.66.0 it turns out there needs to be a matching
SBIOS change to activate it.  Thus Linux shouldn't be avoiding the
IRQ1 workaround on newer SMU F/W because there is no indication the
BIOS change is in place.

Drop the match for 64.66.0+ and instead match all RN/CZN/BRC (they
all share same SMU F/W). Adjust the quirk infrastructure to allow
quirking the workaround on or off and also adjust existing quirks
to match properly.

Unfortunately this may cause some systems that did have the SBIOS
change in place to regress in keyboard wakeup but we don't have a
way to know.  If a user reports a keyboard wakeup regression they can
run with amd_pmc.disable_workarounds=1 to deactivate the workaround
and share DMI data so that their system can be quirked not to use
the workaround in the upstream kernel.

Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4449
Tested-by: Chris Bainbridge <chris.bainbridge@gmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 54 ++++++++++++++---------
 drivers/platform/x86/amd/pmc/pmc.c        | 13 ------
 2 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index ded4c84f5ed14..7ffc659b27944 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -28,10 +28,15 @@ static struct quirk_entry quirk_spurious_8042 = {
 	.spurious_8042 = true,
 };
 
+static struct quirk_entry quirk_s2idle_spurious_8042 = {
+	.s2idle_bug_mmio = FCH_PM_BASE + FCH_PM_SCRATCH,
+	.spurious_8042 = true,
+};
+
 static const struct dmi_system_id fwbug_list[] = {
 	{
 		.ident = "L14 Gen2 AMD",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "20X5"),
@@ -39,7 +44,7 @@ static const struct dmi_system_id fwbug_list[] = {
 	},
 	{
 		.ident = "T14s Gen2 AMD",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "20XF"),
@@ -47,7 +52,7 @@ static const struct dmi_system_id fwbug_list[] = {
 	},
 	{
 		.ident = "X13 Gen2 AMD",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "20XH"),
@@ -55,7 +60,7 @@ static const struct dmi_system_id fwbug_list[] = {
 	},
 	{
 		.ident = "T14 Gen2 AMD",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "20XK"),
@@ -63,7 +68,7 @@ static const struct dmi_system_id fwbug_list[] = {
 	},
 	{
 		.ident = "T14 Gen1 AMD",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "20UD"),
@@ -71,7 +76,7 @@ static const struct dmi_system_id fwbug_list[] = {
 	},
 	{
 		.ident = "T14 Gen1 AMD",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "20UE"),
@@ -79,7 +84,7 @@ static const struct dmi_system_id fwbug_list[] = {
 	},
 	{
 		.ident = "T14s Gen1 AMD",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "20UH"),
@@ -87,7 +92,7 @@ static const struct dmi_system_id fwbug_list[] = {
 	},
 	{
 		.ident = "T14s Gen1 AMD",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "20UJ"),
@@ -95,7 +100,7 @@ static const struct dmi_system_id fwbug_list[] = {
 	},
 	{
 		.ident = "P14s Gen1 AMD",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "20Y1"),
@@ -103,7 +108,7 @@ static const struct dmi_system_id fwbug_list[] = {
 	},
 	{
 		.ident = "P14s Gen2 AMD",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "21A0"),
@@ -111,7 +116,7 @@ static const struct dmi_system_id fwbug_list[] = {
 	},
 	{
 		.ident = "P14s Gen2 AMD",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "21A1"),
@@ -152,7 +157,7 @@ static const struct dmi_system_id fwbug_list[] = {
 	},
 	{
 		.ident = "IdeaPad 1 14AMN7",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "82VF"),
@@ -160,7 +165,7 @@ static const struct dmi_system_id fwbug_list[] = {
 	},
 	{
 		.ident = "IdeaPad 1 15AMN7",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "82VG"),
@@ -168,7 +173,7 @@ static const struct dmi_system_id fwbug_list[] = {
 	},
 	{
 		.ident = "IdeaPad 1 15AMN7",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "82X5"),
@@ -176,7 +181,7 @@ static const struct dmi_system_id fwbug_list[] = {
 	},
 	{
 		.ident = "IdeaPad Slim 3 14AMN8",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "82XN"),
@@ -184,7 +189,7 @@ static const struct dmi_system_id fwbug_list[] = {
 	},
 	{
 		.ident = "IdeaPad Slim 3 15AMN8",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "82XQ"),
@@ -193,7 +198,7 @@ static const struct dmi_system_id fwbug_list[] = {
 	/* https://gitlab.freedesktop.org/drm/amd/-/issues/4434 */
 	{
 		.ident = "Lenovo Yoga 6 13ALC6",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "82ND"),
@@ -202,7 +207,7 @@ static const struct dmi_system_id fwbug_list[] = {
 	/* https://gitlab.freedesktop.org/drm/amd/-/issues/2684 */
 	{
 		.ident = "HP Laptop 15s-eq2xxx",
-		.driver_data = &quirk_s2idle_bug,
+		.driver_data = &quirk_s2idle_spurious_8042,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "HP Laptop 15s-eq2xxx"),
@@ -285,6 +290,16 @@ void amd_pmc_quirks_init(struct amd_pmc_dev *dev)
 {
 	const struct dmi_system_id *dmi_id;
 
+	/*
+	 * IRQ1 may cause an interrupt during resume even without a keyboard
+	 * press.
+	 *
+	 * Affects Renoir, Cezanne and Barcelo SoCs
+	 *
+	 * A solution is available in PMFW 64.66.0, but it must be activated by
+	 * SBIOS. If SBIOS is known to have the fix a quirk can be added for
+	 * a given system to avoid workaround.
+	 */
 	if (dev->cpu_id == AMD_CPU_ID_CZN)
 		dev->disable_8042_wakeup = true;
 
@@ -295,6 +310,5 @@ void amd_pmc_quirks_init(struct amd_pmc_dev *dev)
 	if (dev->quirks->s2idle_bug_mmio)
 		pr_info("Using s2idle quirk to avoid %s platform firmware bug\n",
 			dmi_id->ident);
-	if (dev->quirks->spurious_8042)
-		dev->disable_8042_wakeup = true;
+	dev->disable_8042_wakeup = dev->quirks->spurious_8042;
 }
diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 0b9b23eb7c2c3..bd318fd02ccf4 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -530,19 +530,6 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 static int amd_pmc_wa_irq1(struct amd_pmc_dev *pdev)
 {
 	struct device *d;
-	int rc;
-
-	/* cezanne platform firmware has a fix in 64.66.0 */
-	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
-		if (!pdev->major) {
-			rc = amd_pmc_get_smu_version(pdev);
-			if (rc)
-				return rc;
-		}
-
-		if (pdev->major > 64 || (pdev->major == 64 && pdev->minor > 65))
-			return 0;
-	}
 
 	d = bus_find_device_by_name(&serio_bus, NULL, "serio0");
 	if (!d)
-- 
2.43.0

