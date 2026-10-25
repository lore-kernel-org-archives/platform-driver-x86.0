Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792913709;
	b=x3n346LF73RjopCCP5QdJqCt91aNWuMcUOQvtSGX+qDn66Q00aHM5PWTBBt2wkOJKTX3
	 Kqy9vnYSBk+38tdRkOFJhjDwzdVmUgvPRjFWMlVG1yKflxXUkdKtdzxKv/eTeCYqlM2Tb
	 T9C/YpVwjKg+F9ycG/n29aVN0bBgqP31OGdsLf3+j1OpQj0YlLopMMBtVBWbj9mWMdvVo
	 BcV17i+y05X4YAGCh7uvlVBOv3VP51UnROYdZ46rn9nwojHlKozvotyPbneeX+xUlAmp6
	 eYUZIIb24TJoWbVFliSWZxZwtdUlbIUTE0VOXTYc5rjbcmXKbTnbnOhL+1ZdkoAJuYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792913709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=aJ7YOTOHa3OxglopkxnSIc2krfMh+ZddwdOunBlwhvU=;
	b=CP267F8+rr8R2XCLMg9NLjKndko2xw+k7bZWrv+MlImRQUVUkkCELFaRu9gu/DO4YGbI
	 gCaBRfgjkV45TrIFzm7bRfJCzvBmSb1VQyMC7QgDSqH2Ei7005EcJqr2+mZE8rNBnFFhh
	 ez6jqj5jD09W2IbEDWxtwlhoZJCPxgw32tivi6+Ci8gtXLBClYPuwZgTbF/pvzjXp8Y0H
	 AqNgrVfQV1MVvUw2KC/Qj/ksE+EwRa82SfQAHNBxVsNYj919/sCj4MqkIR5c/tFJpgMMz
	 eYtIRobVKSHpeScrTP85g5mKC5NuGfOkl0TmMCfYLaV/g4UpJNKBMurzUcv3Ipzoqbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XeL9YMmp;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597F3606A31B
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 07:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 597F3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XeL9YMmp
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36681e85e87so105452eec.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 00:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792913708; x=1793518508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJ7YOTOHa3OxglopkxnSIc2krfMh+ZddwdOunBlwhvU=;
        b=XeL9YMmpXNghgNiNN6qKfxSa1Ko4c+uS37FICamRT1deiNALEjS6UgcgQlAwp1e4gt
         J4zFscC3C0L5Su0+zhWy5UKTD4aezHCEsK0j0QCkZL/NjLU7NZvbwZV5K7Al7lxLdsZo
         4p9tkRJrWYc9N2WxRU2JiWy0/6B0rXm4Vq0OjQxHca5Zg2qYIFzHaLYKnlJzsOQYdNnW
         3yYaHtH4Onwg2qClfnJRGnKQbk/ILwmRd7VtasVZ5JtAY+oVJU0fQKhAuWKmZVyZ+6ir
         bbTQ/RI0DXS0LO5RvS1Au2LL2RgtQcNoVQlz/TmgaeF2COMIyLeEJ9jtyOZ146sjSarG
         MOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792913708; x=1793518508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJ7YOTOHa3OxglopkxnSIc2krfMh+ZddwdOunBlwhvU=;
        b=l/iL3koFq1JREZ8tFe/fpQLmELV13odYA41mbKvQ8Z6Svq+CaZ089oTY6G/DudnAql
         PUlWd0HtOryncLIv5UvfzJOz38WWBJsBPYVuK9fCmYGK3iRLhLwHjJ/DqsFqfwxjnMPs
         G+t62T1fFGTodIdVuYIZkpWfsyvBXIFUEp8TVCYRxIRsGlIcTKm3fhfmhDeJe+AIMW5I
         dBwmRagjC1YG9okqgoPwgyZTpyT9RC4hP+dotFirdkx5I0Uit9qvD5PyVWFCUZ6u4Eo9
         9L8NudGveR48IQBNxqapmQR/isTg07CQUCYdOZuAZg+HudZLSkIVOuvM6Th0W5oumB1k
         hogQ==
