Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A52362AB3
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Dec 2025 18:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764960649; cv=none; b=TA+CkbOpQglkCUSt+qPVVy3g4RP2ffrVGBWCwiDhjNBlO20gtbQSwUmcV40Bpo7wNzjvwe+IdR+SsVb+FJ9iUw1qoEVtWuO9AZZHNBvVCCwuqIdRffexTNhHsGund7uafYn2OHJsaV8zdYEx8CC+UFVJDH3af0MsDZQZeJUxq+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764960649; c=relaxed/simple;
	bh=N3KeSn5DhptMETPek/UBNqndVmpY4DeybLgH9xhnZ08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QgnXs7AeXD04LC/fb30ljymm33hRAuzAeR1Kp0fZnF5MibEXkBDvN+wpIai73klnzJzROs42vjtj43Gh0kWpvS6xFbgnjQyrPkn2BMdOgZUrZ6tPlD0NymU6YXv++u4/hJ3l/uMYwt6aTly3eDuJDkFj+UspysDpOh+3WXIPRsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1OX2jc+; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1OX2jc+"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78a76afeff6so33809077b3.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Dec 2025 10:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764960645; x=1765565445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VvqenfVK6YXYxWcW+E1Ogd+5OX6yiW3pCxzW+6ISCU=;
        b=H1OX2jc+Q+LAs9Hl+QTMtCqEq14FEvR0sQbQ0HcdkHbcT/GuxHqQFulNfpDp2cqR0z
         L6UEPv8kl+c/SIxGeJ8o5e0ZBBzvG3aP1XfR0AYdpM+hqhl+3yijjOnT+wBVi9Fiudg+
         g8+QRtIdGEyfTjKHFyTUk1umiRthVtvF4vw/d1F7eFex77GGBf1zt8pk8eFQ+ftWCvhV
         a86jZqCr3O9ASdAg/uphoYCQx3IX5TJeLY47TxzFQTbX4sn/yCll/46DPNmZLmw1S4+J
         0TKfMwXoZ9C0+KaBH0kExG34RzFmgyGRP/3R+8dSf0nRmIY4qFdOHqvCPUPmf2i+dtki
         w86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764960645; x=1765565445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6VvqenfVK6YXYxWcW+E1Ogd+5OX6yiW3pCxzW+6ISCU=;
        b=s8BviRe6sh6cnN2IXfC29yW/j8PrDmOdiN+4nlP1MsfnTBRpPL+9q1jcem1d9lT4gr
         tM9t6TjNLP9H7E8lwMrErtc18ApdWhQDxm8PuBJsTDyXJaREODBvUBTiHIw8HLawujEf
         jaMCYlrFblVqf6gjlKz0jp8XiryPn90oqLjdhq08zeX4VHuJr+9ciqqKzKaYuiB5eOQ5
         vr7eMxk7APp2Bl/Y/JCeDXn2OKGCMas7urzu1ny644x/okfGuXvDc2l4G8UyOMLUvQe0
         pfj53LfH9X/b9X94uG26EOQTwiGwnrIe0vQbmBIML1T+Jxx9Eps7m9IVX64gXLGHrWl7
         ubNw==
X-Gm-Message-State: AOJu0Yxt4iK2i52A7akcDpwdDoWosTmgsaUexLfQcNAI3qia+NqYres3
	yUOlYMRnchesZ0qNBwTEwBU/Gu+gwXC8My+eAKEUSYa4ty7gg3yQFX7V
X-Gm-Gg: ASbGncu7fW8o5RPN0Yp14lY7Vg2CGDSifiasXo6Lq3BsKF7y/52znOItsqQfCcIE2fo
	LfzF1WHq2tGwAeRN5DUKq9iIfV4frecJBYltt8MfbDjLdTQy2IbGfKdz70L1MzkGlvA8D4UlAef
	pAZ9JpQz9BuA0j0pUv8UrmqmciLt3FYQnMCXn1EaPWCHU0N1Kiy7E93cvTAu1iEHz1Kbwu9YfWN
	3LfPCfvNpjYYfMJ7I+FxEU8CAIPFUkVevOn9b3/ERbAegKDLsE9c8aEvaVfObj1Us+fi37smiJg
	PqlcFx+B4sNS6GX1EDhS+snITRZKlD7xRtCUBsV49zNBWPWe5ZFQ38oEn/+XIs/X7wQU2kgRj9j
	HRGAgI9yREgUw6l+0WEh0++Kpxfh4TxmELa5GiLr/LYvJW548kytOpfPYp8P6ddkomvchJMQmcK
	DYfiOUxEuSa89a
X-Google-Smtp-Source: AGHT+IGB9Encw5yA+TZ8NKnSkIJJq0yuc29F5NYiqKYNeHPI1ZukYjqakGBdOTu6uAuvLh1gmML2qw==
X-Received: by 2002:a05:690c:4a11:b0:787:e3c1:8c with SMTP id 00721157ae682-78c33cb3eb3mr687197b3.64.1764960645500;
        Fri, 05 Dec 2025 10:50:45 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c2f0aaf83sm4586407b3.32.2025.12.05.10.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:50:45 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 05 Dec 2025 13:50:11 -0500
Subject: [PATCH 2/3] platform/x86: alienware-wmi-wmax: Add AWCC support for
 Alienware x16
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-area-51-v1-2-d2cb13530851@gmail.com>
References: <20251205-area-51-v1-0-d2cb13530851@gmail.com>
In-Reply-To: <20251205-area-51-v1-0-d2cb13530851@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=N3KeSn5DhptMETPek/UBNqndVmpY4DeybLgH9xhnZ08=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJnGmo01oR1x2VMnzl3ncMHlLscsh9Z/+8pKgx9kPuOSe
 ri5gseyo5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACbCJcLI8FX+sfXfJtu1QTGl
 Z/44qbb3VEUn+TyLytav+LJuW3TVU0aG70zZ1xa9YlB4yZ7NkTf3n032oTbxZw9y8+9MUFy8xYm
 bCwA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add AWCC support for Alienware x16 laptops.

Cc: <stable@vger.kernel.org>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index b7b684fda22e..baea397e0530 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -177,6 +177,14 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 		},
 		.driver_data = &generic_quirks,
 	},
+	{
+		.ident = "Alienware x16",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x16"),
+		},
+		.driver_data = &g_series_quirks,
+	},
 	{
 		.ident = "Alienware x17",
 		.matches = {

-- 
2.52.0

