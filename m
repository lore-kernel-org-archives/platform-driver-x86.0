Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9E01A2383;
	Sun, 29 Dec 2024 19:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501666; cv=none; b=JkSGRGJo/bHvKhp0KW2V7jfLxKJ5wxjQcU1yX1EtGe8LXeE6pDCQpWRir4qlXHDKxmfM9bnvy8B+DssO8jkK1nzuWrqSBpygRkdYdUgPzSp8xBAcIcOPEJItNU+1Gwa3DCvvk+yz60UcpQ2PFR52Me2SBVN8A0Bp8oQRGMjjj04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501666; c=relaxed/simple;
	bh=+/CgyxykexRh3PP7SRibIHI10jg7SBL4oJjC2v0Awas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P06LTCdbTICeCDlKyNsUMjla6NC6dRQBYReVvg+KcUATBekTXXAEeEhTheg/BDEjAh7VRddX8zKvwHrhnhJjrqToDwj2JaL4jLcwBd5U8Maod3AqRK+iBCHtFKDF1nxw2TiiTONhDHro4kW22nt6TvwDxDAmXt2OxHIXkmHx3cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeATIwaR; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeATIwaR"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afed12283eso5561064137.1;
        Sun, 29 Dec 2024 11:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501664; x=1736106464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxrKCZPmm5GuMIFPmXBrX3vhTmGZIQgXcL2LOAKZvIc=;
        b=NeATIwaRJDYsp9SeP6fvCM0c9kjtZuahmAwCrD6AMJndLzTN8KdTFtX4u5RxauR2Tm
         VBHSahPLmvNfpX2iZMowBSDFA7sZaky6fCs0QuNdE8Poe1WgX2LqyXPBPIs9RUprhueZ
         JD8MbZxGgVITuiBiIDKA6o8Qhvzgkdd5O3I3qYTkoVd9kEjsG+NqGZ33syt67V1q2mxt
         4IV9tWFIi0qPagkRXxepXj9xDts8fpdNXlIwcYJpTod9RIpuUDq2Q9s88t7a9VNIdoYy
         EPO1HUMNFbs9kRvk9OiS4fnRnJjD96Mwf2HKpJC/iH4S9BRcyeaDWRAU3Lr+5q0J2UP0
         5K0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501664; x=1736106464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxrKCZPmm5GuMIFPmXBrX3vhTmGZIQgXcL2LOAKZvIc=;
        b=THpbABELaCTe61oqKZdjjGtZ5CLlvJLoNqLseNNiHQqWIp3XVSeKT4LsG5MPzQrZqg
         6YAaaxFCCsqczvMQZJert8XXZ3UU/GNU5gChes7lzzVaANcWsBQjF7loOQO08TSo2d2h
         J5gS3cc4kPn/uaSfKC5IcsMKMbFt7mwkj1R+6gOiXp2MJT3eghL+CcW4LWrwVt0vU/Bz
         8horLU+uTa9znFzowJ+0Y2oqD7ZyFz+PWOlvxL/t8VXLQw6QQZi5QUHBPGlOIJnPJDzL
         gZQFCNgOgVhFct/6wzon7/lA/mgARcH4ssZ2VTuXH5CRUtPqxNZYLaUnc1w+xTEnrWdu
         o6gw==
X-Forwarded-Encrypted: i=1; AJvYcCW7eD2/Ywq+8f57oda7rG90E7pSXQZR6gh+W0pdW2o46fR4VRPLOeFR9qkUN8ofTh8XCRZbequVZrKvMx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW/WOCPgM7Jj1O5Nq23j4Avsqim28D8pTc00ebE4D7FJ4aUDah
	eEaoSJwDVuLOphJ+3AaU15n3QHIfhxQmTWN3yHfQSW/ONBuz6bCVYkrzRw==
X-Gm-Gg: ASbGncvxYn7bRDB761CU4BCaCgYGfj5TZfpG1VVOCXvW7/WE+vFtdqNehmL+iPT8uV9
	wQzVQMF65v9bB0YxqO5xas0n9GxG/4xaRetLSTKWoupOSKYY2WqTs5zWYo0VtPIY/hGC3KXZd8k
	xEXcb+Uc5Pk13etsYKyTXn+XfAS91AGVlIxABHmStKQqSyNvHUnnU7tDN043cDr1QcTdFR7WGuW
	oMz8FtVSCQ4BJnbqIhf9eyQpfunHgSK4sg5Ww5qfgMt0o8mmY8DPBcySltASbou
X-Google-Smtp-Source: AGHT+IH9zDT3AvTXQLiA6abbVDnUnVa23F7Ma+zA416TaN24oNAgw5NTOzd/kfgwMsTrhl5Sebq98g==
X-Received: by 2002:a05:6102:3050:b0:4b2:ad50:ac27 with SMTP id ada2fe7eead31-4b2cc361299mr26853285137.9.1735501664099;
        Sun, 29 Dec 2024 11:47:44 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:47:43 -0800 (PST)
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
Subject: [PATCH v2 20/20] alienware-wmi: Update header and module information
Date: Sun, 29 Dec 2024 14:45:07 -0500
Message-ID: <20241229194506.8268-22-kuurtb@gmail.com>
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

Update module header and description. Additionally add myself as a module
author.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-base.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index fd73c3881dc0..bf0f37363998 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Alienware AlienFX control
+ * Alienware special feature control
  *
  * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
+ * Copyright (C) 2024 Kurt Borja <kuurtb@gmail.com>
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -15,6 +16,7 @@
 #include "alienware-wmi.h"
 
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
+MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
 MODULE_DESCRIPTION("Alienware special feature control");
 MODULE_LICENSE("GPL");
 
-- 
2.47.1

