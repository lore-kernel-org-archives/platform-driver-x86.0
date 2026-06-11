Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0AEFBE1
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 15:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781190279; cv=none; b=s6Sqj+NX71kX6za+8zO5qxlO8Sk7HWikDKP3vbuZ8mUF7eihLrA3WVTdGnvYksnRiGCHpvGDHM8Jrs0jJaPJ9mt68G165/cpfD2ZQjLIazHQMth4NrHqOgSlqVjfFKMDkgJFGM7Mh/8WsHZ9t/43o6eJcvlKlyFrNJhJAfAy7Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781190279; c=relaxed/simple;
	bh=Jq8ysKyX9XjKDYarXwCW/jpo7H3q6jR29jqXAKG+VP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWzP+1N1P3lP1hMl1rtUPkJRy95cEPmn4NVYDYH+MyYuLQZBBThArAlnpmMzhjFgTxUiyGcFWT0lrxD4W6LuoN5nGLT8BoVre9X5hVbtMjeYNKKLcspI12NAzj1HrJb1GkZPjweO43fpR1kqaqoZUJslGVsJ95i9pKGdSiG70tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=a8PsTFVs; arc=none smtp.client-ip=45.157.188.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="a8PsTFVs"
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gbmC116NTzkMv
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 17:04:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1781190268;
	bh=/TzDI8kdlhnZuKW1ZWymH3Q+HdpRLbQx52o+ic/JCXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a8PsTFVsoa09BymiNjRKQhzZe1Hryy0U+Ter8868J5luffNqZTqlSrm1Z/dxPggeJ
	 An4MHU1oWrscqnqMJWtNYfDILD6Sd3xbsYmRj/V8cDHoXZmTqRS56QhR53wBCXVw6Y
	 lO2vlRAJe7YIuyn2wsf++x1RlfqJacWQuH7+VVSCHQobeXXe+5tLBSwkGWAoB9xTAb
	 TgV4kxd6pbZ/WUkYN8TiyprhH/20aQv3kQ9qPJ3kgzhSBNeAjlycJPRfHmRb53Up1w
	 tjqIgFPxo7IWa31Z0I2kGK0HNV8P55EaSpIqJH/Cy4zsROlgbHxGBuoc0C8rTWLrew
	 xWJse3hhugQ0Q==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gbmC04Xndzvk5
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 17:04:28 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Thu, 11 Jun 2026 17:04:28 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>
Cc: Daniel Gibson <daniel@gibson.sh>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	stable@vger.kernel.org
Subject: [PATCH v6 4/4] platform/x86/amd/pmc: Don't log during intermediate wakeups
Date: Thu, 11 Jun 2026 17:04:26 +0200
Message-ID: <20260611150426.3683372-5-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260611150426.3683372-1-daniel@gibson.sh>
References: <20260611150426.3683372-1-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

The ECs in the IdeaPads that need the delay_suspend quirk send lots
of messages when charging, which not only causes intermediate wakeups
when suspended, but also prevents the device from reaching the deepest
suspend state.

