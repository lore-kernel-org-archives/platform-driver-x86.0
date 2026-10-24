Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792874369;
	b=TsravUy2Xo2Bjb2IABu2p6YYnXY8JVRIQuWWWd5rBIvhYYlQpZ4B/wLDWmf4YG4imhGj
	 rJ5UZ5hretSwzk5lEtZy0NE5eJWrQVG5sbBiaKRnAuBB2SEkinJZSVFGIagzquFlwqFhS
	 wxXZtWSA/V6nQ5oDVGqGQRlyyGLEhRHEzir780tCl6qmR0alLelj9Ds2pG9PTqSrXIdSU
	 awh7f14aPaEfAB98WqEG4OQ9SYQ8BW6LjL/9xeIFrwlJRDfzJZaqV3lo9etiurHIDlFoI
	 EhyApMd811io2lLFGai+o15CTXTe941HAQzsNi1Ml0ycmM1RTqj4XoO8CbUYuWXjcKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874369;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=U4b+nwtXr4voFRpf9I3hjJM8GUi5L7qiQMuLEqz0rew=;
	b=iOxyboMKTkus91Z2QDBjq+pIZH6PLAvlgKCwDQ6BsCHaFdp/GrKyVmIHmae5zeES5rp7
	 EUAJ5wRjeaFN3skXFTECGzD/kYM5tsJY7eLdMraGZZGVZACBEa7hIHqfcKSSAoqzhmB8x
	 ZEg2kEhfjmHseONZwvUjrFvf57WItqHpL6G+rIt3n3xy3EFp67cBPF6Ck5MKARFPftuBy
	 8zY2rcUbzgc+h7UX7OLS0HVDkC/kHrlfc1qdQBKb+xPUVDHUMWmoR8OYS6d7hPsbrallC
	 fL2ZYrs4IFSps15se0QF2jXYcmgyHhs90yk1TDdnreYTIMJKIyaxN5rel42itqMqh7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RP3XUeYq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924A9606A31B;
	Sat, 24 Oct 2026 20:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RP3XUeYq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792874369;
	b=hTrovD3UifkayUAaVXI0vUfwFl7XXbYhVGElDWK3GULwREiGx2vWSf4fiZvtZYeqJs0O
	 vpXPL5wxUkxjSOVXmyUlUGtGrEuAxKSujXl2hStXQPZ/GFs69dTnfbqdurCr+mq56aIM5
	 bEau96+KOtXoPyLV/2CZOW24jVsJsZvjYm36+aO2Ai6O82RyBfjcdA2uJfSwDrpcDYrnr
	 YXsVyR8MDYfefwj8FH3oFIpMuJuxqDX7xQwjb/5kLMj+lmiYcIG4utp5+vlolBvjz7/n9
	 KMt3PUj2mXoCwT+IFJkHOwkYn6UcugUKxiCjzEzWN/v7/TDQ5KTG60xJKtXAw/sWzSg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792874369;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=U4b+nwtXr4voFRpf9I3hjJM8GUi5L7qiQMuLEqz0rew=;
	b=oO9IkskXi6dET/t50PxnKj9hFN7ncuM5raRfxzlS+NqM+7l00IKh0j9q13xbGvO83J2i
	 gAHMPDdNlEEQZaUlGGiWWECmB+ASjfKNWb4FvcFdXkdfWYBMUWlLQyahYqqf9gyyhm6mZ
	 HYqLOGjEUoNmzficPqUBDCUXUM0zJMV67uS8a2DWSFHzFETAQ8fnt8GCrtGDsa+ISFoeP
	 E2awDCPbTUZ29X/m4fFRQTbdxySNe77DvOsoNsldtMbVtc3TaeKp1uRaYlI9CC/fkMQMr
	 EuLbdKrtN1evsv1+V7KbPaUkXIh8BRLSEMaXSR0Tl0P/k9SFn8fwqOUO40R9JJU5zyw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F3D9F1F01825;
	Sat, 24 Oct 2026 20:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792874369;
	bh=U4b+nwtXr4voFRpf9I3hjJM8GUi5L7qiQMuLEqz0rew=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=RP3XUeYqtTYGYiNw8pO+tal3q/uQpyF2B9xqicCHNQFbT0m2KE42K2JOdPpt/SmPk
	 8ezOYb1nyOHvRetRiJdqSWpWwEOU2dhfH0aopBOyUQhtGuN/yaah9VnZf2DckICNoo
	 z34R+iCql93u6F2h2hKAsOXl22TwkicgUiqCz1Cqr1dVSg/VNtY6jo5aLFy34C2IBH
	 HfYxEl6imp0QPVBW4jc0Bj6O9fsalP2LBcXUFSYexrXuSLN9s02Ekec2Ckqd1nlIpv
	 SeQGdu1pLIrp7EfOjKDywplhDOfm2cdJdZPVx9JqZyitbxZxLts0A5aNVUcXOIPkx0
	 i7LPiMQkEZ4vA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 84C9F4489F;
	Sat, 24 Oct 2026 20:39:28 +0000 (UTC)
