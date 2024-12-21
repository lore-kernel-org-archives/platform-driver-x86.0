Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B889028366;
	Sat, 21 Dec 2024 05:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760799; cv=none; b=JiPnU3RKXw5pO3fzSVBFAWfkhDq0SAKcOUm7N3CdHs79qczeaMmeM54pPnCRrcCsDqiFmO7hB8ehkutnVI6OKbwls4BobCFuIQh8jPf2w4B2sbw3HwOSeUPvw/k+8sJZ+EqQNlJWL/99mmwoSi8WIJt9PYElBt3kN1qp35x7SsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760799; c=relaxed/simple;
	bh=4NNzJCS6dqZubCbXKxy5ZPIrkzp2CGi7vV0ZMorGyLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2eqW9596lyBM8AvTxgdhB40IZ+Wsr7cGQE1wcpuFQmKj1ZRLdUq8v8ypKROqcToSrpyVDcilQvFuFVkObH2LyZ255rPVs9JoXLAvNkt5hs0lN9oCFukJ0XMWaTDcET8QruvGFFEhu22QYN0PUJwmX63m4F2nPWHHjwi7aLDNEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIzHx8zo; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIzHx8zo"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e460717039fso2062614276.0;
        Fri, 20 Dec 2024 21:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760797; x=1735365597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=679ZZs5M5yhRZZVx57ba0x+NupoeJc1WiRduiJBWPv4=;
        b=MIzHx8zoay4Kx3zdRg17HSFHPpg69mbvDU891FDaUweky2shrXD0/mVgcHfUACD44b
         KzqWAQEjfTJ2xvppQn8/lotd2FvnPp+ZVCg9jVZmg79DlAK348ZWcDJN0oSDGucw3WDb
         H7VLA8pXKopIRLsU41VRD0PKlZDvxA/olXkSFEfHHPk1i5Cqrq586QDvgxUbLxaXzPH2
         3OYqHChg+2kCJY3FjGAGh9vBCKtWE8G79rg5QVIFFQroKkhEZfkLcg3PTapqHeEfnFrb
         ixCrz4sORMKaV7m99Pvis0UFxy38W9x5rJwlMevMCKANx8QvslxLkWBHi9nNI2mz8Zvq
         SeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760797; x=1735365597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=679ZZs5M5yhRZZVx57ba0x+NupoeJc1WiRduiJBWPv4=;
        b=CjJnVhZuIPFsAZWnUCd2uSgO0EeK3Yu7U3oS8beP/ysyXqS5jfnRp+IdMdaohAZpex
         UQcSnDHz1Ht+Y8V2n4h7ljykcY3LrdvSYpqFbwBndh2eDxL5+cqN/q6bVcyFzBDoiNh7
         +G9oxbFK6WV/U+opk+6MzRNoUJHvaOOF5nBLWdoaaVxPbkSYP2t+yPcJzzZqN76QZ9GQ
         SPZM/1Ln2kI5+ySgoWg0O1/pb+Vbkvq7rFp1KDsgDwp90xjHpLXJWpuw7qUO2OIX2Ntw
         IiekyVlSgFXo9O7q9TX5USUboDPSKeeZhJL6xZmzVqta/bVrsXe8skgyH6o7vG4oeUP9
         F7aw==
X-Forwarded-Encrypted: i=1; AJvYcCVj5IuAC/vJ8z2QoWvdNkZ0JVDY8cvY6MirIgdx4uIx8xA40T3cvMAB8vDPOguFvhH0w2hrHd6fZ7QNenQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/BOHq//QzZRv3qaZFdLMQW3Zr46jAio0m2Dl7nPqkTtdPoayr
	UxojcOEbAntGET5u3lQLO2vYcTmoDVDkuKvNg3Z2GFsiaMNqIFToZICAuQ==
X-Gm-Gg: ASbGncs/9WlP5mk4Etzo/XDV+Ws/HVMzvQSyxjZobpF0+BywIeXSTR4OHc82dQhv6JV
	BvAoojur+y1FCIKmeb9B/fyMCtWDua5+l5BPMXn5sNzcZP18x74U9CQfY6PlnJOFvpdPfwUx20a
	3+8mxsm0DXvNY0AJ5FmoMc9+iE+3Z4QG/gK66W3mmILI8/JRAfUIwQEIVX5jYto5a+FXewWLpX2
	rf3fPrIboY/GoYLknZ1juXYC8Nc0goeO0hVa0Jr1SSUACRRvjxxsXT4fElQnupg
X-Google-Smtp-Source: AGHT+IErsKD0rEqeBakNCLsqSS9COS4I4rTyms3NtiF8Gm2Ws/eqmQo4PiAVmWU4CNyQdZhL+EFe3A==
X-Received: by 2002:a05:690c:fd2:b0:6ef:7290:d478 with SMTP id 00721157ae682-6f3f823f1e2mr41956647b3.40.1734760796749;
        Fri, 20 Dec 2024 21:59:56 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.21.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 21:59:56 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 03/20] alienware-wmi: Modify parse_rgb() signature
Date: Sat, 21 Dec 2024 00:59:00 -0500
Message-ID: <20241221055917.10555-4-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221055917.10555-1-kuurtb@gmail.com>
References: <20241221055917.10555-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

parse_rgb() now takes struct color_platform instead of struct
platform_zone to support upcoming refactor.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index c5ad0f95c442..273ce9b10765 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -434,7 +434,7 @@ static u8 global_brightness;
 /*
  * Helpers used for zone control
  */
-static int parse_rgb(const char *buf, struct platform_zone *zone)
+static int parse_rgb(const char *buf, struct color_platform *colors)
 {
 	long unsigned int rgb;
 	int ret;
@@ -454,7 +454,7 @@ static int parse_rgb(const char *buf, struct platform_zone *zone)
 	repackager.package = rgb & 0x0f0f0f0f;
 	pr_debug("alienware-wmi: r: %d g:%d b: %d\n",
 		 repackager.cp.red, repackager.cp.green, repackager.cp.blue);
-	zone->colors = repackager.cp;
+	*colors = repackager.cp;
 	return 0;
 }
 
@@ -538,7 +538,7 @@ static ssize_t zone_set(struct device *dev, struct device_attribute *attr,
 		pr_err("alienware-wmi: invalid target zone\n");
 		return 1;
 	}
-	ret = parse_rgb(buf, target_zone);
+	ret = parse_rgb(buf, &target_zone->colors);
 	if (ret)
 		return ret;
 	ret = alienware_update_led(target_zone);
-- 
2.47.1

