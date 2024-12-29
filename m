Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B84D199249;
	Sun, 29 Dec 2024 19:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501617; cv=none; b=E0fqX0EGpPpiCbGVp3KySp6nyOunADUwIaULF3hpwFSHqq9vLMYbl8Y+45AFa94VzvuMxZR9v2wf1t0fo2x8fCCn9vyVI0y11dWEke3vq8vIr1ATuLEzt62YjJyuVcGSNjbgXJv1bBOL2kkdcFfN3Lp2w5a0DlfuFc72h+uWXFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501617; c=relaxed/simple;
	bh=GKJppKxQr9095jG4XrzfmDaQDqXnwWfs1sApouGayiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UNkZe70KsR9pNmhPZOzyTKawoY9kKA+cig7wm+Bqd+S6yda+g6TFopW+yqVAqbIpbU6lCP77IWVtRiyXA4dKZ5Bi4BFPX2+zutKtRRQZE6VTZPNOCTGuMNKmnOUZ2DENgeHshqnHfXC/b0vlcHTpRxcYyyKUecH1OELA6dWwh+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0VXXkDs; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0VXXkDs"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85c662ebbc3so1276889241.0;
        Sun, 29 Dec 2024 11:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501615; x=1736106415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+L4gSKrHL6ytx2INvMPs+4ZbJgOi5NCKXXDIXm5o8U=;
        b=B0VXXkDsObvV0er4+hJ2lSrQNbJqVgMBBjk+EkCy9SzE8cbFfu3umdb2VrWKs/oYfM
         u5arQP1BouNuOmO5cPHmlfV60PialWstW+SU5lkrsOwza5Uiul3gqJueA/NtcA51ITYC
         v1yDS4mYXWd9uhKHqVqcQD3zafmH3Uzo7iia4pZHcyP4kafFdAegPS7PbsJaKNzQUrXy
         hauU9e1nOwfQ2+9kzK83AcasHJZoZN+D68I6Tff+h9oJvQDf+1G9bgAjaosZMQFTujQr
         lZHcPUKujOj2VpXuVRBVD8WHtboGMiwn47wt/k5JU/5alGn0H6UzV1vVFGaiio0eqyN5
         Z4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501615; x=1736106415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+L4gSKrHL6ytx2INvMPs+4ZbJgOi5NCKXXDIXm5o8U=;
        b=t3uhVODrLDJyRW1oEje8fkc4CLfIH0j8pLhuPFDz5bTRfDKOsJfy859UgNmQQuJGzH
         d7DEvhdxujqZvbFzazMuPMkp8T7EXCngeb4ShBROe6Rf8Zikk3oAbL22cYF8P44sRoml
         Lv4M9XqZiHWjzDXUcLAAUtgvs6Z8teO5RfqN4nkEAiunnfJdU9Z/lVp+QSu6PEA30WcJ
         gj+Trwfv0KQWIrK32FxIBzHC62P9+x+CK5wpa39jHHxKgYrGiOXlmOxHCrZ4ADvfGC5Z
         nxKcv3Zc+lBQL7DWjGFh/eFld/Z4bPfZm0mfkzXy1711GUVQDo5PnRFTVIPHWzAH9u9M
         N5hg==
X-Forwarded-Encrypted: i=1; AJvYcCXo6bRGyUcxJLDQYfArZZSp3xtEPhDMF55FIBAPBzrptw6SgmK6NWmq2cbmYDGjNjgU9tFeLa29B9cRgHI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9JHuUYs5zwtkTzfcWB887XRJNjPgCuQA4LKdMpwcnrMgS02Mj
	+0xyyzK/+OSndQi57YYffviUFoQnFWLQtAKhnjKtEO/34Ye5+LuVxb4mcQ==
X-Gm-Gg: ASbGncvozeb/SZAg5Nck3qlZo5yYD2SvjH1MyKnXB4Yw/lK5nsKcRwp4mWGXXMk9bMQ
	8h2kBJWYtMsg2j8IuTEA1Q3tcTkUNV7GEP/0TBaiiiiUBuvLnMeNL+eL4z61mL99zQFVrUG7YUu
	r7DuVf6hAbIpVPoFMc8CLYB6WULI6Y0EAflPDyIyIv3/gK0/SRp7tkzdoyT02Ed1nyz5Yml+mev
	AhmB5pHlG/Bn7GpeVI5/pq436Z9cauQhWiUSh5I2rzEIsKYILJ4s7Vyb1injsc/
X-Google-Smtp-Source: AGHT+IGqSOYDAP24Ao1+lvB9o7RRXm7gMn2ij7rwVZVzNZZOabmYueaihOqrICHCgu+v51I6Y8nFzw==
X-Received: by 2002:a05:6102:c02:b0:4b2:5c72:cd55 with SMTP id ada2fe7eead31-4b2cc31f256mr27577284137.5.1735501614787;
        Sun, 29 Dec 2024 11:46:54 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:46:53 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v2 03/20] alienware-wmi: Modify parse_rgb() signature
Date: Sun, 29 Dec 2024 14:44:50 -0500
Message-ID: <20241229194506.8268-5-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229194506.8268-2-kuurtb@gmail.com>
References: <20241229194506.8268-2-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

parse_rgb() now takes struct color_platform instead of struct
platform_zone to support upcoming refactor.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
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

