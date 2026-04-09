Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47069258EE1
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Apr 2026 03:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775706242; cv=none; b=W+EMYE/iuVdmHqy71wJBZ5SgWp8tfdTZPCK3iK9KkZBp2u3/rmpe7fU9gShITHO3mNBymY31l6Kfr5eDx275fUmIvED8Ca8Jy3rqMFtXbiUd3tQ8MgdlqrK1lY93e1PWDbW5RPkPqMgxB2ZRCFPoioFEUmwWUWgg5v3rsTFobvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775706242; c=relaxed/simple;
	bh=SP0OnbNRHhyJrckrvomuAzJzB+x6l7giCTW2+w8sSyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HOLE3dFyEEl5LPeDKYstgVco/fyoZqrvbQVY2wj4wxFzC6bBPgD2gQDuKzPgAn7WyBJOuzQH6+GgdZyGlniuEaUx8qpOK+f9IGVgDKDyNYTtIIXVqZq0bDUbtYy5xEIZX2aNQR6/BXY8+A7oNi0NmjkV8BhkA7RY1ZJBlawbMV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAi2ZEse; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAi2ZEse"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b2429f98d0so2992615ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Apr 2026 20:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775706240; x=1776311040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PgMt0qw0VR15K82Eu6IygRQmCQK8o8ppv3m5J4WJD8M=;
        b=mAi2ZEseNEg9WoWQYzLYAPcTZlovLSfToGXpGfS1w6QcdlJ/WU0bnL7TIXoHkc9Mzo
         8NmSHd0SEfv8EP4X9jCcAYV99obZphV1a5DRDDkQNptRdCsEC0NkQQtpQM8aZ/Ym/AKL
         NBvBY/y1AxbQFHki7LP/BxEL2FW7CYM+cqbjwb3l6wSEqeR5Gm0HO6144Vo9gA9Xu2te
         wqNqAMdUWdciH0KRLkcS+Pqi17ar5vTY1JFZlr2ZkUkS4UWPhpUVIyXeMsx78LO7SEBU
         mG4RtifKaxt/5H1xV9nss1pulUoGBw6oNkl0WNgtvsddfvGEWkkitjKjPR+YvaeCo2ru
         k8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775706240; x=1776311040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgMt0qw0VR15K82Eu6IygRQmCQK8o8ppv3m5J4WJD8M=;
        b=Es0vRCh1xIQiTBtDfXXYeegIHfSbz8Pa/b2U65baDpuFV45y1lpi61S+Bjcedmgkji
         oN2Z9wQeSlDVZTXWlrCqYUN6v4ACAiOo04W08KSQs4/2BkoSF76Vqar+E43XzpJXTmwT
         X6j/ttxxiMqEN7n9U8UQzVUwxh3I2zw49c1SOLvuxlj1pNprwsTNdTw4OFrTlaWex3Jz
         ccWbQ4dVWbbwSrT3nD9txrVun+CywKszdNxtW4MEJ1i/6kxfmJnpnQW4AgNK36ei4Q9w
         VLCxauRKJmBzISp9WqLPITLlFMYFMgM4HMHwX/MbDFr76eCjIfdpsU4GcqNQf0S2BLHD
         J2XQ==
X-Gm-Message-State: AOJu0YzRO2KfbysgrYr3Adn+/oniYFefmursFM8lwQFdn6dCrogC4hEC
	qgCEgNuCBN+NdvRph1GBU6SVy5enbN/aTl8dDBksHMZhpBAoc15uVatK
X-Gm-Gg: AeBDietahzb8CYSpQuq4yKjNjskxoS1wYL5S5M5yCougImgx+8L59/Q3LsOMAZu6VU2
	q5XGjNJLASZ1mrbEIVJWvZp0lCwdraK+ICsOhUZMraUbkXJe12+rhEwzfHsKG5dp1u6m852Xpgt
	Aqb6aifnUvQkYZw0ERf8BXsqgMHJWRgxHMcRy3kZzt8h3+1sArJ9ZPQmdgU9P/tHMYOIB1Z4gIY
	tANHMhwHcmAIoA3B2GyqzJ6ZvL4uyp/F2YJISkg+Hz8g2u7Q+x2Fo43kdIzK5R/nAb98dYziWxy
	EHVr8bwGyPyFDM7RHxSLBUpJu0+JYMWotE/FbPpyJP26VV7xuxOo+sfWv8HM2Tf5u8RwznKdTmq
	qobuRNJ2zQLTaxCv1PZKLka3gsXBkpiKi+p+KeEhmVk0T55xdsYSJSsLyq0nMgVVHZAnYPV5Ieu
	HKaH/2gO8cBnlK/UF8mAKW67IOxeXs6kQHHIEseVgoOvpM0BxdEfbDS3EhDekc3wkGhBlD
X-Received: by 2002:a17:903:1aa3:b0:2b2:4e5a:9473 with SMTP id d9443c01a7336-2b2c73abb8fmr19443015ad.21.1775706240566;
        Wed, 08 Apr 2026 20:44:00 -0700 (PDT)
Received: from tomriddle.lan ([2406:2d40:64ea:4810:e3d7:bcdc:3449:4b6f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274979525sm266420275ad.45.2026.04.08.20.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 20:44:00 -0700 (PDT)
From: Oliver White <oliverjwhite07@gmail.com>
To: luzmaximilian@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oliver White <oliverjwhite07@gmail.com>
Subject: [PATCH] platform/surface: aggregator_registry: omit battery & AC nodes on Surface Laptop 7
Date: Thu,  9 Apr 2026 15:43:47 +1200
Message-ID: <20260409034347.17381-1-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Surface Laptop 7 exposes battery and AC status via Qualcomm PMIC GLINK
qcom_battmgr. Registering the standard SSAM battery and AC client
devices on this platform causes duplicate power-supply devices to
appear.

Drop the SSAM battery and AC nodes from the Surface Laptop 7 registry
group so that only the qcom_battmgr power supplies are instantiated.

Fixes: b27622f13172 ("platform/surface: Add OF support")
Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
---
 drivers/platform/surface/surface_aggregator_registry.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 0599d5adf02e..f0881edfb616 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -295,8 +295,6 @@ static const struct software_node *ssam_node_group_sl6[] = {
 /* Devices for Surface Laptop 7. */
 static const struct software_node *ssam_node_group_sl7[] = {
 	&ssam_node_root,
-	&ssam_node_bat_ac,
-	&ssam_node_bat_main,
 	&ssam_node_tmp_perf_profile_with_fan,
 	&ssam_node_fan_speed,
 	&ssam_node_hid_sam_keyboard,
-- 
2.51.0

