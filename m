Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99E2266581
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Nov 2025 19:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762196537; cv=none; b=fR5B+Su4oJrIWuMDzent4Co0awdICenRwA3OHAzd7hygn7PX1ZJoNyyqDNW3ZmLy5IqJCUkuwz+XZMt/+Q6UsZITZm6ddsvvE1SoCg+UYpJ/EYnQzFET1+Mgtw+Xh55MjbNCqbXNrRPKffJE8k+aBWrp4KwfUGvOSO+ntgXxnaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762196537; c=relaxed/simple;
	bh=mR8JFYjApVJz24/D1D8ubd0ClEAycyirQaTeFhns7r8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eo9YT2HV2h1hI7jQWd5XV+L0nRNdk2NFRRUI+3fLLwY6xlasDQQKA0yQFiZRSX0PKkB3v8o3YwLTdA1SRRVHkm2LvVezyPDZnj+iz5siAQKpyl1EvjrH0bRV/R3VJDpH6Sd8nJfVox8bi6jf4CkNL5TwNN/UhavttRzVntOt7vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOkWRSlm; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOkWRSlm"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-54a7bf06edfso1681136e0c.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Nov 2025 11:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762196534; x=1762801334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7torge8NqyhRXZbGycebgpy3GTUJqARV2d7cyPFikQ=;
        b=fOkWRSlmvS6G1gowOd1vSGknzqa4GR8e17WyeW4mYNNvbKHPS7dRrxn+hzeJlSjgmP
         Kil3JJ15Ef0MJczUSHtmYsQGwF8jsRe5wd+3vuujffGZO+FZxXHNXCcReFllP3NP4ypc
         fEmx2arQO+dLU2xc8lYV1iXo7L3Dj1x4zWXdtfhN5MMrpNFV6MlzZ3M3KYKuwflZukzX
         IIGM0GvXqL6u/VF1sZ7IstmP7ZnXSpjGs/dz+yE4AC6T7F3enHCfM2NUnYKjDQefDBVV
         ZDVIi3jT0Jjiv7p22AWZGzH5SsYZqIgRhF6Txjkil7pnJ8Y7xZ+nWZJdmctDhM1IH2XL
         kVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762196534; x=1762801334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7torge8NqyhRXZbGycebgpy3GTUJqARV2d7cyPFikQ=;
        b=UcKOEXjyFNmN+iycItIRsPar0SZBzL05wuBriJqVgn6/vkypLAuGfDyZpQRxam+Uet
         7D2vWIqA8Rd0/g2ICcNUZ5A5o71hH56V+E/l6EnO7jnSf+8TbWlfdmVK4oJsoo8IBoSl
         MLiMBuuHzgQywsvhSRsn1zCTyhUINGR5EIkBhEkizu5rPiS3PwvdnM22a6w0edipawvC
         qt6x6eNGJvlkiAaonKLLpUtyoSOa4u9rSbL2k0DuQsBmCm05Y6gmNPCm/g4XZMhGhte5
         38WjElPRbDeAGqVGqDVSReqNQ9I/zcIMnthOeFuuLPnfoMHWw6aWNqNWCDWTDkuwM9Ox
         Rvxg==
X-Gm-Message-State: AOJu0YyJfCZC9TIrx2xouMbfY2sAzx+lFqT8nWedCryLxqaODORftzGf
	nOsi6Eki/zfq4i5/WHMD6QFsIrwdmDqC9BhrqX05a4ELtwW4t4vw5LnN
