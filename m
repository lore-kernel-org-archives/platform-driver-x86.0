Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFA33932E6
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 18:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785954666; cv=none; b=rODrh+P5zhxf92GL8rUUU8ejbX2uX1d37gnUbiX4ovCvBbbepfP75/c61m+MyIjo6nCi7oOEwbQRAyxV6ZOPdVbFmXohYJz0l3coNXnPoHdO1ap1osoWFZZUUvDQlFfblophVPLfm1edZbYjneactZDjKbDufvjDpBvfPrhLGvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785954666; c=relaxed/simple;
	bh=3rWyK6AlvgostRnVz9GwSPphggHYUgLfDBVRFhMKoSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AkIwQH6y4+6yOjyPUdJpMH/7Zs0TVs3KFX8jkUJSY1HI/yBYC9iEYjRpQVcz1PG1RiJ//wLdVblUvCE+4Il43OCAspBNOtpdKyBiXjac/hG8lLEW/v7KN2MCjZ/F5LMx13euCwwTVYBOrqmTFuDMJ6loCRSaRLor6rZJNdRP/JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aletheia.io; spf=pass smtp.mailfrom=digital-apathy.net; dkim=pass (2048-bit key) header.d=digital-apathy-net.20251104.gappssmtp.com header.i=@digital-apathy-net.20251104.gappssmtp.com header.b=g0MrZNvc; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aletheia.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digital-apathy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digital-apathy-net.20251104.gappssmtp.com header.i=@digital-apathy-net.20251104.gappssmtp.com header.b="g0MrZNvc"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so1599845a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Aug 2026 11:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=digital-apathy-net.20251104.gappssmtp.com; s=20251104; t=1785954665; x=1786559465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WbPskQtCDr+QZkmH/ZDR1vwEU9SPxy6wC7TQRLUckl4=;
        b=g0MrZNvck08WvcCeQQUrN2w/eVjjlsI6NdxHCkZv3bvbggC10koN/TqxoSgEnKxfTa
         mJpduOCoMzxg0wZYKyHF8U0VYhXavnz/Rts1WKUg2QbgsI7svaQ6+7FjP11UjBcCjc4u
         xWD+X3jf5Dik7wLpQlqm/L/QN9ikMShQxIqluYTiSDHKXfi5x2Fm0Q5gTYzLbt6JUTlK
         4LGdNGAy7TrR53itJl2GeGC2yGCPK0K8q5mOmQPw9dX015fYiNeaSIfKzkXnIWoK+8E2
         84vYE/juWx9K7hEktvG+oIGYBxZpTdPGcSkZ9JKsNxaQJ4A3FkDLOXHUEbgnHCYv3X0O
         WQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785954665; x=1786559465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WbPskQtCDr+QZkmH/ZDR1vwEU9SPxy6wC7TQRLUckl4=;
        b=cMo0xEmY9dn2YnAPLP89F7pVThrTRrmzA8L1FDJ27bGZfFsm8u2CRV5OeQuVticauo
         0v0/zRtXr8Qb5JWu9ABUd6s5g1KzVIJRONWfTwK1I2Idcjzq1hsK2mmdlGANdpXVAZ2j
         KYIr0x8TOSVFy4zgqVasXv6ptQtMBjijBmt6x2r/+vq90qXRDONs2W5+1eolbprgMZ4M
         zTKMzJrLUIUgCU1YGGq2k0AjQacp9taAabJCmeGFQL5c5mRpPa5H/S7hx9SxUdRaCDBK
         ckvU5cpWk+pPqzw9HD3EjRPDqa5+9ziGaRYi2sNXcQ2OilvgHGO0WOrZwaf6Gs8/R7cG
         c6DA==
X-Forwarded-Encrypted: i=1; AHgh+Rqqf/GoXsOO/khyxvDBM/kGRBdyv656sXBaWZ4QmxGOIm4DB8sIZJe2jhvLwSIqRukN0rL01LZNQx2AFz5hGPRGbIQL@vger.kernel.org
X-Gm-Message-State: AOJu0YyhTilFeQap4H/tCxa4X8Wt8dZ2PnpjpQSoqFmJ1r8scVwxckE/
	33AiXhBgzetgDbdfNipD/YJam7Hv8kqhQIzOMgfGyZX141cTps05oE/cJtdbiiz819xGqwXTXXx
	l5b7sGw4=
X-Gm-Gg: AR+sD13d2CUA5N/cPm1LYWRJk+M0VZk8HBu450Z/nN2x0iIMNz2dsCDj+IHyun6JDlO
	cof3uOZLRwMSjFyhbUrGwdcnllvO0yR+6eHvpydwLFOeFPjf+8dBxdSBKbdig8Ca1BjBjySq2j8
	5lfL7isdloERwDks5elcD0KreTngcjNMIvdH1lfAQ9i+6QafffPMTutP5BId7U7nqzKcDrze74q
	YMPF3Y/dBqnqMj5QLGebWHNKPo8yfJbP+08ZjanzNELPhq8pBqDN2vmb4tEnofXmTwWINPY51hl
	WbYLk7OcVexfdR2ZxcJYgVg3OhCY/8Xrh9r/9E3LKt9gb1Wxj3xNxB3zDRIl7EZG2yyjh4Zs/Ja
	vS6ZFzAccPW8BjVyOoz9l2nViudtvtAmG9s+CXxg53CloebsEi85YmCEnWh0k7dmXE8bCKdqBFh
	K/Lowal/knbKNuM4cEhYFFZXAXDM0CWG08/Hi22NK2f9fkJlFjJJpNM2cmbj0=
X-Received: by 2002:a17:90b:1809:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3903c583c08mr8108934a91.9.1785954664685;
        Wed, 05 Aug 2026 11:31:04 -0700 (PDT)
Received: from x2-mini.local ([2600:8801:480:c2:a8ce:5a69:d76f:4e32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca63ce12sm19839409c88.5.2026.08.05.11.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:31:04 -0700 (PDT)
From: Jeff Hagadorn <jeff@aletheia.io>
To: Antheas Kapenekakis <lkml@antheas.dev>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeff Hagadorn <jeff@aletheia.io>
Subject: [PATCH] platform/x86: oxpec: Add support for OneXPlayer X2 Mini Pro
Date: Wed,  5 Aug 2026 11:31:02 -0700
Message-ID: <20260805183102.38408-1-jeff@aletheia.io>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OneXPlayer X2 Mini Pro is a new Strix Halo handheld. It ships the same
system board as the OneXPlayer APEX and uses the same registers as the
OneXPlayer Fly devices. Add a quirk for it to the oxpec driver.

Signed-off-by: Jeff Hagadorn <jeff@aletheia.io>
---
 drivers/platform/x86/oxpec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 99c0dfc..34bb17f 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -289,6 +289,13 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = (void *)oxp_x1,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X2Mini PRO"),
+		},
+		.driver_data = (void *)oxp_fly,
+	},
 	{},
 };
 
-- 
2.55.0

base-commit: aca39607c1734ed976fdd65deb75b3555a5a0326
