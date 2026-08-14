Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC9446D543
	for <platform-driver-x86@vger.kernel.org>; Fri, 14 Aug 2026 13:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786713943; cv=none; b=VJbVmD4cOX7EUAsrjbq8zG08prloJX7XhOod+3OetMm6wnMr+DHtreDAJRVq2PrLhBGu1rqfZyVTytZRhMylr6bHpo9IFKHw/MZNYoB5YfL7XQy+m0Exaic5sKdGFpaNMkIro8lNx4ceF4L1IUY4HuQBmpmC1R1/UN7Q84dqiKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786713943; c=relaxed/simple;
	bh=1JczU84B8rmiuf0LymRFab/jM+TRSyiW7sJkBS9HHcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WUTmYl7RKSV+w1kg8a6PbuZ15dMOkua1MEMbSmuN4ZNll+SyRvMQVPn4O2YUCH+l5RFd9OLdP9kj7pSEw3BKaCnU4VPuDhO24yAzK172TjgT2AGUSQIkqqhRcXq9ZdsE9nTejMHv3sZTbPEasfOnTPMijgbWkLnnccqz5js8Thw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/6r8ES/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/6r8ES/"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ccf2360620so10193495ad.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Aug 2026 06:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786713942; x=1787318742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=adjv8vZUdzZ0w4vt4IlqvnT0//3yukWKBpOwksiqJ2s=;
        b=n/6r8ES/zwXX9QJvxORJYtt3fBQ2eMwmB4sew6m7rJ8Hc7UMJqIQT/kQ7ae3Yde7z0
         +uwei/DijzTGmtd9SHHB1bJTiMydoPECPihD8wr3VaAMNui39Qg+xCcOa5Y+BGehAVLx
         PjSx2KZOocuWFUcEIRUO6NttjBcsiuRdne7JvxRxJsLzZAf0T2eKmWtP/kkFZ+8ME6lO
         AYUiPSoOEJEowqE8BG9SqKX9xX1zZ59CEP5mWm18Y6jTfcW3S563Ay4zSmRP4f1dZrF0
         Vo/kAYXDjvky8VhB16+DUnbfyk66qiLUvBizxl/obXKLScYoNUYShqAHWhv7Z4caK/34
         W9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786713942; x=1787318742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adjv8vZUdzZ0w4vt4IlqvnT0//3yukWKBpOwksiqJ2s=;
        b=FYYb5c8B7CLhc5R/yTSsnH/Ad5wP1nx9H5YyzEp8+BfVYmILAgavYOTp4VGtJL8V4d
         Z3ZUFbzUvuoWYfTT5mr+VjbzSasILb+lznKOY4IXnCArglDQ/12cxbt45sE47UWKYv2t
         YR3zds+OTKQ44NcErvtvj1W83NaNsp9ZIGBos+XB6zCPp9c6Nl/lByTpFOsk0mFVB9wE
         gIdD9K3gaS78l1auF3XzS+z3yWzk+waGCXcy7UKSnZzzRmvEx0sqyK/ppRAB3UrwNbqb
         9w2kEBU+z3lkl47Ix6iaVi+itp++dbMY6/bedmw5mBE9mcGStjXeU9e56CLNwqRncrF7
         +GrQ==
X-Forwarded-Encrypted: i=1; AHgh+RryKVSO8SWMdbB8nO3Z7Gm1io/oOA8e0A4Noq1vidG3RKenXprWDb6dsYhKf2pVFkKSU2rpArWj8ObVbnDRF5GZ1mT4@vger.kernel.org
X-Gm-Message-State: AOJu0YwHtFwtor+NnWcp2Dk5YCHlwN/XhqcuKU1iJiiHbI2Ps2BW3PGJ
	bOk35cY/vIAL/TLzCZ7Sxyr0zy3uzfPi5jTS2vHDdiZBRiTFlw9wQ7rD
X-Gm-Gg: AR+sD12PpfSwqG6EKsKVi0/zKYLG7UM2iOjF1YwVVoPsRenZ5/P+Y8oh7O4iJXjGsI0
	jIQjLsF7L7vqtvgC6e1uvkgKYjKJJA0sH8o82Zf0eueqw5suHiMhrjg36Dx2p8rhSrd9q6M02ea
	DRrpYl2KWMzRe34A3VvrDjaar5nhsNWJQOLODGUJALcBA283nBr6VkCHEKX7YGCUXRR4FsweK5w
	0hx28lzwWalZP9LOwt9PZzpt9+Vvh3vq0Vl+YXkxgmqGke1jel/hP7lRbEE3d9Lg6QmGQOjQrz3
	3ZKyMPo7ETO889a/7EfuE8PpCG8EqF8MMSNuDeCR/FktBMTRI5bGqM1tgIhdiJpnoUg5p93W9K1
	7e9VaK5DsGU+ComPmLUmYkTmfnP5cCQUuiniFvBUYc784xIg4ERuHtgycfJLcKq/8WQYMyHhRDt
	M3TZ+ot4lVigK1MC2bzoA5xkH1AOzN5zGyfz2T1I5GPHlaigaU6HCoM92eHb2PzFIVFUUQOBs0S
	pcx9IZKN/B+8Vxz0nkUVIydOTXwjrFCiEUhlTmzd0O5B4+3RYKSTfm47JvYMMWl
X-Received: by 2002:a17:902:e752:b0:2cc:307c:51fc with SMTP id d9443c01a7336-2d3b0dd5affmr60397215ad.21.1786713941808;
        Fri, 14 Aug 2026 06:25:41 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae7a4521sm9636075ad.19.2026.08.14.06.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:25:41 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Prasanth Ksr <prasanth.ksr@dell.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Divya Bharathi <divya.bharathi@dell.com>,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] platform/x86: dell-wmi-sysman: Fix instance ID bounds
Date: Fri, 14 Aug 2026 22:25:35 +0900
Message-ID: <20260814132535.4169956-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The get_instance_id() macro walks the per-type attribute array with
'i <= instances_count'.  Each array is allocated with exactly
instances_count entries, so the valid range is [0, instances_count)
and the last iteration reads one element past the end.  On a name miss
that out-of-bounds attribute_name is handed to strcmp(), which reads on
until it finds a NUL byte.

Every kobject in these ksets is built from an entry that was populated,
so a miss does not look reachable from sysfs today.  The bound is wrong
either way and the read is out of bounds.

The matching macro in hp-bioscfg carried the same off-by-one and was
corrected by commit 25150715e0b0 ("platform/x86: hp-bioscfg: Fix kernel
panic in GET_INSTANCE_ID macro").  That macro takes a kobject pointer
out of the out-of-bounds element and dereferences it, so it could fault.
This one reads a char array.

Use '<' to match the allocation.

Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
Assisted-by: Claude:claude-opus-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
index 3bddedad5eba..eb48ced55823 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
@@ -107,7 +107,7 @@ enum {
 static int get_##type##_instance_id(struct kobject *kobj)			\
 {										\
 	int i;									\
-	for (i = 0; i <= wmi_priv.type##_instances_count; i++) {		\
+	for (i = 0; i < wmi_priv.type##_instances_count; i++) {			\
 		if (!(strcmp(kobj->name, wmi_priv.type##_data[i].attribute_name)))\
 			return i;						\
 	}									\
-- 
2.43.0