X-Gm-Message-State: AFq9FYIMUVq43MMK6j6cWlVSROLA/9TWfV1OV6CWnlQEp2nZ6juyrnmf
	iJmEWW8A6Zgm8Q16xMAHoOkA6twV7SYeLnrKBY4XeGbZwbh48LVogitw
X-Gm-Gg: AYBFou0RlnnXSqvYbivbXyCezJ68KP/uk/7vsmEiKjn3mp37bTw8n8b7TWr8/BdgS2w
	i6PE5j9xvhozaDjQ8aIZVmBiCqGEXR+KO8LIVR7koQSPlfDz1wKQomTUMu84hImo/BpQOlyjHJU
	kcNhXEt49io7UzD4Ol1ollj1GN+7ds2NuhzgAalPWFmCQL6zutNE+sWmYMh6Cg4avcqXlpZ8a5V
	V7z3fGDNsFj5oebHRowEZ90iqjbRzxWYQmuTkLcvBqIKx0sX7/nG+h+Kc6vHAvo8gKhODZi5nLl
	UhfhS7p68s5v1SkWDTeqr+qHPpKuoDmasNdHqx6ykn01D5zcPDiWhE2Ynu/W5FV/tD7XX879Ass
	SDu8YMn0aca8TnLFerkZzcC9MZ6tQ16Rhs6GQu48J2sgVffwiCEZrlVvtISewSGBWc2RGIDewv2
	dFiZms7b2Qz4RQq0Du6+Fm8aGUVZiox6bAB9crlQfvPHVnGX063qtlBPfsE2PNVmY160xojkNDk
	NAcotzmmca+T3lmnM+rDGdsZTS5Th78YtX2ey79hs0cgGGUYigtuqnLW1hCvFEa1XlKSvYz2H09
	kpxH
X-Received: by 2002:a05:693c:6209:b0:366:83dd:46f3 with SMTP id 5a478bee46e88-369e84596b9mr6176954eec.14.1792913708251;
        Sun, 25 Oct 2026 00:35:08 -0700 (PDT)
Received: from localhost.localdomain ([2409:40e2:11e1:8680:3154:5358:731d:7be5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm27620427eec.23.2026.10.25.00.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 00:35:07 -0700 (PDT)
From: Sourav Nayak <nonameblank007@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sourav Nayak <nonameblank007@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: fix power limit failure for Victus 15-fb0xxx (8A3D)
Date: Sun, 25 Oct 2026 13:04:06 +0530
Message-ID: <20261025073406.10085-1-nonameblank007@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Victus 15-fb0xxx (8A3D) does not support 0x29 query,
Casuing severe CPU power limit after disconnect/connect of charger.

- Fix this regression by restoring user selected profile,
- It matches behaviour written in omen_power_source_event.

Error output:
[ +14.861905] hp_wmi: query 0x29 returned error 0x29
[  +0.000036] hp_wmi: Failed to actualize power limits: 41

Tested-by: Sourav Nayak <nonameblank007@gmail.com>
Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index ee6de96b3280..9770cab99b9c 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2355,6 +2355,25 @@ static int victus_s_powersource_event(struct notifier_block *nb,
 		return NOTIFY_DONE;
 	}
 
+	/*
+	 * For board 8A3D (victus_s_ec), query 0x29 is unsupported and makes
+	 * CPU power limit to 4-6W. Match omen_power_source_event omen/victus behavior:
+	 * if returning to AC and the profile differs from EC, restore the user-selected profile.
+	 */
+	if (hp_wmi_thermal_profile() == &victus_s_ec_thermal_params) {
+		if (power_supply_is_system_supplied() > 0 ||
+	    active_platform_profile != actual_profile)
+			return NOTIFY_DONE;
+
+		err = platform_profile_victus_s_set_ec(active_platform_profile);
+		if (err < 0) {
+			pr_warn("Failed to restore platform profile (%d)\n", err);
+			return  NOTIFY_DONE;
+		}
+
+		return NOTIFY_OK;
+	}
+
 	/*
 	 * Switching to battery power source while Performance mode is active
 	 * needs manual triggering of CPU power limits. Same goes when switching

base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
prerequisite-patch-id: 81b94f3910be80ec60f3b82188d4b141ac6c34d7
-- 
2.55.0