Because of this amd_pmc_intermediate_wakeup_need_delay() returns false
during intermediate wakeups and amd_pmc_want_suspend_delay() is called.
So far it always logged its "Delaying suspend by 2.5s ..." messages
then, which spams dmesg. This commit makes sure that those messages are
only logged once per suspend.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221383
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Daniel Gibson <daniel@gibson.sh>
Cc: stable@vger.kernel.org
---
 drivers/platform/x86/amd/pmc/pmc.c | 39 ++++++++++++++++++++++++------
 drivers/platform/x86/amd/pmc/pmc.h |  1 +
 2 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index ce97c27bc362..b2eb9909f6a4 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -691,6 +691,20 @@ static bool amd_pmc_intermediate_wakeup_need_delay(struct amd_pmc_dev *pdev)
 
 static bool amd_pmc_want_suspend_delay(struct amd_pmc_dev *pdev)
 {
+	/*
+	 * intermediate_wakeup implies that the machine didn't get to deepest sleep
+	 * state before - otherwise this function isn't called in amd_pmc_s2idle_check()
+	 * because amd_pmc_intermediate_wakeup_need_delay() returns true first.
+	 * On some IdeaPads that happens when charging, because the EC seems
+	 * to send lots of messages then that wake the machine.
+	 *
+	 * But even in that case, the sleep here is necessary (on those IdeaPads),
+	 * otherwise they wake up completely (resume) after a few seconds.
+	 * So this variable is only used to avoid spamming dmesg on each
+	 * intermediate wakeup.
+	 */
+	bool intermediate_wakeup = !pdev->is_first_check_after_suspend;
+
 	/*
 	 * Some Lenovo Laptops (like different IdeaPad 3 Slims) need some
 	 * me-time before sleeping or they get uncooperative after waking
@@ -709,17 +723,20 @@ static bool amd_pmc_want_suspend_delay(struct amd_pmc_dev *pdev)
 		 * disabled with disable_workarounds or delay_suspend=0
 		 */
 		if (delay_suspend == 1 || (delay_suspend == -1 && !disable_workarounds)) {
-			dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
+			if (!intermediate_wakeup)
+				dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
 			return true;
 		}
-		dev_info(pdev->dev, "Not delaying suspend because of module parameter, even though your device is assumed to need it!\n");
+		if (!intermediate_wakeup)
+			dev_info(pdev->dev, "Not delaying suspend because of module parameter, even though your device is assumed to need it!\n");
 	} else if (delay_suspend == 1) {
-		dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1. If this solves problems on your machine, please report this whole line to: platform-driver-x86@vger.kernel.org so it can be automatically detected as affected in the future. System Vendor: \"%s\" Product Name: \"%s\" Product Family: \"%s\" Board Vendor: \"%s\" Board Name: \"%s\"\n",
-			 dmi_get_system_info(DMI_SYS_VENDOR),
-			 dmi_get_system_info(DMI_PRODUCT_NAME),
-			 dmi_get_system_info(DMI_PRODUCT_FAMILY),
-			 dmi_get_system_info(DMI_BOARD_VENDOR),
-			 dmi_get_system_info(DMI_BOARD_NAME));
+		if (!intermediate_wakeup)
+			dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1. If this solves problems on your machine, please report this whole line to: platform-driver-x86@vger.kernel.org so it can be automatically detected as affected in the future. System Vendor: \"%s\" Product Name: \"%s\" Product Family: \"%s\" Board Vendor: \"%s\" Board Name: \"%s\"\n",
+				 dmi_get_system_info(DMI_SYS_VENDOR),
+				 dmi_get_system_info(DMI_PRODUCT_NAME),
+				 dmi_get_system_info(DMI_PRODUCT_FAMILY),
+				 dmi_get_system_info(DMI_BOARD_VENDOR),
+				 dmi_get_system_info(DMI_BOARD_NAME));
 		return true;
 	}
 	return false;
@@ -731,6 +748,9 @@ static void amd_pmc_s2idle_prepare(void)
 	int rc;
 	u32 arg = 1;
 
+	/* Reset this variable because this is a fresh suspend */
+	pdev->is_first_check_after_suspend = true;
+
 	/* Reset and Start SMU logging - to monitor the s0i3 stats */
 	amd_pmc_setup_smu_logging(pdev);
 
@@ -769,6 +789,9 @@ static void amd_pmc_s2idle_check(void)
 	rc = amd_stb_write(pdev, AMD_PMC_STB_S2IDLE_CHECK);
 	if (rc)
 		dev_err(pdev->dev, "error writing to STB: %d\n", rc);
+
+	/* remember that first check after suspend is done (until next prepare) */
+	pdev->is_first_check_after_suspend = false;
 }
 
 static int amd_pmc_dump_data(struct amd_pmc_dev *pdev)
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 1ef182bb240d..6973a639d7e3 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -136,6 +136,7 @@ struct amd_pmc_dev {
 	struct dentry *dbgfs_dir;
 	struct quirk_entry *quirks;
 	bool disable_8042_wakeup;
+	bool is_first_check_after_suspend;
 	struct amd_mp2_dev *mp2;
 	struct stb_arg stb_arg;
 	const struct amd_pmc_cpu_info *cpu_info;
-- 
2.48.1

