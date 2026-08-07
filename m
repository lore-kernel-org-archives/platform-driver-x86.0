Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A52339B3D
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Aug 2026 18:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786126069; cv=none; b=ThOfiTw5w4KNyg4hiyPqHGVfqnXnB8HxQdUf35AR1Kn1llt2M131jhF+ppcqLJR1iyATLsvN+w+xolBvKMx6Q09qLA0FqBfHIWbfnFEyMYxeINHVspxgF4JGuEKdl370uwudOKwawivh1s8sexFurrzn4UHNw+N4OZds714/UpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786126069; c=relaxed/simple;
	bh=ccqekMaqOBh4qSOJF9K1JNiovWwRRNZmSR2T8tjirZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EkAKal74WChrV761yavBwMnAcy0843MGCCE778ApMxwB8iwCyKzw/QDS+AsrTwRQwh5Bg40eyijsGeBs9iizQBBbJsIaosa9GuzxCe6lhIut7L1LpKV4RpXWgzXuJnNVQRbYGXTStPM7L1Ac36D2j0KivecpPYUtT3xjU68L25g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVmCCU8a; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVmCCU8a"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so36813765e9.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Aug 2026 11:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786126067; x=1786730867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7a+mc/qV5EvtqNHLFxrGGp+nEeA5DgtSuERBRbcbbg=;
        b=UVmCCU8a6ooKy/2BkjwkZvTavujF5TuKm3P1c48crxlvby/cE/CN3MnTVw73lye0De
         4FNluKAX3lEaGFp9SVWgloR3WRPCVXR5ydLOxGnzSCRX6ULe/3DkeU+ASbtZQYvelXOm
         0zBMzAO+8+E/mX9WjSX6FQcneP68HgUlnzmZbkZjyVV0WmDV9X3Kz9dPqW5X5/B1eSrc
         8g/r3x5B/Ms7epcV5rPdxyH/Xc5sAZuv8RCA2KfCOOHkzHImBWnzxJF9TVrajtR4Zc9V
         fD4llv1+HQG3jVtNWS/1HIR6kBdODGwtYnN+hG4WLXtLjGjaDxPrZntSM0ZLD7FqrgMe
         iQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126067; x=1786730867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U7a+mc/qV5EvtqNHLFxrGGp+nEeA5DgtSuERBRbcbbg=;
        b=sYriqJ6G4RtfQ7z+JMSAWkdlU6doeEpwgBrgY0W6v5/heM8DOQ1i6QffPU2ExNuMts
         i5ezSuLbcLuvFQTTy9otELevTZsT0TbrjznSYbLEydt+fSM5mp4Na4lkKZcNTbpi+Mm9
         5OQ4te2VyQop7pUD5QyDNIdomiWEGoEcAzoxq6yvhyT1iieNbE6rLPORZUpT9lRg1QoU
         LGpaTu8+uZHhZXvZ85/zm5WZSxrUlXkUwAeq3W1E9UBP0g+ev7X3tkq0Qq2iDBYmJbw1
         CCnrNvyFC6FacEI8jzUKCFWfwztBasQGwuYRF2keYP53uvuA7p4gXwr3zuUGw65KOCph
         sMdw==
X-Gm-Message-State: AOJu0YyobJvQ2tjpTR6A+6kyJsek7RnyKi2e6HKVYDhLbzl9Fd7KAAr3
	2YIly+xyHj2h/nrCXFpNWSMnsV/bvKiziMjQT7Ehul+tScnCiDgi8lSy
X-Gm-Gg: AR+sD11gJf/fBqwcCzHREFLmfvGTKln/8pt1EWbgo612DiQEKgDOqD3XpGSH+qEVWF0
	gvX/+FohO6iby6MngYjkFRV2LvSbKXVru2WhRvwDLymtSlt5O58eVLCeWNtXg/Vlj/kA+YoIULr
	t92pq8X+TOGwZ8XcSFM6qfnOzRXEb+l/4FcYAzFmjpbxbF0EBcsk3wniSXoqPh8cxG7gl2biyW+
	dojIzyBsvpa5Up/fe4dojpemB/mQzM7iTHLy/5QymkcCGrG0BpQILp2jHis8mlswkxLWZXxrlAI
	RhdxQMlCSEs93p9YeAwDe/4vKNJe1fMeXTaf1OIQsMc6iBViWrAgAtQ1GRSU4+s11+o6yCQlpEX
	fKX+tUjbnyXv4PXWPHQ/WNXxSuDhkW6vXp6z+T8IOEd3BS6XwYGTPezkL3JIocscNSYEPdLjZTT
	PSt6zcgAwySN9+7xhlHtU2NqmD05/qJA86I/lg1X/R5BwUIvryHJHzXf8thQD5WXAWyUgdz0k5
X-Received: by 2002:a05:600c:a47:b0:499:484a:7644 with SMTP id 5b1f17b1804b1-49959e2eb00mr138175045e9.9.1786126066291;
        Fri, 07 Aug 2026 11:07:46 -0700 (PDT)
Received: from gentoo ([95.52.105.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995d865084sm35139855e9.3.2026.08.07.11.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:07:45 -0700 (PDT)
From: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
To: teackot@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yaroslav Dudkov <aroslavdudkov622@gmail.com>
Subject: [PATCH] platform/x86: msi-ec: Add MSI Katana GF76 11UEK EC firmware
Date: Fri,  7 Aug 2026 18:05:53 +0000
Message-ID: <20260807180553.869371-1-aroslavdudkov622@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the firmware string '17L1EMS1.107' to the ALLOWED_FW_13 array.
This enables Embedded Controller support, including battery charge
thresholds, for the MSI Katana GF76 11UEK (MS-17L1) laptop.

Tested on MSI Katana GF76 11UEK with EC firmware 17L1EMS1.107 and
BIOS E17L1IMS.312.

Signed-off-by: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index 667df9509798..566dfc73cb67 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -1055,6 +1055,7 @@ static struct msi_ec_conf CONF12 __initdata = {
 
 static const char * const ALLOWED_FW_13[] __initconst = {
 	"1594EMS1.109", // MSI Prestige 16 Studio A13VE
+	"17L1EMS1.107", // MSI Katana GF76 11UEK
 	NULL
 };
 
-- 
2.54.0

