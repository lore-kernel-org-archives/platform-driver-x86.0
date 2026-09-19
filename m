Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4386F30F927;
	Sat, 19 Sep 2026 05:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795821; cv=none; b=FoU7rZZehOWPP/OkmBDy4KH7R78IiHuexFGyv5eydU97DUGqfNvx2wlpL6o0RmXZsRNlyP+C1HfsXbbcjMcEhJ9adopkM+MjrfqW/UU9HdXx3iBOAViImSgo0vdmK8VyaKDG4W0tf3Jn/UMHvi8akT3Fj1N8hakyo6JTvAhUWY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795821; c=relaxed/simple;
	bh=quJW+LmrZG3fAKqMKYuSVlbqfF8dp7eaEnPwshIbx+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RDNjcXYlplBzBDQVHS5aAm0Y5jQefQTCbPwIrZe5VzpKPcqTOyC6eNETq85HP+iQByY2uvzXvF4hlWfx6GBfKcNrE0IXHCjWPXI9FrAU3P2KHihoT40lFFab1j8m0K647/hyJbh/X37bEMbY6h+H/ubF3i1veFMM8aZvS0Eo5yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=EIjZrSOT; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="EIjZrSOT"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E73F38101F;
	Sat, 19 Sep 2026 07:30:16 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mn51gvusGSud; Sat, 19 Sep 2026 07:30:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1789795816; bh=quJW+LmrZG3fAKqMKYuSVlbqfF8dp7eaEnPwshIbx+Q=;
	h=From:To:Cc:Subject:Date;
	b=EIjZrSOT2pRXykC8TKrNzJMvLNvdFRtDADPVzTFTyildZStp5jNGzYDq3RPc9jI55
	 klKoURQj0dz1q9ASpY6qZScRe6fr7DJEHeUYS1slPjMLowwXzcoUzDc+qTz4OhYK31
	 /sk+In+oUEPlwZV0C+h97soGBwrA9WnL1HH53SQhak71TbMZPyR6p8Ty6d6Bx8eFXu
	 3WwKlDMt721gN4zLxXhvLP0BjTOJRtLbXpcR0fR5eHgBkhAk3KoR1cr5k55zFFtC/a
	 8Y071QGPIFL/SMJphH5jlgfF5/VkPvkr5VBa83rb8tAg3DiasT5WcgYwJDtE1A0+O5
	 /VQYxeF3XteAw==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Denis Benato <denis.benato@linux.dev>,
	Luke Jones <luke@ljones.dev>,
	Corentin Chary <corentin.chary@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: asus-armoury: add power limits quirk for FA608UP
Date: Sat, 19 Sep 2026 07:30:00 +0200
Message-ID: <20260919053000.24293-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add power limits quirk entry for ASUS FA608UP laptop.
The limits are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 31 changes(+/-)
 1 file changed, 31 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -749,6 +749,37 @@
 			},
 		},
 	},
+		{
+			.matches = {
+				DMI_MATCH(DMI_BOARD_NAME, "FA608UP"),
+			},
+			.driver_data = &(struct power_data) {
+				.ac_data = &(struct power_limits) {
+					.nv_dynamic_boost_max = 15,
+					.nv_dynamic_boost_min = 10,
+					.nv_temp_target_max = 87,
+					.nv_temp_target_min = 75,
+					.ppt_pl1_spl_max = 90,
+					.ppt_pl1_spl_min = 15,
+					.ppt_pl2_sppt_max = 90,
+					.ppt_pl2_sppt_min = 35,
+					.ppt_pl3_fppt_max = 90,
+					.ppt_pl3_fppt_min = 35,
+				},
+				.dc_data = &(struct power_limits) {
+					.nv_temp_target_max = 87,
+					.nv_temp_target_min = 75,
+					.ppt_pl1_spl_def = 45,
+					.ppt_pl1_spl_max = 65,
+					.ppt_pl1_spl_min = 15,
+					.ppt_pl2_sppt_def = 54,
+					.ppt_pl2_sppt_max = 65,
+					.ppt_pl2_sppt_min = 35,
+					.ppt_pl3_fppt_max = 65,
+					.ppt_pl3_fppt_min = 35,
+				},
+			},
+		},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "FA608WI"),
-- 
2.55.0
