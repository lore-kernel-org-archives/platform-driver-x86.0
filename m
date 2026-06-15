Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1260F3E4C98
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 11:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781522959; cv=none; b=tzk1U2n2PGCFMU/k1okQpooCu9BwSeaFy3+etIV5Qr6HCiG1w/vcj4RHgXnXSGUhj29/zhpN4twPKqcGFKq9lV/vtXDR2R7YXbchdM9W5khCS5s7xH4hwVbKLRI7m7gfH3RhEAsrKIMTNj9HVg8dc+hsPVedo43zXvi7YNe/pW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781522959; c=relaxed/simple;
	bh=UQ4RJkysZsp/NjQ1wjjl8LOlU5lkcrrCrCgj1cHkdi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rhfgPuUdR4yvhtlreIEDvZEaJE5OhXTPcER7VRgrP/aETagj79JiiQHUykpdf+eElIBYufw5lJWKb5QhWNeaVNvaW4IhkK7V8QLvBxJO9/b7HyyCX/PyicCeP6oxHTH5Mje0XSWkJd9QOYt7SJdB8ZbSK1U1pVsoGu6MGDDfAr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=R0D6gZ2U; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="R0D6gZ2U"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso2214823f8f.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 04:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781522956; x=1782127756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MLeV5hMlWOnRvm55nac+sxk9yFFb2SBgsfN3o+xrZD0=;
        b=R0D6gZ2UBq5I0AuiCjDAxSOxejCxspAqcB2YzCFg9fxmVwe+sY9+xg9ch5NvcRB97c
         qC0svgAgdtcRplag7v1iBTgrznKBNzN4jTqaR5EQMM3RzesoykfR3YKSh0c6i8kIx3bX
         e63HXXz5soieDLI7rT9g/EC1jtJjF8U0y5yIhnbyfcnRlX1V4YBkqp+hySVDZlKr1V0x
         0ZhLr/2aBHaP98dHm2Pi4nxAgXz7Rqiogbbw9kj5y1zE1269HRJOAXB56NfVJfntONep
         +xZT1Wp784Vcp0qKx144MuidmmagbxPuSo0XdgATTfWZvlAfxNSm8vbqlce+9qXc1V6B
         obzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781522956; x=1782127756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLeV5hMlWOnRvm55nac+sxk9yFFb2SBgsfN3o+xrZD0=;
        b=LfP18EWBLp1CVHasPZPgGGV0bIj80sNNfeO03wXe6MmFJdIb8YUyjMvzbbfQGrgsmu
         UeUhQiG/0GC2EzWXXPK6O4c6SSILvVIQJ8VlOjJksxK1wEAH14FdepAREs4jtUfLda52
         byD4VesRsH61iWUpyEv9LDZ5u243XhF6OXvE3KzSDfDy9Lg43rhieUMFa7FhJWjD5M8r
         RtHzgQJzCQMnrg5/1sPbwRF/4jHfO6+vMJeyhI4SFUFbW8bYFiWJq6I1Pk4lYCeFEDSw
         Rm7uUDlshAXl3/bpcJ3ln+eaZ3NnV+jufY1e+fxp3eX3JKiocdviE4Ym/ToVNFqWJeBh
         2mbw==
X-Gm-Message-State: AOJu0YxPFQeHGCDUIzp7d8FarfOmx6+HUgFZHFNRRrXElcFydUuagviV
	sGu5YEN+vCcVztX8V1zc7fAHBRVz/5kT9hJW7Sjg7JdloQ2bsnjbcKyJiivdC6p1ENU=
X-Gm-Gg: Acq92OGenXabWT57UdfqxWkDAbE/qUmjXNPtq+Ezth+zkFgYnDR1bcqahlJS5nco9qT
	NptfU9gWwwZWInfYXRq+6UcC677lwHlmBEntl5bw+c7jO+SGKIikmkglE6E8m4ZSIuE9dsK0VP7
	+HuPJT1lXZo6BkrMzMdZKqQvE2/+WygHXt8lO5JXLOSmP9BGCMiA6z/fR1HvOAtD8I16eyQ6bYv
	IDTBTfMTHQwkNdZfOA6i4W6LwR8dDbvMElXzUb71KVCiDKto+fyUfVykcBhAJ8xMz7o/AXZXAeH
	DxKa4CbwpzyJD9vE7q4jXM1ZNkXP7QSdYSkREKBsDttCyPEaiJkE92cNVbOhMCRegMu9cMF46z5
	Ox5ZkRQuuuwLZbmYx/8cWFO/PpFCEEWlXfDnW2IyvPHC0uWKW62LE0AWrBvYGIqv0Gjv+Wqp58r
	PHlofECZrI051bpJAFJLgl/iOooiN0
