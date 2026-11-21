Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795295587;
	b=QYZxoSVeWwAsf1HP1oT1OHiaGLxq6OrZdKiYONHcIR3duvqODljTJu6iReFaWCe1gQD7
	 IVvH0+0dLceClddQ2/b8CILtmGg+LbkZ3kFjGz9SMDsCmjbzImaFo7qedmdhH0Au/i7wk
	 l59ueLNOei2ujXM5SzkDok/urzOTwkACRARlyZJ+MjQmt69D4GNafT6L5o9JSt+DDHUKR
	 ASkbaTp+Ihlc4KRT27TtCsmyw+kiPiSP+i3iURi4xuCdb/soKe2ERvRQy9qwHRa1aFVnW
	 8kLuzjebGZ5PGMCSCCq/1qxMH3reXH3kDEICFsDUFV2w/azZ46TngnYysfYJu3+4Wlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295587;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=G7jXsXsWq+dNelOHyMZZbQHQZBbftUa83odcV4y0LpM=;
	b=xrYgbPt01snuebEZzX8ttJgvC7zTUK3UK+0IjvPFjmL2NZ9/9Q8KqJg9cRrq77bRUXML
	 iyPZ4UM77YOD2kKuwotpZCBm9NQh7qoA2TnDHP3XLqwhoYJt96/YVN5M+wbsAav/GK5Sr
	 2EdQLRq8dtHzzUKT0n+4kQLDNUOQTCNr0HVEYQzUxNeNbY6sMINlJCbSdIzvmp4LXJUcB
	 SoRKq+ZgHejgxLi7VivPwN1tN1kwGrwL1B5Lyu9D3l4iOVKrIdovdXOQu4J/JeT305pkX
	 9U63lei1WZ+xwvilCX173LMbNLRXmuzU64D8I7sSdlvgKRg83/7gx4K4A6DmcLqiCZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="T+w5/klt";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B079B606A32A;
	Sat, 21 Nov 2026 21:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T+w5/klt
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795295587;
	b=Waj/IpALfVYyyq+YvVYl7m45V3eJuLNqFpriDQlpOa8gVLwsk8zhZpRQ43VbeqWt6/qU
	 dTKWLFbtlDeHscMKC6SzAQQa//VIwY6Yrif6QakeLNkaYWdX5Q3OrXaEYAYdLRrMdk0Hf
	 1NibvnpPjSfphAkz7/Pe+xcuek2PoH3qL9UA/Ej+42xKlBG4j+1onOV5ze2xqB2og5KAl
	 Kd7NJbQJ0OpENDtE1AKShMSFF/1oZ3OtIFvvELORcY62FZJTT4bSYdZF82Rs3hEv7RtDw
	 UDVGlQKnpyu5Tn2CFYClnKdkutc8xa/EjqAhbDygZYryy/M8ibC+n2iSxF+GDOgUTeA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795295587;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=G7jXsXsWq+dNelOHyMZZbQHQZBbftUa83odcV4y0LpM=;
	b=0VL12GBTjtEqWsN22a8PuT93QCEWMDoXXuAkJhUs4Qfe8f+3NMtg+Aa07iRVk7jKuTiA
	 0l9G+Jo4S31kBPapQNc8kCMy7FGaMGVriWRbnAPmenU8jPHPUlMhW48IxaZNYeToKFug/
	 ZbKXvljnGKi+mfIkPVqQ/0t9IiSLFdeGTMAFNxYhvgCNB9vwE21fnbQHiPPOHFURREMQM
	 G0EHSzcLOZj1IKFHmXIymMCqXCAdVpky94wqZgBStbFr7NpEUKhcLNDHlY1XaPltT7ZFH
	 FuKc7a5Ee7jD7puh65sgToRI/z2kkhFSEL7iWc8ZPFgSXrNPIE/1IxSEs56lR7CP8yw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E044E1F000C4;
	Sat, 21 Nov 2026 21:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795295587;
	bh=G7jXsXsWq+dNelOHyMZZbQHQZBbftUa83odcV4y0LpM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=T+w5/kltun0GS6Ff61wOPKuZnVqCJK5m2ivH2pU7+D8x7Dc8bp3yx1gGG+m49xNMs
	 8Lmp0AEFlGmBu30fo6aj7Qaz+vIfIE1UiZCbtZbuajA2E4VKlgTKmnaRbfE/xWlLpc
	 L7+t0EyUs4lXVJKOvrz8w6xdJlsTZTSsJKRarEwFXNFIF5omjU8hdAUB/wzCvhMAmD
	 5pnewk5E09AbTZ5OGg/ZgYaIfFKUTkDMFFrZhkVCnjhvoCiYN2gfklPdZXgHQ3lc9w
	 kH1Qg+48TOozsubnFESiQVXirGzAggvYsAln9wiGS7qEI/NFweRYfrDm6cRRXBPMEl
	 N7VQsSgNAV5vA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 743AB4BDA5;
	Sat, 21 Nov 2026 21:13:06 +0000 (UTC)
