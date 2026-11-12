Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794452067;
	b=sRX+ioI+J//h+dBymN899v5jUuBUq+R8UM8EBt7QCI5YSmv40fXzB8zBv90QRp7Nz8eP
	 RrhFbAN6qFOkEhESUuL020LWMP7ngS02vw+dwfjcBj2ajTzxMQbg3IrM0AlSffyrtAMyR
	 nH6QxhqNAouT/KAj+eaS9dJzD6hCeAV00rfpfpm9XSvnLWGSOsf5sjz/AV4/eA+/PmxYr
	 AoTe11M3kPrUpHSOkgJ+FjXzuk2k6SA/dv13yDEcUNiO+QUvwt0JQg4GUiAW2mR12PoSN
	 GGyPe8YUgQQJU86tYZmUAOy4e2gpKTi4E2LOTuEBUbqVAUBOwhd6D/q/a2ZsuUu2q/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452067;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=B1kYRUlUdfou9ClmyzY8StYg6bdMm/dvZQ7towaU4EQ=;
	b=fC2t/XRbxOHad87J/1ZpHgHEYnD7b4+wEAjAVWcOvbXkQjtGjkqPRtDVO+YEFf+jtivR
	 8UAZJbKYw0qu27FS4q8qzWiGwKvQoOW9HRUnHxWJNHQcIn6Qu2CSUoysdBF3l+D9YyHFp
	 FDQIZRjMotw0kj+zMOkw1upkrXwmnYTb8EWi5BnEOe45Avz2PdtmowLTjaACWO3a3iwEs
	 qSrlSqPWwjWClWbZrjkOjm2q7B2ZWX9AefDwoTQlrdmC8u62lCbqlaa2vv6tEAOwvfFcI
	 J1kUGes56pMFI4DHjWoFyzxoIMj0N6PrzUINUcshK2npI0/bk0f1vKSSt0wsHfwgEMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ay1ktifD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A23606A32A;
	Thu, 12 Nov 2026 02:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ay1ktifD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794452067;
	b=2jKm6q8INdhy+/4SpeUyV4TD1NmMvszVqx8pKb6I1hpjI2gPd7YoizxbyXRB8ooyxUYp
	 Va4pV408WKJRBQYb3tvRlyBW8Vo9vpeq7TuqZuElgqGIiszivkrB4y5IcYiZufnZOGxsA
	 iZ1PryHbIjWBMlIxlKHNnoNcvnqda5I43Q2mb08v5pL//u0UsHXSoQKP8nQpAimx5BnNk
	 O31thmKM3FFG31i+pJDi0IRrqbsCoMCntDoBDBf3t7WK2C2UDZ5m2MXOcRUn4+ilaNIv3
	 kOxy9ocLyRE5cUqry3KKbA/3HIcSkjhC2R1jf6eWnAijOo7+miGJwkPG2E74motvmNw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794452067;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=B1kYRUlUdfou9ClmyzY8StYg6bdMm/dvZQ7towaU4EQ=;
	b=VUslEyg00lfE4kqG9MuhDKJOV/+Fk0oqK+VgTwT7j/CtWgBXXUzW+KtfXd/Orb8ALXEM
	 YiWoisD6TALk999YurLH+ids3N4vG88IW5Ohn1DDnFmy8sNtE71QJtn75kjOfk2pWODFD
	 A74DXpBl7A6CDlvKgiId4JI+HBPlQwgFniOF9ns2CAkEkVrFG2sjNbXHCE358TyfhSW91
	 MJq91COT7xCrHE1dPzdzE1wWuexierFlblvcY7KF7fbtNCkXFq0v8b6tO82BP1nKURdhz
	 Tvq4bXiUXy3HiaFRhHPWpftAt3hAgJt7gIMpJtn1DYM8xaeD8g1RpvDIWytRBCsYUKA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B34951F00A06;
	Thu, 12 Nov 2026 02:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794452067;
	bh=B1kYRUlUdfou9ClmyzY8StYg6bdMm/dvZQ7towaU4EQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ay1ktifDGvzdzk025rxpel43y/186zfVg/4/advmbuaA6kdSHrwOcsV7IrQIgZQTv
	 GExnJwoph/60PAJkuB+fDg0cR0a8UT850IrHMAc6CMq56KDnujLj/S/kQdg8tGG8xA
	 fwN5q1+21SXHJ7K2peK5YX6bfNhAQWZ7btMGoTrsFM38eRkJ/iWs7Xvtbe1hOa0JSO
	 4Ql8GA4tG5wqIwUt96G4bJHZjYa9Bl/9DRcNi43z1owgarPwTd0Nt4ROe0TnOfc9Ma
	 DpKrxyHirz+TNPuxR6/3XTeG354HTIloEEIYVzbZZ6hgN49z4Yw/MDkpsCLJnXGBZS
	 E6FOrCsPtHtXw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4204649231;
	Thu, 12 Nov 2026 02:54:26 +0000 (UTC)