X-Gm-Gg: ASbGncvVe7jhBei1KjBpY8hRhS4KDBpTS2ilwwT2NKFQ0wUtnDgfj4qK1Iab55kCnOt
	s9Wut7vuHDppqQJICbKnx8MJoVtzoqOorz+twZAPQdIa0/2a+QhOQ2AFQx/G5kwhuvELiFcimOA
	6fgT32t4tSINudVO0LRa3FbLrdxMoj2aRQ+6TCojvrJoe7jDco9DTLPgZe8LA5FCmt+vPIqfNqr
	Kmnh4yAnikdwKLTV1mNTUjaE0X65ZFBzbx/Z4ED2Z8/TB3TFbuD1hsAxmTGXj5/SUTyGV050FM6
	CqtAzJZGZKB7CpCYfHsJXHLQsY+zWpp4+DTkXSbeopd6qZrkDBqVSERTaLiEbt8n2ICxq6nRMrq
	LADw7/ylu7Cv8RTlAmdUeIlRYColBV9BwNK55edBQ6XJJOqXEHZ6R6jf7jVQg5jECkNAT1z4qx9
	E0cg==
X-Google-Smtp-Source: AGHT+IH4IhiEmFjywTMC1UXYIsQrZjiLBGhqIFHxaY/hE5Qv29XEePHd3I3nsvXC3iHruN+PtJ6gnw==
X-Received: by 2002:a05:6122:3d0f:b0:559:3d59:1fdc with SMTP id 71dfb90a1353d-5593e42365bmr5038157e0c.14.1762196530761;
        Mon, 03 Nov 2025 11:02:10 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55973c834e3sm358469e0c.11.2025.11.03.11.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:02:10 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Mon, 03 Nov 2025 14:01:48 -0500
Subject: [PATCH 5/5] platform/x86: alienware-wmi-wmax: Add support for the
 whole "G" family
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-family-supp-v1-5-a241075d1787@gmail.com>
References: <20251103-family-supp-v1-0-a241075d1787@gmail.com>
In-Reply-To: <20251103-family-supp-v1-0-a241075d1787@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2761; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=mR8JFYjApVJz24/D1D8ubd0ClEAycyirQaTeFhns7r8=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJkcf5RYNsjsnPx+YW1R8+1Pm323v165JG5NwTtH6wdvI
 m9Pd33A3VHKwiDGxSArpsjSnrDo26OovLd+B0Lvw8xhZQIZwsDFKQATiXjO8Fd+vXd3P9v5T44t
 z+MedDd2Ll3//eIU6cVerQd/Cbf/krVkZJiiJRIUtZfPXOnrkw6vrsVMeec030x5MiGhrcO0+W9
 MFC8A
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add support for the whole "Dell G" laptop family.

Cc: stable@vger.kernel.org
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 56 ++++----------------------
 1 file changed, 8 insertions(+), 48 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index c545eca9192f..1c92db1ac087 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -162,74 +162,34 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 		.driver_data = &generic_quirks,
 	},
 	{
-		.ident = "Dell Inc. G15 5510",
+		.ident = "Dell Inc. G15",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15"),
 		},
 		.driver_data = &g_series_quirks,
 	},
 	{
-		.ident = "Dell Inc. G15 5511",
+		.ident = "Dell Inc. G16",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G16"),
 		},
 		.driver_data = &g_series_quirks,
 	},
 	{
-		.ident = "Dell Inc. G15 5515",
+		.ident = "Dell Inc. G3",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G3"),
 		},
 		.driver_data = &g_series_quirks,
 	},
 	{
-		.ident = "Dell Inc. G15 5530",
+		.ident = "Dell Inc. G5",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5530"),
-		},
-		.driver_data = &g_series_quirks,
-	},
-	{
-		.ident = "Dell Inc. G16 7630",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G16 7630"),
-		},
-		.driver_data = &g_series_quirks,
-	},
-	{
-		.ident = "Dell Inc. G3 3500",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
-		},
-		.driver_data = &g_series_quirks,
-	},
-	{
-		.ident = "Dell Inc. G3 3590",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
-		},
-		.driver_data = &g_series_quirks,
-	},
-	{
-		.ident = "Dell Inc. G5 5500",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
-		},
-		.driver_data = &g_series_quirks,
-	},
-	{
-		.ident = "Dell Inc. G5 5505",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5505"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G5"),
 		},
 		.driver_data = &g_series_quirks,
 	},

-- 
2.51.2

