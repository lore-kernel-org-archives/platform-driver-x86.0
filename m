Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792874354;
	b=w17KM1E/B747OOMek5delNFKt/RxtPxOipOrCApprYcTTd3DelfLTKAXVyKfxFCcdBdR
	 yfMuHUU/EtMKZRHALeoh2FO1ZXdhAkgUcINw0DY3m54r2dg9FoT4iE4qzmAIqlWGW0N0Z
	 D60Aahj3Z08r2qQFLZK/g93NwuEkEtMTom/kF1EOeVXwASiLbsafN3kd4vOCRmytB0eXz
	 6EkrDY/C8P4+srw1P0N6bTk/3MUsaaTtjaAIMw5C9Sk5laLuWvTAjyMfZF6qQmPlruHAG
	 6JozVD5PzPpr240ptaMMhgsWyZsGyUOikRZHMyXWV7gMkOc/z5QBFqUbXuGiBARJN0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874354;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ixdUSjsQFaW20UFZIyzmxZy6ail/bQGntDRD3B9otLo=;
	b=y9SyQwS61opHhFc5dT4Y7iT8A/NL6qaoT0EOpxgcjeym0m2EYBFOAg0p1aC/nr61Z4tj
	 p4+QHh+6SOLVjd6UEvOW6/cqrzYAh2qbYuhrTtwtZSKDh2YrM19mSzp/qJMbtWxkiL+Lf
	 VknsFhlO4O41Tkx8ABIo+J2ysItU9fjVbVrnUsokBdQicwoCUCfDEC30iIZVbNljX6I7K
	 U7s0S3ktv6nc4kpcvaRbQoS64CBI7ki53brya0Wc8YvKoqGA4SWaaR5B0Pe7gii3VBbkQ
	 oobJb5fay9CJp3AoHOwrB7VkIZAKXtImVtHbKPN51DzPr5YsX4umEtai0Q5rmuHmcBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fB5W+r+S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C857B606A31A;
	Sat, 24 Oct 2026 20:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fB5W+r+S
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792874353;
	b=eatvTnI4Cd01ovxrSHCH8TLtLOTJMHm/4ZLxDh1rFBhnzc7QVTHQDi7wmW7xq8CMEmmg
	 i0ERW0DvxhAmlUjd3COdtCEjai8ntUW5KNoWjXuCGLXQ1JwyG4rlz5Jiguv36fhjNMdS2
	 QM2SMKJ2bWO/0k5OUMRXkHHXEw3f7FlHnGHvwyhpHIb+8YPxxRsELtUey3wwkars72MXE
	 qRIV32BNWCkSy3cVFipJuelJOvyZlJzLQOT6lBcZTheHSLv6Ru6cih+ianastGKuXcgHS
	 2Vk+y0PLQGCm2WluKmusCGNZsUbqKRUBVt4bmtRkU0Bwi0vQ4bFShxx8xfo6+UW4+cw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792874353;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ixdUSjsQFaW20UFZIyzmxZy6ail/bQGntDRD3B9otLo=;
	b=znJ009LGIPbtUpzmflHnUCSnvi4Xy/SFaRjyUCFrCdZXGG4RVwjVkDQVFjZ967gZ1xGK
	 Hi8XH+Dq0g97fvuSgJfVXuSTVtgc1dPNThDIpwQDGvluZRl5JQyOENP1Mb16eEfCfDSJr
	 /aKPpiB1FNayS2stU0dULa9dzUEADGBWPp1cJbcw6BxEIiFXDBfbB15xxiCMCxRxyP1Zq
	 4JFaUZWGpjywT88XLTdh2Bz3jHJ1LsNwweUP1q4c0S4EKpEKK1yMtN7dNrbqKzAMSPFhs
	 u6Fk4URhnGhWtiT92S2bY2CLcnemQFosqFa0Vd7UEAK3z3NuHm9zeKwndxqXTazJk0w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7B431F01825;
	Sat, 24 Oct 2026 20:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792874353;
	bh=ixdUSjsQFaW20UFZIyzmxZy6ail/bQGntDRD3B9otLo=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=fB5W+r+SkAD47MXa9hScc0EvIq1E+k7Ge7AvBNCPXDotNVcjZBvrS3Xa4gsdeGZ4b
	 jXWXiPFyi30mZ8kCGfRn22MrsyIS7LmXtXmpyxJ6PI6YUOtrmEpS6QwSXNaCCIZduu
	 FuK+GC3P8G/Bi6A3YnXi/Squv6hLwjfpWN7A9Xq9/tG4XgGcfTnTyFrVrujgElHId5
	 Z9dGZt9/9rc9JC3IV2BbyPmp/7QdWBzXHManERi934CcSRsultfzLipgcCv67L1o/7
	 b+wgt9vECOUz1Fcpvhsv3lOTSBYKlvSFaszt9BpdlO16v67euZz+SDMBFD2pIR8538
	 yY3nAbkfKFHxQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 48647448A0;
	Sat, 24 Oct 2026 20:39:12 +0000 (UTC)
