Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8FB306B1A
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Nov 2025 21:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762464090; cv=none; b=bfHNRz9ZNO9hyV7oU34hiu/k91Q0MwAsmdXUFBRG1zqoDfIRXQIIzybmBwRiehq19+Nm4WzajVuF1xtOuWkb4zaMHizegzBzeTI6BiVrTtkSkR7ppGRiJ4vg3jLyfeCIrZezHgYpUJLHoT2n9GhyoBb5yE5sWgJUrt0ZtS+xXSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762464090; c=relaxed/simple;
	bh=gQDolCcuD5vIgWYrJOYDk+Yjb2OnvDvhndDe6j5Tii0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4scbbikWZQZzV7NpKPQMdd0zvU1W2cKgWf18GK2lb/e1VoMrkeUSAvuAD2DyrBY5nPxtyt0BJkwEcJxGxTVYBmWdsEPGsxnUS0kKUbmCwvff7jMljFmSxRPu8afvcqWXrhHLGJE/fULsDlSxQkyUtfNPva0d1jL618aq1m3itM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBQIWIhH; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBQIWIhH"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7ae4656d6e4so127843b3a.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Nov 2025 13:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762464088; x=1763068888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IL4It3kAEsZc/+9OA5N/VLO1Ag46m6s63x6+w+Fz15Q=;
        b=fBQIWIhHOZntTRKDfIRCxhUlhUY2OkzdtfDXOLxkT/ImlD28sMMC0M27BP5A1MCQQo
         3QlLzufwdZQd1AKVUaY9GyIq5x8zDvaGa38BHLFGHrB6c11j69fvAnuK3Bv6CfGavb5X
         tex2e3OlFdmdOC9vfvBISATt8j0qkHHgtiwOVhfQfwmHcBZIsn9G70wnWnprRzer0H1o
         D9xhpFNX1oFq99k9G9bkPNgQhykc6yHYCt02O78jOyJ/ZvVHBFb6UIbzvHbWDfiATFxx
         EpMRJAWShLfPw4zGk+R6B2qGU7lfR7mA4rZJfv1OdCsNQXA2wi1NvgsVWnXGtzu3QEb6
         zfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762464088; x=1763068888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IL4It3kAEsZc/+9OA5N/VLO1Ag46m6s63x6+w+Fz15Q=;
        b=xPNXjZKqs7oTbJCn/F1HGO8EkNT6MppdPBTHCvTIKnNciAu+osfVpKKYdFDlsxypVY
         hPOldhdtYMMUKABCpyQwfzrm4/8/CLvvrUq3rksqatPqUr8ruG+pgIY4sRrPWt3v5zJY
         rAgM/sBQKAdD/vi1kRb1uZLeOr7E4oZVBYJYnMQ33DXXTgdpejb8it9q07JvLh4eYXm5
         Gt83lhX54naDMmsz1Sqy1XHfwdcYVkLrmqPG4+wkiLTZaPDJdoppd2cu5mXAim0FHl8X
         uOjRHP7CFpk1kIO7ONVifwTlhtggrj1a+5ychxCEnfKuBUEvGPAkV0QOCcZdjVEQymSW
         vzJw==
X-Forwarded-Encrypted: i=1; AJvYcCXK9kbdLWjeW+cQnbm4hmTLtxCHxbKSLyEsYmnapedUujtLu20R5LVdmFjduY+iJEuqmn1FFQenh1oBLKDP9IaEBeav@vger.kernel.org
X-Gm-Message-State: AOJu0YyVjzTxMraBEUjozdWB/H4uZvxymmf3NHTPEJgc9pt+OFn6gFhk
	mKX5Jq+mKp97LqPTWQ/T/z1NuXnkDXosWJ65Q8qdAJzEBT7CxchrPQEX
X-Gm-Gg: ASbGncsPzTkjtHEvD9s1/PGBhwCtAWsRvSNnAP5sqtX06ydOOghW2QN3FUCtnPDpMRZ
	mDXIjUgO7K4phZyQbB7e3TiXkJ4TzQKHH0D2pS4/WuYLOji7HWhu4JHOUJg/WykYX21yUoUbynQ
	YwvgWrW7IWcLfJX7SkqS1Ht1zYk7aP3NoEfua9+fSEaBvU0dFFQQ0kGp+2WmTn9yRfjuhYzPBys
	uqbzEU3TnxRArGvnUZG9fFzovHCIsqooCG2DPP2qhXhl+WGFjTJpl1fhJWlovtFF1K5aUnhMgb2
	kEIGQjGEXfbAZ/v1BK0j6QgG9z0Ga/FwBx8W70q8/0oCyhTD1OXVLb2y5fVD2OF8ercq6AmDyd2
	I4izUvtfV30Fm8B+AoW0Zjbl5qTPTjJ9PnFtXLztwkK7yE++up5/JzHiUbH3//uEO5Foe56FdAK
	Pnx/fTuG9sw0VDri6bLk0ELh+/UGPG8YIZrd+8XoV1UDBOkz8tuMpPtekUVHoYzenbZFY=
X-Google-Smtp-Source: AGHT+IGnZ3ioVBRnnG8un6BDnXO8Duun1EVSqTxxH6SbHC2rrOCyZqeAC5RipHrEQAaoZitkIkBHEw==
X-Received: by 2002:a05:6a00:17a9:b0:7aa:e5f2:617d with SMTP id d2e1a72fcca58-7b0bdd76f66mr1178498b3a.30.1762464088459;
        Thu, 06 Nov 2025 13:21:28 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953d0a6sm521360b3a.12.2025.11.06.13.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 13:21:28 -0800 (PST)
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
Subject: [PATCH v2 3/3] platform/x86: wmi-gamezone: Add Legion Go 2 Quirks
Date: Thu,  6 Nov 2025 13:21:21 -0800
Message-ID: <20251106212121.447030-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251106212121.447030-1-derekjohn.clark@gmail.com>
References: <20251106212121.447030-1-derekjohn.clark@gmail.com>
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
index faabbd4657bd..bea4d2024628 100644
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
2.51.1

