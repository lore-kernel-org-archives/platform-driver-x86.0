Received: from 2.mo584.mail-out.ovh.net (2.mo584.mail-out.ovh.net [46.105.72.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6164381AF
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 01:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.72.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790645714; cv=none; b=o3T29db7TtcggrAlSnIMsqmAs5jDf3SB8xxbjO3i+dxVehanbPAlvDzRM7t9pQujT6WWoKNpskW3ImrFmdHX3CxSEBW37wRKwHU6wq7YDJgjVPixJQRFA63bWaH4ZVLxlnzGNNzkKwdFiC2li1lUCmlERv2CHpErWU3Ra3mRYVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790645714; c=relaxed/simple;
	bh=hNpyhjibfiaXZJa4BYYigem2CrO6VBZo+9dKxUhxqn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cEO+Ld9V+r7AeyYsUILvIwvZfJHtr+ro3qWtObo5GkADBnuyr07vuOy1jjvr+X+3713mkVIxvaVHyXYyYpu3p5NjoRPKBV4msaNA4FJft4hEwmeOpTvFNDeYw/izi0pH6FONYtp4ZIVej+RfkZcn8+vGnwKreyuz/hi1cMwBTho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bobtopus.eu; spf=pass smtp.mailfrom=bobtopus.eu; dkim=fail (0-bit key) header.d=bobtopus.eu header.i=@bobtopus.eu header.b=QbpCogpj reason="key not found in DNS"; arc=none smtp.client-ip=46.105.72.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bobtopus.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bobtopus.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=bobtopus.eu header.i=@bobtopus.eu header.b="QbpCogpj"
Received: from director9.ghost.mail-out.ovh.net (unknown [10.110.58.50])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4htmQb6643z8DSB
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 16:06:47 +0000 (UTC)
Received: from ghost-submission-c7b579475-t7vw7 (unknown [10.110.101.251])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B0C3980F21;
	Mon, 28 Sep 2026 16:06:46 +0000 (UTC)
Received: from bobtopus.eu ([37.59.142.108])
	by ghost-submission-c7b579475-t7vw7 with ESMTPSA
	id IriGGpaQumqhzREACFZ/tQ
	(envelope-from <bruno.boi@bobtopus.eu>); Mon, 28 Sep 2026 16:06:46 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-108S002c533a36b-8e65-419c-ab5d-ac36f1bb9d5c,
                    99F57D8295E04052021F6BE73B89593FAD7611CD) smtp.auth=bruno.boi@bobtopus.eu
X-OVh-ClientIp:212.68.233.96
From: Bruno BOI <bruno.boi@bobtopus.eu>
To: Shyam-sundar.S-k@amd.com,
	mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bruno BOI <bruno.boi@bobtopus.eu>
Subject: [PATCH v2] platform/x86/amd/pmc: Add Thinkpad L14 Gen3 (21C5) to quirk_s2idle_bug
Date: Mon, 28 Sep 2026 18:06:07 +0200
Message-ID: <20260928160607.679319-1-bruno.boi@bobtopus.eu>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 10418796266196504335
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTEF7O/6XV+Imq6+SquqzfAqpnXb6us3reiXvDlUXpuo2rZ3pbwY7WCcfHJjL/6/CIyDwyvpvnzpECuIj/ZIH3UcL74HWIARgj/tnG4uQg0VxhZbNblLPalU+JNaPWmZ8Yf0i+esrT5fp57JgS+l8Bs5k794AzSxXxnBSZmsFt1E1TC0rMMdq8MuayUFe9ayG9WzBcBmWJ4RfcBdnbdEoCGxqT0KV7IrwARnIAOZojuHo/eDD/VGN/QPOJGLTKui8IdAl+rOcauYSPWO1neaDzgNGDueYc3simIxlPo9Pgc/SFNNPOU6sbDWRjrKtG+fWDLeslVRYV8omI4Qcv6dnClsPv1tFUFcY7XunyJ0cRKKBk0P7IT1MoC+dIjV6rMb68sZXJRsQWeZeunNcJ2c8wb7OeSyW3i5ep2d2U+xKjpNOkuQY+DuL705lBPHuPHdRn/XrjGCDB0ZSvJ4xwaQPPiawiGQbdAkPM8OmvlulqiSJB4BDIAtwjOaN5hmj4CJMhEfOBFRJEyxgHIcNgChBQj1p+gk6zruegpC69qLwKr7g8G8VYKTbBd1EZTMIyGuX9fV6Uun5O7CZYs6SOKCVI4IMCPwiAClJevK1bgBReBtFvzqe3DkQrusE1x7RHhxaFjfwobSaJNZCC0kV0jMW2hBGztTPsZ3gOBzF80KGEts4Q
DKIM-Signature: a=rsa-sha256; bh=34cG1jnBhpy2sUkvMC6rVoyC5Cl4dYq87dmYhIWL/PE=;
 c=relaxed/relaxed; d=bobtopus.eu; h=From; s=ovhmo3865769-selector1;
 t=1790611607; v=1;
 b=QbpCogpjvbkxrRtnRQnWEKnqhcFzAOiqEPZYPYl1jSY46//7gnDPgKyWzOpUPYkJgX3mlId3
 ocJXdY9Y1RqtuJWFxnFFcXky4cLmjvziTz5Vg/faFvfgkOK/8Cp9ewcUfRox1GkoJRPlMiYF4B6
 VHNetRF6wmc8ELboR9ZwCvbNgPjjuQyM3LtInEjbm04PEpcgzmirDmN73g7rgkPeppqU3OweVEe
 F2W5kkoyAR+ucdQXbyKtYUt08vQHrszYhVwLcL6/2/3I/g2IOplNWxa3Tk1HXbZeVzzLTptnKN1
 uYRxzOULjQYvficqR/I8AmDCBd5S+1trhpG6Sw479ZnMA==

The Thinkpad L14 Gen3 with DMI product name 21C5 is affected by the same
s2idle resume stall as the already listed 21C6 variant: resuming from
s2idle blocks for several seconds before the kernel resumes.

DMI_MATCH() performs substring matching, so a "21C5" entry also covers
SKUs such as 21C5S05800. Add the 21C5 model to the existing
quirk_s2idle_bug table.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222070
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221273
Signed-off-by: Bruno BOI <bruno.boi@bobtopus.eu>
---
Changes in v2: resent with the correct sender address; the patch
content is unchanged from v1.
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index 74ddf1d..c3fabc9 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -246,6 +246,15 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21C6"),
 		}
 	},
+	/* https://bugzilla.kernel.org/show_bug.cgi?id=221273 */
+	{
+		.ident = "Thinkpad L14 Gen3",
+		.driver_data = &quirk_s2idle_bug,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21C5"),
+		}
+	},
 	/* https://gitlab.freedesktop.org/drm/amd/-/issues/4434 */
 	{
 		.ident = "Lenovo Yoga 6 13ALC6",
-- 
2.55.0

