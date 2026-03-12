Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858A7383C6A
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Mar 2026 03:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285038; cv=none; b=skKYLNnEy0hUyZsnveBei63JfYbYMnqG0bRDFue1/IUsU524Sc4DCgvmIMbB4+rmJrAeDIiLzk8MZ+7sPKsz2p5dfwUV/hgFI1iNN+Z+EstWJcOQ68u0KZzPRUypqfA5//ez0ixgML43L/rRaqG415Y2lWcxbMVGYhMkWdXfuMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285038; c=relaxed/simple;
	bh=9hrTM3BxY52r/i83ciCo+2/+wCJlHZeKSOLwSgXFeFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPC20Pum8jo5tevdXeLkDaQ4yf/S7bBQQOBkcHUWgsEwN+3Rno6DmKAY+R1KH2D5yEhQ8rc0FCMjYwkDZNcfcfsWu7okD7h/xyv/b6goQQJFQlocJ4Ro+st8kEcEsc0SOKk9MnWQG5c0uUf7IDWdVGvQpd228R2LrIYpYS24yZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaLGD+CY; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaLGD+CY"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso605631eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 20:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773285037; x=1773889837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2voJFRWYe3/IRDOJSsRfVKzuFslhb/kU1EVyyj6gX0=;
        b=eaLGD+CYJ9JmoUJyqzixYmScfJ7rdq53WXPo1Yv4QLLVq9vENwJ6lzAZrcXZ90fFig
         a3keiJAuLotyksGdNlBVSwqSndEjUrrRPPwHNxCCz3hsTica6tGxmXiPg8zFRf6jr6+4
         evstZIAIM3/cGDoYWf55Z7EyW0pPFVkg0S1WTkuggPqLz+I9Jsx2zd6E2vhY5VRbzXa4
         BCxjOGYHXBXeFhCdTru2lqBqsUP/Io9N34ezDeh4a4/T6D/VRSwJGoPc+N9l2DAMijHx
         Se2o7i/gE/QWCOD9I3IXReaUKKDjC0CTEJDgM41w+TbTJGzW59BYxcFJs2WmdXdiOyjI
         UZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773285037; x=1773889837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U2voJFRWYe3/IRDOJSsRfVKzuFslhb/kU1EVyyj6gX0=;
        b=GWOUgLWhtKqHRwjwaxwAFOb70QXCfULv5GzObW7MZT6JZTQxlAAqEWCeSySppryzO/
         t/ynW7+QGIoyOcYVjLpDR8rbEWtzfYdlkcT1RQIQFf0S1YkrYGp4h8k+ePS0xGadp1ZC
         K9PZ5iw5grXtmfJml/fcAC6bTtJEqVNR+sILrgJqu8tnnPRJYvWXXz5qhyQOWp2yOyTZ
         qLdAZqECje6LG6Vki1Ncmm32tdjKL8TB6+dVR2Ag5bkQNx9qTWWVkbgEGL7bxa28Quqy
         GGSXo29tQXQnXHK7bYA9WGof+bvngRuu9+h5Z/yBZNgDp3gU5QR4s44unzfNlKx8s9BX
         Qp9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQAi8ByMGdf4r6ONSo9hFeANhmk4O1ajNUqsjJe7r9fVZYFBkXWSFGGh23RN3xAEkO2FxZXHPBo27U1OTZZgwjIDkv@vger.kernel.org
X-Gm-Message-State: AOJu0YzE8fJrKpA3IVAKvrOWMkKnuAb3a4gqR6S7tZzq5Rx9uwNB5uC4
	ahPCwursAIN470slMn8MjU9nG0vcTss6OSdg6ce0sCMoYT6dzJpgCn6O
X-Gm-Gg: ATEYQzysnnf9QYupyUfCLIMmFrEmBhOrYEbYqsdsc3b/L3r2EoOyrnBIQxRMyZZmPma
	/8JpesYyywm3OEmwSgyhOQQYStP8CZoECUMZHu+LKWi7tihaqFaUZX8SkqOMyceXEGnR60q5Pfv
	nIPPAd/ztqdMzpfrj+y3UUYnMEhxaKHWmsuvJs6tOEc59+86loLHRH1YLfwhQcjlBHvvz+/DCqh
	HgQ+GmYPRepZS7gTuBo4nPkK7RhiDCLQV59flvWDKZoaCiAXav0utk6b+BU84wlJ+ayek77h2Xo
	fbU7ianfkHTj8wH8NafWemx4zgRuwaO7FPv1lJHOD1x8g5/jwuchwBSDLVMIUEws9NcK4Sb4iOz
	HirRkiYWSvafyzcb6EyGHv0l9qrR0JPzqQa0WB4oRunMcFXp4KjTODGkTDghM1O0223NW2yAqNP
	HWXNXMzu5YpHcyoOuJGL2sAtj0bVWpbaxSIafwwCmKL1O9Ykoq+exyioMv2cLKp0I71T0Gu4rmQ
	Wbu
X-Received: by 2002:a05:7301:9f06:b0:2ba:7046:b6b5 with SMTP id 5a478bee46e88-2be9441fc7amr799039eec.15.1773285036661;
        Wed, 11 Mar 2026 20:10:36 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8aa97dcfsm4802495eec.33.2026.03.11.20.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 20:10:36 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/8] platform-x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
Date: Thu, 12 Mar 2026 03:10:26 +0000
Message-ID: <20260312031032.3467565-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312031032.3467565-1-derekjohn.clark@gmail.com>
References: <20260312031032.3467565-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In struct tunable_attr_01 the capdata pointer is unused and the size of
the id members is u32 when it should be u8. Fix these prior to adding
additional members.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index caf360b76fc5..c1728c7c2957 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -546,11 +546,10 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
 /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
 
 struct tunable_attr_01 {
-	struct capdata01 *capdata;
 	struct device *dev;
-	u32 feature_id;
-	u32 device_id;
-	u32 type_id;
+	u8 feature_id;
+	u8 device_id;
+	u8 type_id;
 };
 
 static struct tunable_attr_01 ppt_pl1_spl = {
-- 
2.53.0

