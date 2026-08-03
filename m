Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF4A345EAE
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 22:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795384; cv=none; b=J5AmwZA6Is3MNcWRv0RZF2+wdLJeTPCeZrr3mS5c5rAT67phx5MTj4VbpuWyXEwIZb3THwh2KVZmUhUXTsvok7417vpUahknKrbh/aJX70TJZZvL/D6ZhVTnFhqqYJSwx3B8I95KEeifpZpftuk1ewOPjl3LeHlE/BqQ4dCxhvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795384; c=relaxed/simple;
	bh=zSTDonIyBsR3WqojOzXln4HA3bKn7fqzEMx8iWnncMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1rSBcFSJ+GDIm1S1npcakXkRq3VBCzD3uK04j7jxs3AiwAYwgroz/tW9dla0DWHUZu8WZIuH/7louy6rybDtjEty5skla715L94TsPL56bbW/+UU+6Zh2Nw5eebCqUbqzvIJFHTK9oEQ+7+8UZit2e8zYCHeSIJjhoK/CeNcQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2VGZe+E; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2VGZe+E"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2809056a91.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2026 15:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795382; x=1786400182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPAQpOydhVH6LbG4fSXhvyUlk2qXWOQA9jkrLqZQMCI=;
        b=Z2VGZe+EXmWb/UElNyHc7clTzFJ4klD4DWiShD4RN6VAFyUBGMB/AD0WLHp3xGBESk
         l7eO3R8kDiMtsahbG0B6OHj7YmqxW1PzEe3UlsTfpRDWt7lQJTIPqI90FJXhriDzRhsJ
         oyg2fZdeDBZsc3cewehF6c7725fZ8T1PcxyxOXOJPrkK9ftEJdviHIOC+2lhBlJRP3WI
         ReMlM3ofSNnMhpeBbiVREZp9Jc+kZwa088sPRI3d6qenOW7IYNzGcUcUKRzYr+gOIoqu
         GBgH5GR00jMeqUrAJ94J0qD/t1bfJebZBYd0n1RqvKrE1sNm91vnXjpKVEzmFIp3qNw1
         RGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795382; x=1786400182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BPAQpOydhVH6LbG4fSXhvyUlk2qXWOQA9jkrLqZQMCI=;
        b=D+v0d7RBTLhlgnZiWYfuII/l8mRGW2l31Fep6+HYPZTVN/RLeQmCnqDSIkPk42LH8B
         1P8jYoB8flQgfXpunGEBWwBj/5K2z7Me1WCTBM75DJOuQ29djqL3gv5AZXI07NJtB88F
         tWaBln1hzOVeCO4bSyLliR10T66GFQS9gnp3Qko4JS95/dTD+ShEqgaiDiGIhjTvRbOd
         wTM6juvXwV1VZdN5ab3QciIH1BzWLiBny93dVaAczCna+yRbqadLnfETFLK7K06r+VE7
         5FPnYGYQdCXI86C9fMQB7vVwUV9/zhQ6J+LJg3XN+IIL9skYCpiNOmHoXXgdZhg09Euv
         CZNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8XSfKUqseu9qy6tPOnxcR0ROfxkBKxF0ve9VlkC/edmZrfxngw5GvTB4awPIh2cWt/857KVesAZv3cPhnf6Ug7tk1@vger.kernel.org
X-Gm-Message-State: AOJu0YzE9i5giBcmOE3NKRCna9Sot4Xa2zNRQB+wpDcnKE/NMhriIg8Z
	v7lpmo95dDXAiu4Zx+7lPgOVHRJTr71U9xd6ReZtsS7gohtnB+5ZG6vT
X-Gm-Gg: AR+sD10NFyHbKPlFXs3QS2+iWBzqHnyJG+O8aRkJs922r8AR7CoDYXns6Xx2t+9QntE
	0GycypkburkzSdWW4TvV8F9E2T6sKnLJKsgblbuJoi56LOaj+IY2QUpz4cf+JrKtZ32bJ2m9T3F
	LSM47FMNB8PEpwbTDPRI7hL5UQ1GURYVvcedScSsE0UEmwpiq1xngtFgGVYYJuQ9bbggHdmeZhR
	vJCJkYuUrNcVv6Fa6zoLuC9hgFx4QclBo1VRdzEeuxg1LCCNOi9LritTN4dJ2beCm45NvbPdayI
	1PZcqlxmvSL2kX/O6I1Thwioj6Ozchki+Y4IpuZ4gIMxUemR8Yh6ngEzV5cGP2tMLRStvyQDwad
	OeyO7M5mfrwWnZ6CeEtyq3j5p9C9772SiEOdjSeaelKSn8LxwJa26kSjoUURu0dusfE/m9qayUx
	rn9wutWj7891G8KPojRSTHapFjWyWpGPrvu4B7lmgBP9vH333eHKfkIYCgliwdxWZGIaE35+uxP
	8KpF+Gqj/Nuel5JOTozmt9ytkNhwv4N37XkJDxo8g==
X-Received: by 2002:a17:90b:2b86:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-38fbc3f7e4emr11504598a91.2.1785795382006;
        Mon, 03 Aug 2026 15:16:22 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm38685666c88.1.2026.08.03.15.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:16:21 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: lkml@antheas.dev
Cc: W_Armin@gmx.de,
	corbet@lwn.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	kuurtb@gmail.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Subject: [PATCH 2/6] platform/x86: msi-wmi-platform: fix: Remove unused err
Date: Mon,  3 Aug 2026 15:16:10 -0700
Message-ID: <20260803221614.59324-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803221614.59324-1-derekjohn.clark@gmail.com>
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msi_wmi_platform_profile_setup() declares int err and leaves it
unintitialized, then returns PTR_ERR_OR_ZERO. Remove the unused
variable.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/msi-wmi-platform.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index 33acd448f674..2439b4f0001b 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -1422,16 +1422,12 @@ static int msi_wmi_platform_init(struct msi_wmi_platform_data *data)
 
 static int msi_wmi_platform_profile_setup(struct msi_wmi_platform_data *data)
 {
-	int err;
-
 	if (!data->quirks->shift_mode)
 		return 0;
 
 	data->ppdev = devm_platform_profile_register(
 		&data->wdev->dev, "msi-wmi-platform", data,
 		&msi_wmi_platform_profile_ops);
-	if (err)
-		return err;
 
 	return PTR_ERR_OR_ZERO(data->ppdev);
 }
-- 
2.55.0

