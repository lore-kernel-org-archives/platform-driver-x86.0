Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1FD30B521
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 18:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788028387; cv=none; b=iKIKqIqGdRe/VX9Ekwfo3tQj7reorbV4dcE8zMeh5vWm7u4U4FTsqqPhamNq2XLZg0HFUAF4OyhaaCSJmNnPSzeBxZHDaU6BBho+ZdZUH8dz1839wfj/rvFIosuttWs7lA3lULtFOCvXdStytHdqS7DYn574cA52tnuFnHuX89s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788028387; c=relaxed/simple;
	bh=Y7n8Jd+vU65M/f4cJXPLsgOJs3sP89cql7nnQNaY4TE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4y1LPbWdagzsIg1B1afKuFZw2kFcHPI5GFT/8U8MxbRVzOHnxxbT1fWagSMk5zCOcVvmy7cdOWHjScAe8vzLPkpDUcYWJct9tIaAiCd3F0JHjCCSGoddbf42AkNxHmI0ulbsAQb/3KbGy9UK1IPKX+E2VP1VI9sFV2tzHLEdp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L59eqZrK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L59eqZrK"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso11619965e9.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 11:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788028384; x=1788633184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9q77ZBna8uTSysxmt0Df+bgic8Xkh0Mfn0XxXlD/cDA=;
        b=L59eqZrKHgcRwv0cEgFaskAikglbFHP7c02+zqZv8Ou+3sVF/CxrEL1+H6UtgxXX/r
         udooaRS+OZiClrMv9uCaxJ97LXHKkVGzjJ3vTj9NtU4Tc8XtYlT53RmQz0dn0TEKDR3C
         jKel8LTekzbacnFr1AEQ4BUWG4SlDiMFiseMkIkYAkmDgNixZodwsICThsC1OFNHhcO4
         3Rz+DMNH5HfRKxDqTqD3mPrfFD0a3oprzydwt/wpKXCgmurFBn4a+Wco3gUF3GN5pKdw
         pdZvEP/b6eExlGwS277zVsZbykWN7qBwtKj5WkdO85ycj4jlCRMHMY74fJ1R2r2lZy0K
         RAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788028384; x=1788633184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9q77ZBna8uTSysxmt0Df+bgic8Xkh0Mfn0XxXlD/cDA=;
        b=m7jF5U6RA+ZMshqKv4mgpbPV6jQj1f1fOfG009B9dmxWOU/s1UWmOqqk9mn4Zf40xa
         xZSKJa1ZNIWM7EGSo0IrgqKspNW+o9zL584tTrImOxz8WjGF8nQBfhpHMLE34popxWQz
         i8KF8oaW5nkuVM0dbXHIosACFNkKM/pZkuv1bmeGk7cHNrcz4EHBXolujnt7BPYBCqtg
         u60/4GKqFV8RNLEWuOhkGattzFmot+at9yM5ljrEaFlnVW46+L2USGuLCCUvXIPU0Xpu
         7EFP7SEL/th9Pe9kXkWOEeQ5xUBAMDrD8cITgEQ1Q6cl85FE/1Zt8cE2dX3l91ZvBCzE
         Ts4Q==
X-Gm-Message-State: AFuF++nMPLIVczE65A27CPeKP86zCCALNJAmso4HjMWoP2b55jLQtYat
	Dcd9e6LNf0tZBwJuzCE2O9gz1siKl1KsFq8UYGtqDbnxklQW+aPWscn7
X-Gm-Gg: AR+sD10OAQza0ufl/zHdc8ri+XdotzAS8CouPe/gxjVYbqA9BnDsG4VvC/2u82dzOlX
	oRatKMR2bcRlliYKsn1gAYoWx1/MyTh0kck3LcGyMb6FqEilpf6xS6nxNtF5SeBp997kRu9P6zJ
	ha9I1Dh0KaU3IJgsZ7V6HbSJNHnzCoU2hACyT7QUDJpanadFkFzaubHaYMTC+qVhxXzGA78H+kw
	zCckl7LO4GzI0llRqjILn6Tzp17MB9EIP25FFs2pWc5hCu/CRxt0JiML1sesc7Qtr73cZCy/FE/
	qgsfFRanLPsvYvfKgRGRGQVmVm/mhVtwdi/vWv/H2Nup6rez7q5vhS3KK6llqrv1PBBvJ/lKwzf
	skBkZo3/fhLHppbM7l7pop2qbRapZ6/HlyomrO5Lw1vHAKNiE5mNCXocyt/I6OAGg7KHXipYNNT
	1mPOZBdZygQvs1OsoZWhZqKFfHbekVPjLZId1aphZAiOqpLIcHoIk/8fkL0Wq6U7vrefJqEvpKU
	p7gXZnAI4eTrkRjz8F6DWs=
X-Received: by 2002:a05:600c:a403:b0:49b:924e:9a28 with SMTP id 5b1f17b1804b1-49b924e9b14mr211361875e9.1.1788028383899;
        Sat, 29 Aug 2026 11:33:03 -0700 (PDT)
Received: from [192.168.1.11] ([148.252.146.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea6b814sm48682495e9.0.2026.08.29.11.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 11:33:03 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Sat, 29 Aug 2026 19:32:47 +0100
Subject: [PATCH 1/3] platform/surface: aggregator_registry: Remove sensors
 device for Surface Pro 11
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-surface-pro-11-aggregator-registry-fixes-v1-1-ebf5cca9d205@gmail.com>
References: <20260829-surface-pro-11-aggregator-registry-fixes-v1-0-ebf5cca9d205@gmail.com>
In-Reply-To: <20260829-surface-pro-11-aggregator-registry-fixes-v1-0-ebf5cca9d205@gmail.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788028380; l=993;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=Y7n8Jd+vU65M/f4cJXPLsgOJs3sP89cql7nnQNaY4TE=;
 b=7AWC53IxGJVuibJ88Di+p0XY9scJ0THKtYuhvWibXeX0SBavJdEtW/ucSb1gnRFPra2fmZuzs
 aAa3vm4fo8eB1QFNiBC6IOMk3MOyjUa78iLRsa/AX4/5ae+g0p+Y0uq
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

Remove ssam_node_hid_sam_sensors as this device is not present on
Surface Pro 11. This fixes a probe failure in dmesg:

surface_hid 01:15:01:06:00: unexpected descriptor length: got 0, expected 9
surface_hid 01:15:01:06:00: probe with driver surface_hid failed with error -71

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 drivers/platform/surface/surface_aggregator_registry.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index d37a7e4c6b02..82c2144e10ec 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -415,7 +415,6 @@ static const struct software_node *ssam_node_group_sp11[] = {
 	&ssam_node_hid_kip_penstash,
 	&ssam_node_hid_kip_touchpad,
 	&ssam_node_hid_kip_fwupd,
-	&ssam_node_hid_sam_sensors,
 	&ssam_node_kip_tablet_switch,
 	NULL,
 };

-- 
2.55.0