From: Arnaud Ungaro via B4 Relay <devnull+contact.arnaud-ungaro.fr@kernel.org>
Date: Sat, 24 Oct 2026 22:39:12 +0200
Subject: [PATCH] platform/x86: hp-wmi: Add OMEN 16-k0xxx board 8A4C support
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
Message-Id: <20261024-hp-wmi-8a4c-v1-1-5297fe0104de@arnaud-ungaro.fr>
X-B4-Tracking: v=1; b=H4sIAG8X3WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyMT3YwC3fLcTF2LRJNk3eRE02Qjy0QLUwuTRCWgjoKi1LTMCrBp0bG
 1tQAtXBcCXQAAAA==
X-Change-ID: 20261024-hp-wmi-8a4c-ca5c29a8584a
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, 
 Krishna Chomal <krishna.chomal108@gmail.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792874351; l=3562;
 i=contact@arnaud-ungaro.fr; s=20261024; h=from:subject:message-id;
 bh=rRskuoSffCBZeKa0EotDA49CXzGteq8ptZIW1CoaE4M=;
 b=0cC0d+4wMxvOvKTcdgD2Oi3wvky9K4u6kCNl0PVAxIU3dqQxTnRnC84774fTJQDz7Om4+ztQB
 XucxRR4r9OSCiBRjpZTGdRPPGj63GZTnEo2Ts+MaFqKHmvZngOydqkT
X-Developer-Key: i=contact@arnaud-ungaro.fr; a=ed25519;
 pk=E36DBHlmRhVNV3rriuNdMXwzVy3fGJ5rWE/saD1H0XU=
X-Endpoint-Received: by B4 Relay for contact@arnaud-ungaro.fr/20261024 with
 auth_id=1313
X-Original-From: Arnaud Ungaro <contact@arnaud-ungaro.fr>
Reply-To: contact@arnaud-ungaro.fr
Content-Transfer-Encoding: 7bit

From: Arnaud Ungaro <contact@arnaud-ungaro.fr>

The HP OMEN 16-k0xxx ships with at least two DMI board names. 8A4D is
already mapped to omen_v1_legacy_board_params but 8A4C is not. On 8A4C
the driver falls back to the generic thermal profile path so the
performance profile never enables the GPU configurable TGP. The RTX
3070 Ti Laptop GPU stays capped at 105 W instead of 150 W with
nvidia-powerd running.

The board reports thermal policy version 1 through
HPWMI_GET_SYSTEM_DESIGN_DATA and keeps its thermal profile in EC
register 0x95 (0x30 by default). This is what
omen_v1_legacy_board_params expects.

Add 8A4C to hp_wmi_feature_boards[] and map it to
omen_v1_legacy_board_params.

Tested on an OMEN 16-k0001nf (board 8A4C, BIOS F.21) with nvidia-powerd
running:

- With this change on 7.2.9 the performance profile enables cTGP. The
  GPU power limit goes from 80 W to 125 W at idle and 150 W under load.
- With hp-wmi.c from for-next the low-power, balanced and performance
  profiles all switch. EC 0x95 reads 0x31 in performance. The GPU power
  limit at idle is 125 W in performance and 80 W otherwise. Both fan
  speeds are reported and the max and auto fan modes work.

Cc: stable@vger.kernel.org # 7.2.x
Signed-off-by: Arnaud Ungaro <contact@arnaud-ungaro.fr>
---
Notes on this board, not changed by this patch:

- Like on 8A4D (https://bugzilla.kernel.org/show_bug.cgi?id=221680) the
  EC moves 0x95 back to 0x30 120 to 132 s after switching to
  performance while cTGP stays enabled and platform_profile still reads
  "performance". Under a long CPU load the CPU is already limited by its
  temperature (97 C) and package power is about the same before and
  after the fallback.

- I cleared the EC timer (0x63) and set the NOTIMER and TURBO flags in
  0x62 after each profile change as the driver does for the boards in
  omen_timed_thermal_profile_boards[]. 0x95 then stays at 0x31 but the
  fans stay at 2100 and 0 RPM under full CPU load and the CPU throttles
  down to 40 W. So I left the timer alone.

- Reloading hp-wmi after the fallback left no platform profile
  registered. A separate patch handles that.

Kernel versions:

- Tested on the laptop with 7.2.9.
- Applies to 7.2.12 and 7.3 and builds without warnings with W=1
  (7.2.12 against the 7.2.9 headers, 7.3 against for-next).
- Does not apply to 7.0 and 7.1. They list 8A4D in
  victus_s_thermal_profile_boards[] with omen_v1_legacy_thermal_params
  so a backport there would add 8A4C to that table instead.
- 6.19 and older have no support for 8A4D.

This is why the stable tag is limited to 7.2.x.
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 52077833ac89d3f4bd9b99fbbc1812c4f09d16c7..1cebc7e0cf47668761491091c50af0fb25d42572 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -257,6 +257,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A4C") },
+		.driver_data = (void *)&omen_v1_legacy_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A4D") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,

---
base-commit: 9d3475065167197742b0882aff21cf8e78393277
change-id: 20261024-hp-wmi-8a4c-ca5c29a8584a

Best regards,
-- 
Arnaud Ungaro <contact@arnaud-ungaro.fr>


