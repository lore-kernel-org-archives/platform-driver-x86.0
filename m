Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE2137A82E;
	Sat, 17 Oct 2026 08:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792226038; cv=none; b=AJ+t5fdJzuxVCRtIblSUyuGFkmL6PCGA6HesrJ+rqUIb9VC+TIsVGytXYPwJ1eOCLnHoYLfl38H+BhEpJ4IoXOfsP+1akG4VyDaJwY/qnYRdIznLAE6emGRxSzTW5lFf32A9YjwF18zVJeAQncYB5yaGvG2B97WjFq3ucifkhQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792226038; c=relaxed/simple;
	bh=JVjdQX0PdR4Q4QZEUjGXnX8KHC9tVxVDL0I8x1kOeow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n3ymXm4SH5Jrwc6x4vZyb4y51d/eUoApn+pzmBvp4TGuMUoaLFcRyd3LIOdsyo/rNxuit4XDhzLo3yCVUnerTG5IZ2vJawS9+HnMdHPkJ0qV726rR/21WHQEiUNvsoS2swrSEbfg/c39/AurbAb24m1w0fBy4LZTqzhoX24gTa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxEDyO9a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxEDyO9a"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C9A1C2BCFF;
	Sat, 17 Oct 2026 08:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792226038;
	bh=JVjdQX0PdR4Q4QZEUjGXnX8KHC9tVxVDL0I8x1kOeow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZxEDyO9aSsgmkH0cvmPOviyF1EctKU4504JyQgbbBG95x4YW4IYjxjmOUTXze+IzU
	 HoJoGoe0D0yanpUTZv1VjLIr1W28EU4nHi3V/XvGM1fGUqYtJKSW50PH53JnOXgLwq
	 zryUhY7ebuA6H0+VFY3OdO/tBWO2dB01U98xIp2Y8+Vzorum5C1UehVCZ0TGLrLOTE
	 xHmwZdZDY1MOEw2QSXzZ+7OcR4CyZTrIrwAJPWPrOoNZcr9AkyWL8pf6KJxXT9rmIe
	 vCNWGBmIPEtYux1GeVAVNqYh4LGP/Ps1bKBeQkfsh/JgLKKMe/Fwatvra+Uiuf/DYm
	 wuYB3UtPY45qQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82149CCF2CA;
	Sat, 17 Oct 2026 08:33:58 +0000 (UTC)
From: Dennis Nilsson via B4 Relay <devnull+kontakt.dennisnilsson.se@kernel.org>
Date: Sat, 17 Oct 2026 10:33:59 +0200
Subject: [PATCH 2/2] platform/x86: acer-wmi: Add support for Acer Nitro
 AN16-41
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-acer-nitro-an16-41-v1-2-c2e7a0ee7303@dennisnilsson.se>
References: <20261017-acer-nitro-an16-41-v1-0-c2e7a0ee7303@dennisnilsson.se>
In-Reply-To: <20261017-acer-nitro-an16-41-v1-0-c2e7a0ee7303@dennisnilsson.se>
To: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dennis Nilsson <kontakt@dennisnilsson.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792226037; l=1346;
 i=kontakt@dennisnilsson.se; s=20261017; h=from:subject:message-id;
 bh=QTBqp6Vi/0AxROqLBEXCoQ7Mc+MetYvOr68Lo+Bb148=;
 b=f4gjnUTG8Zq45IQkm8WzVjhyr/j5xFLz28d1tcMpLPw9f2BKuD+B2Dw+5hK9EVccwUG1agqiI
 frEtdknVzTaCSb57rcTJunHN9VjWi2ltoK/b8hbe77aqppAdVMklgCn
X-Developer-Key: i=kontakt@dennisnilsson.se; a=ed25519;
 pk=H+jadpTa8sEscQhkbeWZC2woL8j7NYwN5m1YCjkHJRQ=
X-Endpoint-Received: by B4 Relay for kontakt@dennisnilsson.se/20261017 with
 auth_id=1223
X-Original-From: Dennis Nilsson <kontakt@dennisnilsson.se>
Reply-To: kontakt@dennisnilsson.se

From: Dennis Nilsson <kontakt@dennisnilsson.se>

The Acer Nitro AN16-41 supports the Predator Sense v4 platform profile,
hwmon sensors and fan control, but currently needs the predator_v4
module parameter to expose them. Add a DMI quirk for it, reusing the
Nitro AN515-58 quirk entry since the feature set is the same.

Tested on BIOS V1.03: all five platform profiles are offered by the
firmware and switching them changes the fan curve, both fan speeds and
the temperature sensors read correctly, and pwm1/pwm2 work in custom,
maximum and automatic mode.

Assisted-by: LLM
Signed-off-by: Dennis Nilsson <kontakt@dennisnilsson.se>
---
 drivers/platform/x86/acer-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 323179c43..3a018fdf5 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -681,6 +681,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_travelmate_2490,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Acer Nitro AN16-41",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN16-41"),
+		},
+		.driver_data = &quirk_acer_nitro_an515_58,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer Nitro AN515-58",

-- 
2.53.0