From: Arnaud Ungaro via B4 Relay <devnull+contact.arnaud-ungaro.fr@kernel.org>
Date: Sat, 24 Oct 2026 22:39:28 +0200
Subject: [PATCH] platform/x86: hp-wmi: Handle cTGP left enabled after the
 EC timer expires
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
Message-Id: <20261024-hp-wmi-rechargement-v1-1-45d9f8447f41@arnaud-ungaro.fr>
X-B4-Tracking: v=1; b=H4sIAIAX3WoC/x2MSQqAMAwAvyI5G2iDC/Ur4sElag6tkooK4t8tH
 odh5oHIKhyhyR5QPiXKFhLYPINx7cPCKFNiIEOVNVTguuPlBZWT1oU9hwOdKa2leaodDZDKXXm
 W+7+23ft+KYUVYWUAAAA=
X-Change-ID: 20261024-hp-wmi-rechargement-905112fd792b
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Krishna Chomal <krishna.chomal108@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792874368; l=2857;
 i=contact@arnaud-ungaro.fr; s=20261024; h=from:subject:message-id;
 bh=WHIOpMJQcoqQDNURmL6QodtJb2QRPTimKwNCf0bbr9Y=;
 b=jzG7e2xlatCWljfyicjvPSKBNNYWStHl0T3eT+3A+N33CDoLr4io5myHUsV1ZU1TIOQc7hVQ1
 E98jQfhfZGsCd1GsRJJG87w2Zn5whxyljqrOoE+ypZTY3M61wRHaDbr
X-Developer-Key: i=contact@arnaud-ungaro.fr; a=ed25519;
 pk=E36DBHlmRhVNV3rriuNdMXwzVy3fGJ5rWE/saD1H0XU=
X-Endpoint-Received: by B4 Relay for contact@arnaud-ungaro.fr/20261024 with
 auth_id=1313
X-Original-From: Arnaud Ungaro <contact@arnaud-ungaro.fr>
Reply-To: contact@arnaud-ungaro.fr
Content-Transfer-Encoding: 7bit

From: Arnaud Ungaro <contact@arnaud-ungaro.fr>

Board 8A4C uses omen_v1_legacy_board_params. About two minutes after
switching to performance the EC moves the thermal profile in register
0x95 back to its default value while cTGP and PPAB stay enabled. The
same fallback is reported on 8A4D in the bugzilla entry linked below.

platform_profile_victus_s_get_ec() returns -EINVAL for this state
because it only accepts the default thermal profile with cTGP disabled.
If hp-wmi is loaded again at that point thermal_profile_setup() fails
and no platform profile is registered. The power source event handler
also fails to read the profile in that state.

Read this state as balanced since this is what the EC thermal profile
says. thermal_profile_setup() then sets balanced again and this
disables cTGP to match.

Tested on an OMEN 16-k0001nf (board 8A4C, BIOS F.21) with kernel 7.2.9.
Unloading and loading hp-wmi after the EC timer expired registered the
platform profile again. Without this change
/sys/firmware/acpi/platform_profile was missing and in my test it only
came back after a reboot.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221680
Fixes: eeeb4c9874bb ("platform/x86: hp-wmi: Add EC offsets to read Victus S thermal profile")
Cc: stable@vger.kernel.org
Signed-off-by: Arnaud Ungaro <contact@arnaud-ungaro.fr>
---
Found while adding board 8A4C (OMEN 16-k0001nf). That patch is sent
separately.

Tested on the laptop with 7.2.9. The change also applies to 7.0.14,
7.1.13, 7.2.12 and 7.3. They all have the code from the Fixes commit.
---
 drivers/platform/x86/hp/hp-wmi.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 52077833ac89d3f4bd9b99fbbc1812c4f09d16c7..699531157b5e8b002b28a3669acb33b7223cee75 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2414,12 +2414,18 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 						       &current_gpu_slowdown_temp);
 		if (ret < 0)
 			return ret;
-		if (current_ctgp_state == 0 && current_ppab_state == 0)
+		if (current_ctgp_state == 0 && current_ppab_state == 0) {
 			*profile = PLATFORM_PROFILE_LOW_POWER;
-		else if (current_ctgp_state == 0 && current_ppab_state == 1)
+		} else if (current_ppab_state == 1) {
+			/*
+			 * cTGP stays enabled when the EC thermal profile timer
+			 * drops performance back to default, so treat it as
+			 * balanced, which the caller can set again.
+			 */
 			*profile = PLATFORM_PROFILE_BALANCED;
-		else
+		} else {
 			return -EINVAL;
+		}
 	} else {
 		return -EINVAL;
 	}

---
base-commit: 9d3475065167197742b0882aff21cf8e78393277
change-id: 20261024-hp-wmi-rechargement-905112fd792b

Best regards,
-- 
Arnaud Ungaro <contact@arnaud-ungaro.fr>


