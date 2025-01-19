Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706C11E2834;
	Sun, 19 Jan 2025 22:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737324391; cv=none; b=HGf3CqyKF1Zve2AQ2nMyjhAUSsrQvKB1XxcTgCPBN2lby2tBs4gS4ZNQNOr1xB5tp+A7J7LXmn4GIorgh4iKNIJs+yIXLVL3aGWn96XnjMwm2TodgCCcoCRBfP9RFZLdjbrs2H9rE8BUA0LGPfZsIjeE9jXirTtzJNVDdc8OmtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737324391; c=relaxed/simple;
	bh=uln2bSp8cCgoiDtrWN2ZC+ClZjMq3WgUM/z2IQmiA7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oe3HbUDuc2Py2hZWt4bjkuuZ9fo0DZYTjb/xovvxnDPA5D61ZXuZ+QI0JXM21sQWkdn7kvbN7rp8OkmH6yG+9B4x0XOJxOYUntmrk292l/snjLncEgm5JA4BL3VIkoiyV8Xr44un5W3qqwtWxKgBPfU1+CSODWxKBY8nrqJP9Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHryCTb2; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHryCTb2"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6f8524f23so493715485a.2;
        Sun, 19 Jan 2025 14:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737324388; x=1737929188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HguH/5GHeVMnOVWR0BWd76PxkLkAFvISPM4MfQHocJ0=;
        b=SHryCTb2t3jAg7Fe3DAnXhHGES67sKoCOG0OnTW7XD6j7Wl8NHkvaWInnz9gX/1QXo
         LayVbAdhZdusqA2oXJ9n7RjyTlEp6GhpH1H7XEzy6Z3lNGtiBD+uyExIKJDTrT012Y9k
         xxocWKRB/47FX29WakydItuHWA6rrqhOsbzXsrU0MBSYhjfqUuAX+zfyGLPZ+HMpWkFJ
         Ozc5qF7T5lV6nkvGV1xjXSNUNr2q4aT6foKUVqJ5U0/s9gJy96hW9mX6FXgMItjoc6az
         Nw6H6hCFzgLZPquhS9F5FL8pRWr+kp09P0aZ/lYEUTJrFr25m9wq/NcuABQEVmTDglRL
         PO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737324388; x=1737929188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HguH/5GHeVMnOVWR0BWd76PxkLkAFvISPM4MfQHocJ0=;
        b=cNwDPqM9DUyXiefEU8H60Nn9xFLkaZfc6da8RnxXseVdCkZTvZUk3pdcZyJzGCk8pQ
         4xulPiW3ujoj9w3J9kK1F+F0KmVselTz3QfJGcO+S5JmPUB2kMqj4uccZ9nxAaMFqdQ+
         SwUvOwD1vromBNv2Jtu14IGZnMMkWyZ9Pc5YKz2hOkwBPglmYTtSA+6iRIILPK8eMcUQ
         cBYCTXgmjCC+FYszA+I2HkT++K9e5nWB9ynEd+FK9rtMblRAtRFGdpUlEVsa0iE+Y84t
         1euscjHp+NobzRo6u9HZb8zaRCbzgGT77Bti5U3cYnzj++DRWT8cyif93Jyjapz+s0R6
         TvCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW73GQwswaYxHL21n3d4qJhX4obsiRW2Nu9Q7JVqUugP+l0CJUnTPt1EYTLHldQZvlb9Uj03OpoC0W4rcE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf9C2tNgnztJnMYCxgXSzlcqFpORfgEIpPTo2/As7+bKEyAKEV
	cf2k3FPW1Wcdjv0hRmNi/SRXF96JzrTsmP7+p9iwhATf4JF/V6U/ERlqRQ==
X-Gm-Gg: ASbGncv5GlF4Oo4Wy1gm27hF54tUe+XYooINGOxt+BUpuxxOXSLzhAkHgQB9/56boen
	oq9NYAocl/i7PbvW6TDOsQcK3LqOVb0NSwuuJS6Rf/vOs83zmBgxzIwpAGiHdGY1T7rJzFBwxKA
	UX6R0hW+u6VC5SMab8iSggmL1kmolXzBFt14GRXInwP6J2w0m5VnPwCZuDyuV4014QZzp/3XCPf
	CLVNm40jHkEQwGSiyH4PnU6RfTmEDWAKQM/h8pgZogg76achxENUJRpNZvUGAdo1uEjfWo8xloM
	vw==
X-Google-Smtp-Source: AGHT+IFOA9eP3M0hOzcbMoyWyb8ro8AZ3iJCMGJPpMoFzzhBJlVe2e3lseBRDWO4GSKA4HIA/pr6PQ==
X-Received: by 2002:a05:620a:408c:b0:7b7:142d:53d4 with SMTP id af79cd13be357-7be632480c8mr1573147985a.39.1737324388019;
        Sun, 19 Jan 2025 14:06:28 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614f0096sm369243085a.112.2025.01.19.14.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:06:27 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v5 14/14] platform/x86: alienware-wmi: Update header and module information
Date: Sun, 19 Jan 2025 17:05:42 -0500
Message-ID: <20250119220542.3136-15-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119220542.3136-1-kuurtb@gmail.com>
References: <20250119220542.3136-1-kuurtb@gmail.com>
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
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-base.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index d0f0b3c7a915..4561720fdf2f 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Alienware AlienFX control
+ * Alienware special feature control
  *
  * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
+ * Copyright (C) 2025 Kurt Borja <kuurtb@gmail.com>
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -16,6 +17,7 @@
 #include "alienware-wmi.h"
 
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
+MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
 MODULE_DESCRIPTION("Alienware special feature control");
 MODULE_LICENSE("GPL");
 
-- 
2.48.1