X-Received: by 2002:adf:e006:0:10b0:45f:f142:d55d with SMTP id ffacd0b85a97d-4606dbad0dfmr12749816f8f.39.1781522956163;
        Mon, 15 Jun 2026 04:29:16 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4606f2c473bsm37828794f8f.28.2026.06.15.04.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:29:15 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] platform/surface: aggregator: Consistently define ssam_device_ids using named initializers
Date: Mon, 15 Jun 2026 13:28:59 +0200
Message-ID:  <4421c8c959452d8a717ebc7cc905ad9c2912680c.1781522576.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3097; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=UQ4RJkysZsp/NjQ1wjjl8LOlU5lkcrrCrCgj1cHkdi0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqL+IA0qZJErvmplKKSqM/31QGeT3Oh2pBLeDHx 1WnY5Qvq3WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCai/iAAAKCRCPgPtYfRL+ Tv4IB/9Hyk8wJzgqpo1Niy53w39l+SB4DWZzxHciZndlMyl/liEOves2tL9aZRFvw0ul5R8oAG5 M0iz80LVW2O0kWd/UfViaebTGTJicT7ufrsY5D5Mlhs2CFZbEDngjJYgSSfpQWyK8g+6dCEV2on GDPuZjwNP4Tr2PZ9TwASuZiavmwjUxxt1LONke1SF6LUYpqFSOdxiRIs4lKib7d0vD7y4mBWD5i SRPix2g6607I32g1k8q5pVGL/xnPoljk5gI48Zt43EgqwXAhOG9dCu0W4N2+OmIKTrIMv6cQWxa 9hEsws8mrEm5KLoELUpQWcG+p0m8MXJ44f2hZPQ+kYkJ6bQX
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The .driver_data member of the the two struct ssam_device_id arrays were
initialized by list expressions. This isn't easily readable if you don't
work with the Surface System Aggregator core regularily. Using named
initializers is more explicit and thus easier to parse and also more
robust to changes of the struct definition. This robustness is relevant
for a planned change to struct ssam_device_id replacing .driver_data
by an anonymous union.

This change doesn't introduce changes to the compiled ssam_device_id
arrays.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

the mentioned change to ssam_device_id is similar to
https://lore.kernel.org/all/cover.1779878004.git.u.kleine-koenig@baylibre.com/.

That allows to get rid of the casts in these two drivers and thus
benefits a bit more of the (admittedly weak) type safety of C.

But IMHO the improved readability alone also justifies this change.

Best regards
uwe

 drivers/platform/surface/surface_aggregator_hub.c      | 9 +++++++--
 drivers/platform/surface/surface_aggregator_tabletsw.c | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/surface/surface_aggregator_hub.c b/drivers/platform/surface/surface_aggregator_hub.c
index 8b8b80228c14..541e9180f976 100644
--- a/drivers/platform/surface/surface_aggregator_hub.c
+++ b/drivers/platform/surface/surface_aggregator_hub.c
@@ -348,8 +348,13 @@ static const struct ssam_hub_desc kip_hub = {
 /* -- Driver registration. -------------------------------------------------- */
 
 static const struct ssam_device_id ssam_hub_match[] = {
-	{ SSAM_VDEV(HUB, SAM, SSAM_SSH_TC_KIP, 0x00), (unsigned long)&kip_hub  },
-	{ SSAM_VDEV(HUB, SAM, SSAM_SSH_TC_BAS, 0x00), (unsigned long)&base_hub },
+	{
+		SSAM_VDEV(HUB, SAM, SSAM_SSH_TC_KIP, 0x00),
+		.driver_data = (unsigned long)&kip_hub,
+	}, {
+		SSAM_VDEV(HUB, SAM, SSAM_SSH_TC_BAS, 0x00),
+		.driver_data = (unsigned long)&base_hub,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(ssam, ssam_hub_match);
diff --git a/drivers/platform/surface/surface_aggregator_tabletsw.c b/drivers/platform/surface/surface_aggregator_tabletsw.c
index ffa36ed92897..13031c329553 100644
--- a/drivers/platform/surface/surface_aggregator_tabletsw.c
+++ b/drivers/platform/surface/surface_aggregator_tabletsw.c
@@ -622,8 +622,13 @@ static const struct ssam_tablet_sw_desc ssam_pos_sw_desc = {
 /* -- Driver registration. -------------------------------------------------- */
 
 static const struct ssam_device_id ssam_tablet_sw_match[] = {
-	{ SSAM_SDEV(KIP, SAM, 0x00, 0x01), (unsigned long)&ssam_kip_sw_desc },
-	{ SSAM_SDEV(POS, SAM, 0x00, 0x01), (unsigned long)&ssam_pos_sw_desc },
+	{
+		SSAM_SDEV(KIP, SAM, 0x00, 0x01),
+		.driver_data = (unsigned long)&ssam_kip_sw_desc,
+	}, {
+		SSAM_SDEV(POS, SAM, 0x00, 0x01),
+		.driver_data = (unsigned long)&ssam_pos_sw_desc,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(ssam, ssam_tablet_sw_match);

base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
-- 
2.47.3

