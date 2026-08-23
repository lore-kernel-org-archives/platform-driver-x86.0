Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4439378C9C
	for <platform-driver-x86@vger.kernel.org>; Sun, 23 Aug 2026 07:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787469901; cv=none; b=ijeRJIvLzOSFI64ykU4DDqSRG7vEuB4QMMtflRdiSIXPbQbx20I3tZrORBq2dfw3Bp4hMaQerhKu6C4q3NxTL1eBGqSbteOynVGMtqqykCAX3mAeUqglVZbn57aMFVrHpB4C477aCFtdIT6MeuOY3ex1ttbe3QgkftPWVI1C6Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787469901; c=relaxed/simple;
	bh=Ylsv8ee+1zR5y7VPJWLV1FS+rM2NjJEeJwha35FYmN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h4Q/oVpLRVxDzq5+4wkU9Cs4nqn49q86JiC/6itWGVCdvOZapHs7ItT87yw7dS04DJJ8M9T4BpzBXMJxk1dv+R1nCyeNzVLVNoWtUFLGB7whKCM82RwjhjYC21iJSnbguEbpROQOia6N2vFDCoIw3BZDOnJZjF+PV8twBv+wHes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrP68DxX; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrP68DxX"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1987135a12.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 23 Aug 2026 00:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787469899; x=1788074699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AjsApFGVG7tJ0+HhZ2tY2CwV7JcnIjEfyQ7AIHL7rqY=;
        b=PrP68DxXc4lPOyUQvpN6K5q+441NhuIhSIQIz4DdjLzGud0ZDhLYcllWHt/a0nLMji
         BrE4Bgj6AK6AAiXvwSIeIzD9ZZnDz+wn+OiVJrcuB6b7DUmKEWjsqBwD5bGYOaHmWtJV
         UVXcQrkzPL6iq5NbX882ob7HfpawFwovoWtnbP0KXoGnm/gyialEnLowgMRSO/5i5/Eo
         MtZrkDGSw3/wXNhtseJiUzEPg1819PIGJDvSADuTlNGufRrCRNAlm6dGbeot1C0sI1FG
         8Ir6tFchRonhf/LPD2/DbWWJdMoq4KT60sC85cwjfRIzCjG/+yVp0uaQX4LH5Ru4u1NB
         pz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787469899; x=1788074699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AjsApFGVG7tJ0+HhZ2tY2CwV7JcnIjEfyQ7AIHL7rqY=;
        b=fQSRlZUaPrUvao2vrS+CdHGB6P+Jv0iUv4elxbfdS9TG3q7bJvUnMiLlCtQZ3+ZJF3
         PIW1tNP5kyiOKUoQPD3xlkX95Us02n4uNBqyc76KHIsqAWjaOfJnZ2bW5Lm7OURDOqsQ
         RaP92YhfugtI5K6lOc1Rd6jEJJJVmDK0p9+hppOib+hQOzOL/UfPaw+Bt630Hip9h9HM
         XTvjUaGgoBc7DICkLtwpek+lypcw2Oqi9quNz/cpvi150h2/DbYTsXWU38Kxys55YMz0
         boHHBO2TyJCS93FcNcET8Byrh7mvG0az5BeA4KgKJShEbXH4y0Hi5C5dtepGEGHM2mMW
         +PKw==
X-Gm-Message-State: AFuF++kd0n0qomhtqf80lPV5x5h390A/My9jEaKadPATvq+QKGKgV6dm
	9Blwbzgb0DQ8OLTxrPizmwANCX+rnDYGEonq0MlzqyMK1nahyhy3aHE1
X-Gm-Gg: AR+sD13pHjtHp41IFyQa+sTBRahIrTaSaIMO/mU7ofXJwokObdqSLhWTaKKcOtW3S64
	ONHMdShb527TAz+X5FXhfz9Zbn5TV0RZHa8eJwjD282GuLpPmRqFr3zCCEk0dMpxaQizu/UBogD
	C9vc43PEzm+ONxOZ5M7rZS/a0tjAWu4OV7QHs8koHSSm0SUnrQ2etMAYZGuLv5jZbyMC8ixQuMI
	Ne1n1M7FpS5OPoNhBwzpWdAk1rNOsip8kdENk+CjzzzQb7WiMBCGv4g0tL02rUKvFlmlLNIug8B
	U9z8OIh9HG+1DI7xcmgSsc1Bh4OzxCe4YwFEjXg5a+4U90P3Cp1BJKGIEWQZRmqLEHpOKimW79p
	a19RH//UkH84lGgNRyM8me4jPLjdJL3l3w/8+ezmDxqL7PHC3lO3lNp8F5bAh+kB1wQ3t6SVxPL
	CxL2l6fSr4WrLEzXVW1Pg8Y/5S3w1rF3y3sqp0vIg6IEAOubx0eueZS7giDUAMOvxdkAhQbka1A
	e9oLoBMoRPhAnSmPNQk6xQ=
X-Received: by 2002:a05:6a20:a111:b0:3c8:e304:99d0 with SMTP id adf61e73a8af0-3cd14870281mr27135096637.0.1787469899470;
        Sun, 23 Aug 2026 00:24:59 -0700 (PDT)
Received: from archlinux ([223.184.221.173])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327ff728ca7sm10742188eec.3.2026.08.23.00.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 00:24:58 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suryansh Singh <technosfan14@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add OMEN board 8A18 thermal profile support
Date: Sun, 23 Aug 2026 12:54:07 +0530
Message-ID: <20260823072407.74512-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OMEN 17-ck1000nw (board ID: 8A18) supports the existing
OMEN thermal profile handling.

Add the DMI board name to omen_thermal_profile_boards[] so that
the existing thermal profile support is enabled for this board.

This enables the existing fan control and platform profile
handling for 8A18.

The board has been reported as working with this configuration
in OmenCtl.

Link: https://github.com/yunusemreyl/OmenCtl/commit/ea60e1c52859f0f299e092ae0478cdc7de82122f

Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index b2773fc1aca4..68ea52045a5d 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -207,7 +207,7 @@ static const char * const omen_thermal_profile_boards[] = {
 	"886B", "886C", "88C8", "88CB", "88D1", "88D2", "88F4", "88F5", "88F6",
 	"88F7", "88FD", "88FE", "88FF",
 	"8900", "8901", "8902", "8912", "8917", "8918", "8949", "894A", "89EB",
-	"8A15", "8A42", "8A43",
+	"8A15", "8A18", "8A42", "8A43",
 	"8BAD",
 	"8C58",
 	"8E41",
-- 
2.55.0

