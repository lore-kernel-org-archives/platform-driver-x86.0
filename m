Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9529B233134
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Sep 2025 03:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758771620; cv=none; b=aq9jrJP+5H6QLbFe3JQuC1nik0bXMZVjAkVhCjLrqHSN3XPOYkBCqU8+CFoixhNEpgYVy3mmzxPy14/N2mKLI81OeOdtacGx8dvbb9Vh2FTeYbuHAKY4Jcstds3OH/0JPGZ1IeGyy0xi1SlbhoD4u/+sGTeYCC6rp8Zyu+KDNN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758771620; c=relaxed/simple;
	bh=bmPJ0+VRgVJPS8VBru/tBQQdNc3lAi10Hkwzd7aKHPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uygWoPgeIqIjRPGS4yfWzEHMwL5sjuygSHvZ9B/dLBAcwqRy5Sm+y+Mfp5vVQdgXoqnBadpXJPIg3AiaV6Cl/U45aXiG3F+gy5W+0qn+QakJVEDWwBXOXd9MDXSpmO3td78FBJq8Pozb4syyqvl2ryUONOQjJ5KeGvK4EjHgr1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trix.is-a.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trix.is-a.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-244580523a0so5976055ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Sep 2025 20:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758771617; x=1759376417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6u9OrtCloJY7NJyMif7w6nU0t5/g1w1ibY80MoE4gP8=;
        b=JfvWQZP2LA+oBgpMPwwd83tcCRZAcZwNZ9bFQ/WzS/Km0r3CU54Gwp95se9G3Rrmoo
         pQj+SjPSAVoWlEI9DZopoyoTjcUGmtj+hq6pELIY4bNYY0+xwkRUzJF9lOFsBttaVrpf
         oo0wFR8/iGFciN04TXYXQv+jfbO5fmOFmmzlU5oP0E9h2aBEMmo7KZw8R8ge213ERexf
         XVRX5MAnEXF4dNsPLs9gDjtFQ3S5DNhTLwxCwONINdD7fxNpuHQbHF/oZkP52787tupp
         27VxhEo8eqt976VcQmCUYRiTa+o4Te4LKr9lHj4/3sXHUKEsX8lp0iXl/Y0hOXpWiY2B
         kOWg==
X-Gm-Message-State: AOJu0Yz3qwaU6xIwTpcMky1WV8R6kHAcs8eJE7XHGAS+i/4ECQuwymb9
	CV3E04wikpbx/3VmR0AkAWMkLRik3MBZS3rpBiqH/h8heS2q4hzshwPDantndy4PprY=
X-Gm-Gg: ASbGncugtk/jeC4R8Gnvpj0XaltZ/NNwj/366VWFGsIxXJv/INJGVFwgIHNw9pf3HRX
	qOq2qlt4tNuPmV7VW2F/QmrB7BWUOVAzPX2H4GG7+UKGnXj2ZTgOw0RIj4J1YrmMiLJGtJvdFYz
	9FS12JzijmD60IbrXimf09dzy1CAIkvjaFH79T7XT2q6mzQsE1jKz3IeKuZDreADb3Qcm0JYfGM
	olPptuwxlw/X1RsNH2mOeUVEWhHuqvt+J53gXgbD05iKWIl84A3mSR693uPVMF2z0keBp+DjHmy
	8/dFCZQGA/e/NWrnvgj+rjVrxRwySYIJWBPP5zBzYQHxEtKEgSozTy9I9RI+6zyBDjtF1A0ngC6
	OMQ030CeU/9jphCVKc6zP6yo=
X-Google-Smtp-Source: AGHT+IF88A7rwkV3P9jdms2ijhexCc0OkBmd1/k9fgklR9TyBXPssMEOtsJr0XggJFtz8XN7KZeAmQ==
X-Received: by 2002:a17:903:234f:b0:276:76e1:2e87 with SMTP id d9443c01a7336-27ed4a4979amr18671325ad.44.1758771617403;
        Wed, 24 Sep 2025 20:40:17 -0700 (PDT)
Received: from archlinux ([2405:201:6804:217e:39f7:e9ae:d6fb:a075])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69a9668sm8133595ad.112.2025.09.24.20.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 20:40:17 -0700 (PDT)
From: tr1x_em <admin@trix.is-a.dev>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	kuurtb@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	tr1x_em <admin@trix.is-a.dev>,
	stable@vger.kernel.org
Subject: [PATCH v3] platform/x86: alienware-wmi-wmax: Add AWCC support to Dell G15 5530
Date: Thu, 25 Sep 2025 09:10:03 +0530
Message-ID: <20250925034010.31414-1-admin@trix.is-a.dev>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Makes alienware-wmi load on G15 5530 by default

Cc: stable@vger.kernel.org
Signed-off-by: Saumya <admin@trix.is-a.dev>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 31f9643a6..3b25a8283 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -209,6 +209,14 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 		},
 		.driver_data = &g_series_quirks,
 	},
+	{
+		.ident = "Dell Inc. G15 5530",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5530"),
+		},
+		.driver_data = &g_series_quirks,
+	},
 	{
 		.ident = "Dell Inc. G16 7630",
 		.matches = {
--
2.51.0

