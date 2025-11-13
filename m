Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A6B324703
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Nov 2025 21:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069207; cv=none; b=MtIcdNDLNoTUd0mQyEfWKVEzdcdC+qdHOz8aNIu5ne5Ck7KAN8cCBCmHvz/G0Rlj6B0xh0yA5h4R9nS5Ane6NoXV1JvoVIPwqvBH6A+pUGIR1Xpo0vTbya+IvKs3uT7o0u3h/+0CmZEEaAl63OTkVNkz8w6UlDhxS/jY9o39elg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069207; c=relaxed/simple;
	bh=EAYHD0uflfQd6sszqckCoZM9plV9potl4DoHq6i9A4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGkCfqBLLwmAAl+dliSgdU8p2ho6lZaj6jz7KFIg3pqAhcAe4wz45aCYJ+6TxfdvPM5v+U8wHMmEO0EPLbThXBwc2x30ijURt+n8QliQOOjojNaf8Mr1LDpLZoUNj7yMGC7ptbwco7ti+Ys6OXeVhZFBLu3vTrCT1Wh/C/XUm54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLeo9aAX; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLeo9aAX"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-bc2abdcfc6fso780342a12.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Nov 2025 13:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763069205; x=1763674005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SI5IT2ccA/LcmNZQUHmcdI+iq0zqrTHDtVhV8fx+VI=;
        b=SLeo9aAXvz8+jnJn+Ek+oV6/IpdfpReJeK6ysMpgYnJH5+YGaMaPuaU7pRv161/0fH
         6cD5fybdcAOoQnIFr1sP66XKYxAJNwq2OFRZzsrLpUZvbY7E1JWx1oV9NCFkaQzW03cR
         g144UbZXLtBsqwtilem+qzxqRJ1JcFGou6vU8XH5MdW8vm+KNXeCJURweMjcy6kSCVGt
         drzF539RFvBIWkUynQrjuKVrwi6x6O6kmtmLBwhdKRptbwlbAzPmzdJ/btdQNcsauhiy
         F+vTKj7XaLjBd6I4FnG6h7/xqEwHcV5porkrSeKftdFATtZp8mj4Rvz9wvPG9t66y5m/
         i+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763069205; x=1763674005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2SI5IT2ccA/LcmNZQUHmcdI+iq0zqrTHDtVhV8fx+VI=;
        b=lUCsX0ENewzv4lqFOeGvYveArhO3KDCMR5KDmSLLgnG1oy6Fbb2hWlBZUifESKtvFo
         SDlOwo3HvQ0ome0egwUG8xybV/TwPPKilBLG/ZsdpmW2U4ktIj39lVmTG6NPW8bHN48g
         wcTp4NVWL6WNYSqIG+1N4yrJMK5eYh3VY7XvC24XxmjYz4gTuDTu6U9YwhA0c8mPLebm
         r8iAWSjghc+9lN8NDp5n2AondUMiY2MnP1bZNFQ/RVZ82dsj6ew2MESCrazXsaAKUzq7
         WgqjErcxQHpinHoKCx+qZjf9veNMG/DYPxK/DanzO0U4Pquheu3YRtyVSzDc0qHajxMv
         gS7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWh1USgq8zeDUy6aqGq+Ugi5r5SBjGC0BVYUlTo1Uws5T4wSFJ/GV9C8VYYNYnPJhXd8wBDAdtGqo7ipZknw7hamaE@vger.kernel.org
X-Gm-Message-State: AOJu0YwdJ05EnCcCBCXUbhVfLlkuz4NPJr28Jl1RdVPZgWZvrBKXakAG
	M44B+nwObg/LQP8tz5FvL3hmoDNr0L7C4DMqwL81QmT85hqCQiqYc5iE
X-Gm-Gg: ASbGncttVJN47YB8/F4OX6m2HoegXrMAW5iuOjbxAwz6UX2ZuFDGbYE9txSJltbRgXn
	7GeQVZDPfvdQm0shkIMbMZP34/jekSqysxsqM0CZy8QHyAl+WjM8xCL0WX97ygIbZXh+tywFkwc
	3d+1pO13mDPOUE3awias6rsDK0CTq8QJ37NewqSqtKBv2BeCpAcMdjpQa/PyfOomhSxqHvzMfQM
	8CZqhK/LEfo/kZur5tbYVZEVCUpIAkXYRaPc2ImUAKYNKPlQkQu/wp5i2PNi2mFwUN5XUMppWsB
	r8yWwWsa4A0+jJ6hhWHAHqTf/A7eCTqKi9K1/EIfKLd4L2cx7js1AxzJrJ1AneBYDHq06Crrpj8
	nPhZKpsG6PSDkIGO7PgEzK/25b7KZShfvUXiZEiVaSSHkvXC1++XQhyoQntkexwT9CpsR1h4VD7
	tbGflUAre8KBi1IVauvXWz+g+oOGfQd3HmKdAQyhS3Ua6r2r4gSIcbtrd66xG1BPnecVA=
X-Google-Smtp-Source: AGHT+IE4bqe47dgeG8a0SwzrDMd8To6AhA03KdcpEfj8eolNH4fytB9FGHHkvfol2Cp158xttn8Vgw==
X-Received: by 2002:a05:7022:1581:b0:11b:65e:f6f with SMTP id a92af1059eb24-11b40f98007mr318605c88.14.1763069205472;
        Thu, 13 Nov 2025 13:26:45 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885eesm1811414c88.1.2025.11.13.13.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:26:44 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Len Brown <lenb@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mario Limonciello <superm1@kernel.org>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v3 3/3] platform/x86: wmi-gamezone: Add Legion Go 2 Quirks
Date: Thu, 13 Nov 2025 13:26:17 -0800
Message-ID: <20251113212639.459896-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251113212639.459896-1-derekjohn.clark@gmail.com>
References: <20251113212639.459896-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Legion Go 2 SKU's to the Extreme Mode quirks table.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-gamezone.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platform/x86/lenovo/wmi-gamezone.c
index df475e52f79d..381836d29a96 100644
--- a/drivers/platform/x86/lenovo/wmi-gamezone.c
+++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
@@ -266,8 +266,23 @@ static const struct dmi_system_id fwbug_list[] = {
 		},
 		.driver_data = &quirk_no_extreme_bug,
 	},
+	{
+		.ident = "Legion Go 8ASP2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8ASP2"),
+		},
+		.driver_data = &quirk_no_extreme_bug,
+	},
+	{
+		.ident = "Legion Go 8AHP2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8AHP2"),
+		},
+		.driver_data = &quirk_no_extreme_bug,
+	},
 	{},
-
 };
 
 /**
-- 
2.51.2