From: Moad Tarrih via B4 Relay <devnull+tarrihmoad.proton.me@kernel.org>
Date: Sat, 21 Nov 2026 21:12:59 +0000
Subject: [PATCH] platform/asus: asus-armoury: add power limits quirk for
 G814FP
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-asus-armoury-g814fp-v1-1-6b5ae34fd9c3@proton.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxA0auQrm0ynRAGvYpxUbBgTQTSMkZDu
 LujLt/i/w1cTMXhVG1g8lTXeSqgQwX9jadRUK/FEENsiGJA9uzI9pizvXFsqR4WTNKmRIG5kSO
 UcjEZ9PW7ni9/e+7u0q/fFez7BxZymrV3AAAA
X-Change-ID: 20261120-asus-armoury-g814fp-7e87710aa6e9
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Moad Tarrih <tarrihmoad@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795295586; l=2842;
 i=tarrihmoad@proton.me; s=20261108; h=from:subject:message-id;
 bh=DPUJpKF8RbaOpYEFNVa4zs2Ih/YJpmPkRRd8Np0e9P4=;
 b=eP3PVy4urFkTB9/mzoVzPMOYltucm29xHjRhMCWq+7pfbQYCQmvESY+YldNH7bx920a+H7OAt
 BaLw5p+EPqrCLQXagqv14iamJCo8VTKljT7tMIK4f1kWXEkFjcvSuvs
X-Developer-Key: i=tarrihmoad@proton.me; a=ed25519;
 pk=wtwpmYxZldK7Qebavgtx7P5WmSQOiWjicK0506NOKLg=
X-Endpoint-Received: by B4 Relay for tarrihmoad@proton.me/20261108 with
 auth_id=1453
X-Original-From: Moad Tarrih <tarrihmoad@proton.me>
Reply-To: tarrihmoad@proton.me
Content-Transfer-Encoding: 7bit

From: Moad Tarrih <tarrihmoad@proton.me>

Add a power limits quirk entry for the ASUS ROG Strix G18 G814FP laptop.
The limits and defaults were read from the Manual mode sliders in
Armoury Crate on Windows.

Without this entry the driver logs "No matching power limits found for
this system" and the PPT and NVIDIA power attributes return -ENODEV.

Signed-off-by: Moad Tarrih <tarrihmoad@proton.me>
---
Tested on BIOS G814FP.317 (Ryzen 9 9955HX, RTX 5070 Laptop).

All values are the Armoury Crate Manual mode slider ranges. The entry
matches G614FP, the 16" model of the same generation, except that the
PL2/PL3 maximum is 162 W instead of 165 W.

The GPU values agree with the ASUS GPU power specification for G814FP:
https://rog.asus.com/us/articles/rog-gaming-laptops/the-complete-list-of-geforce-gpu-power-specifications-for-2025-rog-and-tuf-gaming-laptops

I concluded `requires_fan_curve` to be `true` by setting it to false
in a test build, writes to ppt_pl1_spl, ppt_pl2_sppt and ppt_pl3_fppt
were accepted and read back, but the package still drew ~140 W under an
all-core load, using `stress-ng` and turbostat to read the wattage.
With a custom fan curve enabled, the same SPL 45 / SPPT 65 / FPPT 65
limits held it at ~65 W.
---
 drivers/platform/asus/asus-armoury.h | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/platform/asus/asus-armoury.h b/drivers/platform/asus/asus-armoury.h
index 331c3bddf013..3b8937fefd9b 100644
--- a/drivers/platform/asus/asus-armoury.h
+++ b/drivers/platform/asus/asus-armoury.h
@@ -2638,6 +2638,40 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = false,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G814FP"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 30,
+				.ppt_pl1_spl_max = 120,
+				.ppt_pl2_sppt_min = 65,
+				.ppt_pl2_sppt_def = 140,
+				.ppt_pl2_sppt_max = 162,
+				.ppt_pl3_fppt_min = 65,
+				.ppt_pl3_fppt_def = 140,
+				.ppt_pl3_fppt_max = 162,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 15,
+				.nv_tgp_min = 50,
+				.nv_tgp_max = 100,
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
 			DMI_MATCH(DMI_BOARD_NAME, "G814J"),

---
base-commit: 9c82959c37bf69c2ace8a0f975cf2129ec1fd982
change-id: 20261120-asus-armoury-g814fp-7e87710aa6e9

Best regards,
--  
Moad Tarrih <tarrihmoad@proton.me>


