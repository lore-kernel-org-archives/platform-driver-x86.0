Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2AE392820
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jan 2026 12:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307874; cv=none; b=D0h61MIiN6uuKJQv6W512epODm3cjzOLl4Gql190/JDVf4TlCzJ5yQD2+GK+LPoDmgDDNj7IhuqOYSq8HDLene8stS+tYkNIIXbMlKH8jU8by3X0OBa13eODwYw5dB5NUFamnwNLENzfe/ouWVNh30DtnhqBdrZY8mSsBStfBGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307874; c=relaxed/simple;
	bh=MxZjnyoTjZPXcSMm3+p11VDtCqa1QXLdN/oQCkmvRzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+XVrACnINJl0LkgY9kYXvsvX81uJFm7XdkvjjFh1w7W9zFCACVdDs271rJzx7/iForACN/NMHpB033W1B8BTTsnfCv2wkHjZmWhMAqlf6dLlh2n7TlMV94lgT23Eu4Q+sI8ilDiLRliKJgmIX290eIMJNH8xcRkllwq3pgFDVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBg2nsve; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBg2nsve"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-81e9d0cd082so3050286b3a.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jan 2026 04:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768307871; x=1768912671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek8W9y2dSmyH8NdT5cyv4Sc3qF3sYWSc+37c6yKZ4wM=;
        b=GBg2nsvep9xmycM+d+VsY1gAtIvi285U0uDXfhWGguC3iCKmOZHkXAD5G+9L8ncu25
         eszEqLn2nUb+u7Cuq32+uxa1RMWqa7xL+Z3CTr5Qy+Xi1WpQ8mOqZUBA/LQyIRWUsjVA
         2sAIqYjkSq9ASU/oL5wSE7sThfZqsNFPF7CRyug9oq35hSJqEhBSlBao5RD+g0fO2eby
         rTSXgZPx934AaAe1suDhYOUM9Ae5xIKExesXwXGVJZlOGhe6LBpTrFYl+KQblYykPIdb
         aOc3DCT4ADRmHwBwHdpcwMQynqHP9Myo8s2H7lymjls9MzKYoEGAIKRzp8dRRlanQ69S
         S6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307871; x=1768912671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ek8W9y2dSmyH8NdT5cyv4Sc3qF3sYWSc+37c6yKZ4wM=;
        b=NSTeW/nTWbmK5wmPbNh4XuYgbI+JiE7Yv4U09mWoQcZssRJBANUWaiDutqNjcMQqmV
         ZwURwtqrWWvNYagYr6ujslcmPMEwUVdsV/1rtBnsRs6xTQoWHUoIe0hToPPltF8iOf5I
         neeuAdAI3ioQLk66+fq+8vpgIrdbN4442lU/QdQwCfCb7bldQpguYADQrk9u0r+tb3Bo
         mJL0jSHXeNdiKtFfYzxi4LV92xyuZs+RtRW5NbIzLovsw1pMply7YdzzNBBmQlNJwfHL
         SG3+q/ksMLdziJHLHIfWF98IK4mujKgVzgHV1uQcrpKFhdCRLS/5cEQykTclMkteBBNO
         7e+g==
X-Gm-Message-State: AOJu0Yy/NkSOfiaB77SMbPEvjfas4Ivivy+/MviV6IeYblljbnk3IYKM
	4TvgIFlr3pW+QQKyh/gkQvivQQxasEnUbiPZgNDua3NpgApB3G0GAG7T
X-Gm-Gg: AY/fxX4CLrpGULpwC312umz2MHYWmWxSLaj/EyUWe29G3aNrA/xSklqEF8NpzgLK+Gl
	vKNQt8eZyh3dm52VY/1uNcDhYS5q6+20I9frVLF+KpuzM7xRIAkvQYO4d6MeuiGlArDQ22T7Kg6
	q9C4Ik0KoDASZVjnOkg52j+DJ1Ng06mu6AnvaM50Vf80AH/Bn07wosxeaxxi0/rBfNzoVtqnXvK
	91MLXXFj6UFOHM89/hqe9FayEHGKs4f4uRqo/b+2K0zMtBk2Yu05r+LJrZnfRaHvO32p3TVoW0W
	ArFh3W17nyFpUUfU7GE+SfA2FIJbETtkFBwc9ZoAZecbYFgawUiQwTTFLgVzExiEo4KV18iHEvr
	BMRQ3CvHw/a8hfsrAfNiaYLvJ/wFRw7Z9cI1zYVbbGkephbMe+KsvbdR8yaCvq/fKigFVZFrhsT
	0jfLdGGFKi8oTX6pl4qVc=
X-Google-Smtp-Source: AGHT+IG8e45P51e2OmFz4s7Q7ej/2pZW+W1U90Wu+Xy4EBZ5q2CmssSDDyFnRXP9uzzT3G4y4GiWYA==
X-Received: by 2002:a05:6a00:35c6:b0:772:8101:870c with SMTP id d2e1a72fcca58-81b7d260374mr16760305b3a.11.1768307871275;
        Tue, 13 Jan 2026 04:37:51 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e9dd8fd8dsm11409000b3a.10.2026.01.13.04.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:37:50 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	linux@roeck-us.net
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v3 1/3] platform/x86: hp-wmi: order include headers
Date: Tue, 13 Jan 2026 18:07:36 +0530
Message-ID: <20260113123738.222244-2-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113123738.222244-1-krishna.chomal108@gmail.com>
References: <20251230145053.516196-1-krishna.chomal108@gmail.com>
 <20260113123738.222244-1-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The include headers in hp-wmi driver are currently not in any specific
order. As the driver continues to grow, keep the header block organized
by sorting them alphabetically.

Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
Changes in v3:
- New patch in this series
---
 drivers/platform/x86/hp/hp-wmi.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index f4ea1ea05997..fac8e227cee0 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -13,23 +13,23 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/cleanup.h>
+#include <linux/dmi.h>
+#include <linux/hwmon.h>
 #include <linux/init.h>
-#include <linux/slab.h>
-#include <linux/types.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
-#include <linux/hwmon.h>
-#include <linux/acpi.h>
-#include <linux/mutex.h>
-#include <linux/cleanup.h>
 #include <linux/power_supply.h>
 #include <linux/rfkill.h>
+#include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/dmi.h>
+#include <linux/types.h>
 
 MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
 MODULE_DESCRIPTION("HP laptop WMI driver");
-- 
2.52.0

