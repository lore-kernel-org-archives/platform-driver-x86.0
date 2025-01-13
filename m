Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477ED23DEA4;
	Mon, 13 Jan 2025 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736774080; cv=none; b=QcBB3Vd5DdiVJrAmkvMO2cusrQnJvnY5IXLWKkgPUax8HPwDCC6tiYqH9hRYe2Dj0Wko9k2hPlzW59Leddn/AHXxf1G5LQ8nqsA9iU3tYDCs+fyGcRRiWUurlNfX6WHB79y5RyVDyDoPpQM4G+1EX4fVvpRr66/4LS36R+SG9EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736774080; c=relaxed/simple;
	bh=y/X7q3uR0Pq8anFoNmm8wvKPTXfmXqNisAvDW4YIwUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TwmzhdECUMOaU6ieO1T41GqzvPo69cHk5r4vtq74QKaqxHrWgfz2kQsK3Ok99c/x4AQGkyt9g7i3TPYB9Hwh/12miYWBHhQ3+Znr9Ifr0YSsWjjIhdbCGQF+Z/wmkgWlTMMYSl1A6A7MZVh6GCm01z84sMLunxOM/Vh4h+vEpI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYYUHB8G; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYYUHB8G"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2156e078563so61615555ad.2;
        Mon, 13 Jan 2025 05:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736774078; x=1737378878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qv4RKzw9CqB7MM0YkUXiTrwn+3MiOkEWaK9H8OetvZA=;
        b=dYYUHB8GatWmtIHPtepjN38gcKXO1LkT5zE7iRUxRe+CsZY0CYTmtOpS0ojhE+SH4u
         NK7RIXz3ZSsw8HyzSzJiClDOub1h3rtHKvi3answkZZAJ9x2m4c8N8tw+t5NEHIHsKEE
         wJp2Lvlrokd++M7Ix3cFDIarJrbz1f1ZZMJQeQKldWcUkSBQRSBDceVrymNbjcSP3jjS
         agymB6DhhgaItD2/IkxWGff42q1p3Ji3zvku1CWvTKmQDjBgLflJ9DMW26uWUYtBjGEL
         gtyMSVyVJFTzN8eFwOylYK5ds7jQg0z40idQqvmlTxY0f4JjJzxStToq1uHHUF6y9+6E
         ruqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736774078; x=1737378878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qv4RKzw9CqB7MM0YkUXiTrwn+3MiOkEWaK9H8OetvZA=;
        b=tvbOB6WB9im0JBO2zbTPFFzkcu6+oDWj9MNOG336ukLcycUSmW5ydlDZsdrR6lWv0A
         U002n34OsSbbw/cWEjoKlOv9sLpgpXTtlLQbqRXzfr9Zu5OrSauLXGNqsfAW9M3e1JHf
         lb8tMVCvB/qW8Q+kreQT6uKw5KqNlvQYo7ayF1Yj1Kx8tcja/rvCBnlwjb6IsnJw7pv2
         8cia7KckS06JdzxDkdeJIZcXy9RUyRLK2SXq+9pwp8nU/Z/y40FGxH+JGB9h/lJWaqsQ
         Pk3/62SowRtXtzz4fIZSL6KYKfc/7sdZCMnovzOWxIKDOKaXsp6PQ9XmfBAFCcFbRP9G
         mb8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKkgsBBMAIjoVPTZA1nl9q/T3BmZiFbq4UyVokH7ReBTe+fdiaolIBywSkeU3srlGErTQqQQe6P8Qo+cM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdHOdH4PuMSYxF8QySBKsyiZjh7Pryy6CTqTIT9t80U4DC1R7I
	tYGYv7BnFb6wAJbkjVZ1zbgbiDP2I5crwwzp1FrkmwqMQMJroScr3hmHdmc3
X-Gm-Gg: ASbGnctaWSsymQjia+FD8JJau/gtqm76XsYaaoTn11P7uW1SETcsMQhFrphUZccrpR3
	m078I9+zSTnB5qM+FVTVJlLE8pfpz0aJmYgFxqCahWfIqpkOt28F+xBYe6tOiIQ5DHkjk55C48U
	dQphuCokX5vOyE3K6sKVrWY1pNrjOvnK+uIHcG4k4tu4Wl3ztePhocRBLZ7ZH6Z/gpd9KvMGeIs
	rxwbN0fEtAr+DMY0li2lGvCylFivvYJYUhFSggt8x+Eh/82Z1V7S8zV+bsjPg==
X-Google-Smtp-Source: AGHT+IHYhUhNqlKYvjm8jihk3Lx2G6OaZV7idRYMQFugBym3ulQTqDGjm2Lzu4pWtcUa1wHah+0ihw==
X-Received: by 2002:a05:6a20:394b:b0:1e1:aef4:9ce8 with SMTP id adf61e73a8af0-1e88d2d5ecamr36550313637.28.1736774078058;
        Mon, 13 Jan 2025 05:14:38 -0800 (PST)
Received: from [10.113.16.67] ([117.193.77.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31840e93absm6961209a12.20.2025.01.13.05.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:14:37 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
Date: Mon, 13 Jan 2025 18:44:13 +0530
Subject: [PATCH v4 5/5] platform/x86: acer-wmi: add support for Acer Nitro
 AN515-58
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-platform_profile-v4-5-23be0dff19f1@gmail.com>
References: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
In-Reply-To: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>, Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Hridesh MG <hridesh699@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736774055; l=981;
 i=hridesh699@gmail.com; s=20241114; h=from:subject:message-id;
 bh=y/X7q3uR0Pq8anFoNmm8wvKPTXfmXqNisAvDW4YIwUw=;
 b=iBRhja9XTJIWXrOh+iZUcd47tnLCiZEWDjToJ2WPW1zuHlQtIo4GuRtp8XNTfwbTYpANrSwjm
 eNNFclFpLQeDgqvR7ox4QKAuMZVuJxcgZYrzlXTPnQDXgtncVFpi0md
X-Developer-Key: i=hridesh699@gmail.com; a=ed25519;
 pk=otVQutD5ZTsEpajsGv/haM3pQj0yofkuYrdNcaX5AUE=

Add predator_v4 quirk for the Acer Nitro AN515-58 to enable fan speed
monitoring and platform_profile handling.

Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
 drivers/platform/x86/acer-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 37f8c2019925391185e1e0952dac563daf923320..04bfa8fe12c2fd9a3c8be8d06f47431f8143d6c9 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -601,6 +601,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_travelmate_2490,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Acer Nitro AN515-58",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN515-58"),
+		},
+		.driver_data = &quirk_acer_predator_v4,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer Predator PH315-53",

-- 
2.47.1

