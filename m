Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch [45.157.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08195196C7C
	for <platform-driver-x86@vger.kernel.org>; Fri,  1 May 2026 04:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777608313; cv=none; b=HLrXg/8rNNNT1PdVhkWKvOpHv262Aalrv0O6UA5PJgSCJbxEk+Pd4dgPAxfgtHVJTHQpmHh+v2ocX2Z9imsVqWO2CCU0ItLjn5ddICi4D9MugdYakm2HSG3n0Rfysy85W+Hn7qHDP5JT51SGF8QEwmiHzey3DPxl6ciPmKVpxYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777608313; c=relaxed/simple;
	bh=n/NmCXpi4W3Gwnft4DFeECuo/XzZUMn3qdmCGP3Z+o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+jpDgpNeH3wzyvzVUW60DPe2dACgIT7IseFmSsnYKPGDhUSbGU2xeh5aY+sgNhSNSMdADplzebJN4ELGK8NFZ9o2tYS0dLjZTLL1c9RBESiwB3WHdYTzauMkgxIsTs34HHplCErKgaxaFyc05TjT5NyyZifCpluYemuH/4Kvy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=dioFEZiR; arc=none smtp.client-ip=45.157.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="dioFEZiR"
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4g6GgY5WHPzG5W
	for <platform-driver-x86@vger.kernel.org>; Fri,  1 May 2026 05:27:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1777606041;
	bh=fYRyRFkQMEkAqHabar/FCyf0QrY6d1LISKOv19r61D0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dioFEZiRiN0/vY4o8XIkhfkEzJpbYHZFs5tkvwoPeXaXgxBmBvdzr+SnWZM0hNT/g
	 2qg1skBMCasSWEkRnBxZuQVKOuVz8hQgnb6kFeXZ6vHRUp/60Vsq2u9sFMT/8wQjn5
	 g21uTFwR+oPgKI3n2b+llllvwSriY8GHF8NhaOWDRE8uRJ6ARKmHA41HrcUY5SduNU
	 nx180fHVF22wZJszvwqSe3fk4eMOhRB/ItYaMat5uY+RTbvGOvQqxfB3Vw1kan6A3t
	 jymrMjxaoQ/K0nb8gSzktscMvdxi3l5nwSlrjZPDLyGcplhF8JU22mTP8eyHlzDtLf
	 rk5rEci6LnVqQ==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4g6GgY2fbKzc8d
	for <platform-driver-x86@vger.kernel.org>; Fri,  1 May 2026 05:27:21 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Fri, 01 May 2026 05:27:20 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mario Limonciello <superm1@kernel.org>,
	Daniel Gibson <daniel@gibson.sh>,
	Sindre Henriksen <sindrehenriksen93@gmail.com>
Subject: [PATCH 1/2] platform/x86/amd/pmc: Delay suspend for some Lenovo Laptops
Date: Fri,  1 May 2026 05:26:54 +0200
Message-ID: <20260501032655.283789-2-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260501032655.283789-1-daniel@gibson.sh>
References: <20260501032655.283789-1-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Some IdeaPad Slim 3 devices and similar with AMD CPUs have a
nonfunctional keyboard and lid switch after s2idle.
It helps to delay suspend by 2.5 seconds so the EC has some time
to do whatever it needs to get done before suspend.

This issue has been reported for many different devices, this patch
has been tested with the Zen3-based IdeaPad Slim 3 16ABR8 (82XR)
and the Zen3+-based IdeaPad Slim 3 14ARP10 (83K6), see
https://bugzilla.kernel.org/show_bug.cgi?id=221383

Reported-by: Sindre Henriksen <sindrehenriksen93@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221383
Tested-by: Sindre Henriksen <sindrehenriksen93@gmail.com>
Tested-by: Daniel Gibson <daniel@gibson.sh>
Suggested-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Daniel Gibson <daniel@gibson.sh>
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 36 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c        |  5 +++-
 drivers/platform/x86/amd/pmc/pmc.h        |  1 +
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index 24506e342943..cea30f68f8dc 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -18,6 +18,7 @@
 struct quirk_entry {
 	u32 s2idle_bug_mmio;
 	bool spurious_8042;
+	bool need_suspend_delay;
 };
 
 static struct quirk_entry quirk_s2idle_bug = {
@@ -33,6 +34,10 @@ static struct quirk_entry quirk_s2idle_spurious_8042 = {
 	.spurious_8042 = true,
 };
 
+static struct quirk_entry quirk_s2idle_need_suspend_delay = {
+	.need_suspend_delay = true
+};
+
 static const struct dmi_system_id fwbug_list[] = {
 	{
 		.ident = "L14 Gen2 AMD",
@@ -203,6 +208,32 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "82XQ"),
 		}
 	},
+	/*
+	 * Some Lenovo Laptops (like different IdeaPad 3 Slims) need some
+	 * me-time before sleeping or they get uncooperative after waking
+	 * up and don't send events for keyboard and lid switch anymore.
+	 * See https://bugzilla.kernel.org/show_bug.cgi?id=221383
+	 */
+	{
+		.ident = "Zen3-based IdeaPad Slim and similar",
+		.driver_data = &quirk_s2idle_need_suspend_delay,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			/*
+			 * Note: there are also some Zen2-based 82X* devices that
+			 * need different quirks, they're already handled above
+			 */
+			DMI_MATCH(DMI_PRODUCT_NAME, "82X")
+		}
+	},
+	{
+		.ident = "Zen3+-based IdeaPad Slim and similar",
+		.driver_data = &quirk_s2idle_need_suspend_delay,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83K")
+		}
+	},
 	/* https://bugzilla.kernel.org/show_bug.cgi?id=221273 */
 	{
 		.ident = "Thinkpad L14 Gen3",
@@ -356,6 +387,11 @@ void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev)
 		amd_pmc_skip_nvme_smi_handler(dev->quirks->s2idle_bug_mmio);
 }
 
+bool amd_pmc_quirk_need_suspend_delay(struct amd_pmc_dev *dev)
+{
+	return dev->quirks->need_suspend_delay;
+}
+
 void amd_pmc_quirks_init(struct amd_pmc_dev *dev)
 {
 	const struct dmi_system_id *dmi_id;
diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index cae3fcafd4d7..c604dc7207ed 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -634,10 +634,13 @@ static void amd_pmc_s2idle_check(void)
 	struct amd_pmc_dev *pdev = &pmc;
 	struct smu_metrics table;
 	int rc;
+	bool ec_needs_sleep = !disable_workarounds && amd_pmc_quirk_need_suspend_delay(pdev);
 
 	/* Avoid triggering OVP */
-	if (!get_metrics_table(pdev, &table) && table.s0i3_last_entry_status)
+	if (ec_needs_sleep || (!get_metrics_table(pdev, &table) && table.s0i3_last_entry_status)) {
+		dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
 		msleep(2500);
+	}
 
 	/* Dump the IdleMask before we add to the STB */
 	amd_pmc_idlemask_read(pdev, pdev->dev, NULL);
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index fe3f53eb5955..f5257e47b8c4 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -147,6 +147,7 @@ enum amd_pmc_def {
 };
 
 void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
+bool amd_pmc_quirk_need_suspend_delay(struct amd_pmc_dev *dev);
 void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
 void amd_mp2_stb_init(struct amd_pmc_dev *dev);
 void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
-- 
2.48.1

