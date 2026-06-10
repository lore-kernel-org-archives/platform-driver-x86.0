Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85F33FBB6D;
	Wed, 10 Jun 2026 15:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781104908; cv=none; b=muUava7dBgZDE1AUizCtp00wDMQ4VjwG+n5mzKgeem2YOuMexfJg2Rf0to4o+6pwHD7EPUxCCmLYZN0ng7Q8m59inqKZkG6CkQ6cTVzmhogSlHvK6BCvuy/2mmlqVhoJvAYO1l/fqHkn5HPYJk6eJWGK534CCNyoIpd+q0GuK9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781104908; c=relaxed/simple;
	bh=p+SRlnHCMgs2w0i/RTkl2UKcqWsqoGRvfeb5zys24ws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xn/TBkKelU/vo6pVt5b+7Jmce+0pVdOuwDNtKyst/fpoKXp+kU8HophYrwhJ/XCqkkK9q3JHPPNpJMpV/QpmDRdRrj3o5zKUmvKnAgp5LVUQKyYngEvw5eKGFUCAW7pUVqjZb+SrbETLrP206bqVYs0dK8g5IavHydctogWa+Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=gympYDct; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="gympYDct"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B26B526597;
	Wed, 10 Jun 2026 17:21:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XADAePJaRzH6; Wed, 10 Jun 2026 17:21:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781104904; bh=p+SRlnHCMgs2w0i/RTkl2UKcqWsqoGRvfeb5zys24ws=;
	h=From:To:Cc:Subject:Date;
	b=gympYDctezUxwBbH47Wl2sYoH9SDP0DJlDKJmmFSWGoQcETqhziKQs2IjhutTcZeW
	 ELyJgrVY1nYLQxWwwVsHw+P5YjFMuhv13ZN8IRnhFMvhVZuWENTuGll1bN2zlNr/8V
	 TWFTPNUQtrDU4KNKNxG4otA2BEXyALe0p3zCZiomX89n5n2Jb1XoGdj71v9NtUaOQY
	 VoV+Y/jLTJebHiMBid0P1SBQZ6kPMzotXzuFk86jfJNLrP5sGMQJhZSS60SI6zmxNQ
	 IvFcEvYDx/MiHmPUfxj88xLMqzLdmTE95zE6bJlmREEImId6BhJu8w+8ogEYb6riAW
	 HTgM8v6ssXJsw==
From: Marco Scardovi <scardracs@disroot.org>
To: "Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: asus-armoury: add support for G614PR
Date: Wed, 10 Jun 2026 17:21:30 +0200
Message-ID: <20260610152130.25892-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add TDP power limits and fan curve requirements for the ASUS ROG Strix
G16 G614PR laptop model.

The ASUS ROG Strix G16 G614PR requires specific AC/DC power limits
(PPT PL1/PL2/PL3, dynamic boost, and NV TGP targets) to function
correctly under various power profiles. Without these limits, the Asus
Armoury driver cannot configure the correct power envelopes or enable custom
fan curves, leading to suboptimal performance or noise management.

This patch adds the corresponding DMI board name matching entry ("G614PR")
under the power_limits table in asus-armoury.h, populating the AC and DC
limits based on the platform's hardware specification.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 34 +++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 692978b61959..5be34b6a92db 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1898,6 +1898,40 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G614PR"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 30,
+				.ppt_pl1_spl_max = 90,
+				.ppt_pl2_sppt_min = 65,
+				.ppt_pl2_sppt_def = 110,
+				.ppt_pl2_sppt_max = 125,
+				.ppt_pl3_fppt_min = 65,
+				.ppt_pl3_fppt_def = 110,
+				.ppt_pl3_fppt_max = 125,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_tgp_min = 65,
+				.nv_tgp_max = 115,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 65,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 75,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "G615LR"),
-- 
2.54.0