From: Samuel Wheeler via B4 Relay <devnull+swheel33.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 21:54:26 -0500
Subject: [PATCH 1/2] platform/x86: hp-wmi: Only use the low byte of the
 thermal profile
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
Message-Id: <20261111-omnibook-8eb4-v1-1-3127f45cc338@gmail.com>
References: <20261111-omnibook-8eb4-v1-0-3127f45cc338@gmail.com>
In-Reply-To: <20261111-omnibook-8eb4-v1-0-3127f45cc338@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shang En Sim <sim@shangen.org>, Samuel Wheeler <swheel33@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794452066; l=2515;
 i=swheel33@gmail.com; s=20261112; h=from:subject:message-id;
 bh=Lv1LLK3vrHWNEFO3BC4NJWJr1q0dg08n6iLOShJ9Tic=;
 b=Qka/uR5xcS7FHPblj1ely7UHVrDuBfHLQLgouil2nzkRL45SdmkZ2PNxVkQsYOq5kcEJsgPfq
 Cge6AMnKuZxB3lk16dHAYamO1iNcDh9SMfvRi66zr4UdjxUJ2QImhd9
X-Developer-Key: i=swheel33@gmail.com; a=ed25519;
 pk=cokeT6B31W84o+Gc4wuP2okLF8wShbbGQ7pb5h5JPXg=
X-Endpoint-Received: by B4 Relay for swheel33@gmail.com/20261112 with
 auth_id=1494
X-Original-From: Samuel Wheeler <swheel33@gmail.com>
Reply-To: swheel33@gmail.com
Content-Transfer-Encoding: 7bit

From: Samuel Wheeler <swheel33@gmail.com>

On the HP OmniBook Ultra Laptop 14-kd0xxx (board 8EB4, BIOS F.06), the
HPWMI_THERMAL_PROFILE_QUERY read returns the active profile in byte 0,
followed by status flags and a constant. With the "default" profile
active the four bytes are 01 11 04 00. thermal_profile_get() returns the
whole 32-bit value (0x041101), which matches none of the
HP_THERMAL_PROFILE_* values, so reading the platform profile always
fails with -EINVAL:

  platform_profile: Failed to get profile for handler hp-wmi

and /sys/firmware/acpi/platform_profile returns "Invalid argument".

The firmware's GTPS method (in the SSDT that defines \_SB.WMID) fills
byte 0 from the EC field GFCM (0-5), byte 1 with status flags (ONTB,
INBG, DPIN, PWDN, IBGE, MSFG) and byte 2 with 0x04. Setting a profile
already works: GFCM becomes 0, 1, 2 and 3 for performance, default, cool
and quiet.

Mask the value to its low byte. This also stops
thermal_profile_setup() from writing the status bytes back through
thermal_profile_set(tp) at probe time. That write was harmless on this
firmware, whose STPS method only reads byte 0, but it was not intended.
On firmware that already returns a zero-extended value the mask changes
nothing.

Tested on the OmniBook Ultra 14-kd0xxx: platform_profile reads
"balanced" instead of failing, and each profile reads back after being
set.

This patch was prepared with an AI coding assistant (Claude, by
Anthropic). It decompiled the ACPI tables, traced the WMI query, wrote
the change and this description, and ran the tests on my laptop under
my direction. I reviewed the change and the test results.

Signed-off-by: Samuel Wheeler <swheel33@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 0069af86800e..46c9a5a532ba 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2117,7 +2117,16 @@ static int platform_profile_omen_set(struct device *dev,
 
 static int thermal_profile_get(void)
 {
-	return hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
+	int tp = hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
+
+	if (tp < 0)
+		return tp;
+
+	/*
+	 * The profile is in the low byte. Some firmware (e.g. board 8EB4)
+	 * returns status flags and a constant in the upper bytes.
+	 */
+	return tp & 0xff;
 }
 
 static int thermal_profile_set(int thermal_profile)

-- 
2.56.0


