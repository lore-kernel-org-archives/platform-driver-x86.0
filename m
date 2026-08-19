Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32C63033DE;
	Wed, 19 Aug 2026 15:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151783; cv=pass; b=I/BXXN0vjoic8FyLxMCEg5h0FQr2FcBePIsO3oL3hQGFOx+R8EVB7ytfv9Lpb2JTAM2aj1tQNIuVdtTJfe/Kvdcp3rwPEMEIP3iend6pVqzPf45FE3hEHvV06qAVVRd1tc0SCoJ/Wty8U6UQXYjcEjWCeKvq9rUFykUIOKRO5NU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151783; c=relaxed/simple;
	bh=mOoQEmHhvZgyuzUtg2aJ0Zhxh1y4JpYPNwv0T6JB1DE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tjyhfU2Oa4IsCjZPsgVKdUkglmKEyfL8rLj85E6KmZ8lunWm8m5C1WxtMSAUqQq4QJlXatwUtGbOnvkOEMpESR4LkYAn0EvHXYYgnPs5wUqYmI6UUEfxp1h4caViiDAC3o9E2ye5+zA4nYOzMsrZMuTweWNZjdLAUUWGe2wnjhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=moh53n.net; spf=pass smtp.mailfrom=moh53n.net; dkim=pass (1024-bit key) header.d=moh53n.net header.i=moh53n@moh53n.net header.b=l5X3hJxP; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=moh53n.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moh53n.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moh53n.net header.i=moh53n@moh53n.net header.b="l5X3hJxP"
ARC-Seal: i=1; a=rsa-sha256; t=1787151777; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Viar0xbp30CC//fkql6+M2tGf3M0fVXNPfQ1s7s60jS6vQnqHvZjNTEvcj9lGrcTNRBrkIZIlxfu5Smqf04XNkmGGewEa8i7IIJPSDnUtqLmE+QG1KF0baQ5zdNt4VhfvRnxYIXxQNsicPSfJQAOMx8BlhWpCSIScyYwk8rUId8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787151777; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mDm1+ymBIEM4CCnqUhu0jUEHl/Uz5bvygWVo/xPn99A=; 
	b=ZlNXnqj3cjTVVzxB8mdTrpbJuXtEkoeatJGPPcs2eqyVvPQjR/MFeGCW+OiHubwwFDl0IpX2x4JoW7ZzF9gvRSAf0VgW0K8XoUoshg/iu0Lho11yPDdvFBGZSqOKCyNwo4Mbmfv/KtG3rxkwNv1I3iX9AN4J/LnelpsGeFGFhAI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=moh53n.net;
	spf=pass  smtp.mailfrom=moh53n@moh53n.net;
	dmarc=pass header.from=<moh53n@moh53n.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787151777;
	s=m; d=moh53n.net; i=moh53n@moh53n.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mDm1+ymBIEM4CCnqUhu0jUEHl/Uz5bvygWVo/xPn99A=;
	b=l5X3hJxPcWZJKb0bywm/LeYH/uCpwxwU5wy1DWwR9FDzTAoReKYqcFM2R4TYmHH1
	eaVPzfmVh8hbT4IIuDAx90jnrNyFUpGpd1iaggLX35XgMjyWFR87wFkiBiPZ8CuThlu
	y8A01oIq828vBcw4EtDDOPBUmqqVMm9nSLdTakLU=
Received: by mx.zohomail.com with SMTPS id 1787151775869547.1175598439137;
	Wed, 19 Aug 2026 08:02:55 -0700 (PDT)
From: Mohsen Tahmasebi <moh53n@moh53n.net>
To: "Lee, Chun-Yi" <jlee@suse.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohsen Tahmasebi <moh53n@moh53n.net>
Subject: [PATCH v2 2/3] platform/x86: acer-wmi: split hwmon from platform profile quirk
Date: Wed, 19 Aug 2026 18:31:57 +0330
Message-ID: <20260819150205.19453-3-moh53n@moh53n.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260819150205.19453-1-moh53n@moh53n.net>
References: <20260819150205.19453-1-moh53n@moh53n.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Some Acer laptops expose the same WMI sensor interface without necessarily
supporting platform profile functionality.

Currently, ACER_CAP_HWMON is enabled only through predator_v4 quirk,
but this quirk enables both ACER_CAP_PLATFORM_PROFILE and ACER_CAP_HWMON.

This commit splits hwmon support into its own quirk field, renames
predator_v4 to platform_profile, and updates existing predator_v4 quirks
to enable both capabilities.

Signed-off-by: Mohsen Tahmasebi <moh53n@moh53n.net>
---
 drivers/platform/x86/acer-wmi.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 00c3113c4cf8..1d1c0d3bcec3 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -403,7 +403,8 @@ struct quirk_entry {
 	bool turbo;
 	u8 cpu_fans;
 	u8 gpu_fans;
-	bool predator_v4;
+	bool hwmon;
+	bool platform_profile;
 	bool pwm;
 };
 
@@ -421,9 +422,11 @@ static void __init set_quirks(void)
 		interface->capability |= ACER_CAP_TURBO_OC | ACER_CAP_TURBO_LED
 					 | ACER_CAP_TURBO_FAN;
 
-	if (quirks->predator_v4)
-		interface->capability |= ACER_CAP_PLATFORM_PROFILE |
-					 ACER_CAP_HWMON;
+	if (quirks->hwmon)
+		interface->capability |= ACER_CAP_HWMON;
+
+	if (quirks->platform_profile)
+		interface->capability |= ACER_CAP_PLATFORM_PROFILE;
 
 	if (quirks->pwm)
 		interface->capability |= ACER_CAP_PWM;
@@ -456,7 +459,8 @@ static struct quirk_entry quirk_acer_travelmate_2490 = {
 };
 
 static struct quirk_entry quirk_acer_nitro_an515_58 = {
-	.predator_v4 = true,
+	.hwmon = true,
+	.platform_profile = true,
 	.pwm = true,
 };
 
@@ -470,7 +474,8 @@ static struct quirk_entry quirk_acer_predator_ph16_72 = {
 	.turbo = true,
 	.cpu_fans = 1,
 	.gpu_fans = 1,
-	.predator_v4 = true,
+	.hwmon = true,
+	.platform_profile = true,
 	.pwm = true,
 };
 
@@ -478,12 +483,14 @@ static struct quirk_entry quirk_acer_predator_pt14_51 = {
 	.turbo = true,
 	.cpu_fans = 1,
 	.gpu_fans = 1,
-	.predator_v4 = true,
+	.hwmon = true,
+	.platform_profile = true,
 	.pwm = true,
 };
 
 static struct quirk_entry quirk_acer_predator_v4 = {
-	.predator_v4 = true,
+	.hwmon = true,
+	.platform_profile = true,
 };
 
 /* This AMW0 laptop has no bluetooth */
@@ -2192,7 +2199,7 @@ static const struct platform_profile_ops acer_predator_v4_platform_profile_ops =
 
 static int acer_platform_profile_setup(struct platform_device *device)
 {
-	if (quirks->predator_v4) {
+	if (quirks->platform_profile) {
 		platform_profile_device = devm_platform_profile_register(
 			&device->dev, "acer-wmi", NULL, &acer_predator_v4_platform_profile_ops);
 		if (IS_ERR(platform_profile_device))
@@ -2209,7 +2216,7 @@ static int acer_thermal_profile_change(void)
 	 * This mode key will either cycle through each mode or toggle the
 	 * most performant profile.
 	 */
-	if (quirks->predator_v4) {
+	if (quirks->platform_profile) {
 		u8 current_tp;
 		int err, tp;
 
-- 
2.54.0

