Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9CD305E31
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Nov 2025 21:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762464088; cv=none; b=eH6gltQlNzbLQ0dP1e+DSd19oW98Or5Ljq+qjNP50UZm1hiEVkZgyB3FGwsSiDWl3z0smyBPC7i0gEfmZqZpAOk6TXOGw6vEnf0w/LPutrVqk85zvens8weqLrMlg/EtDbs6bU6PIWyF3DGl8df2yxczbiu6esTnZt/63mkfceU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762464088; c=relaxed/simple;
	bh=FwLNkRtTJ0ikM5eQQDKNv4zZ9hcnAfdUu1+o6OVb/0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tsBFc6IzWrASewxPk3eKM79mm+onF2f5A3kOy2UZUkjyNNJq7SySDJemOL1ip3gSGph4u48JnAWqacJS0Hx6U8FYqgN9rHMynjT5SvgBgKkSA5YAicvYoqkHUjV36b9fl5MAvaYFLCscUdJi0gFwRzZKIKdKwTZoNMMUTxeUbRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkFqUJuf; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkFqUJuf"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-781997d195aso59922b3a.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Nov 2025 13:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762464086; x=1763068886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0aw0d1VUDeF7yPt0q4o8kNpDsBTJNsxGr/Ot8TJH68=;
        b=dkFqUJufs/gefI7oojiNkMK37ZiU0I5XYR7HrCY15zbUspsLt6zKkar5R0+nsVJD3M
         6A25t5Rte/UMQRPhrCVLUkRk7kqScub6qKiqf7TCTBgjieU5yiA7VTGvBNJ0GYOvOG87
         Q5bxO6nF9esjh1tVmU7s7tkCSz1E39iMzsCyptmv3sjn0/Z4XubvmHJIpX6/56l+mDzN
         959RW8QC5e3qFfoP9mfX4DXXOHiDsI19eWIVnU24fIODnH/YE0Fe53FhNjo/GHaetFdI
         JQgdJTATE4v94R2V3DI10uJbEWaMeaLLOjFunGNGEhAKFG+l6JfFgBVvjdNRVCx1nuRA
         GJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762464086; x=1763068886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n0aw0d1VUDeF7yPt0q4o8kNpDsBTJNsxGr/Ot8TJH68=;
        b=NzaWggJbP87IlqlbKGR+UbmB7ROCPaxInQaO58FM+RkyGnYmRIC9Nfss+icmwNGAOR
         +1m2hx2pwGDTzCdRJKGHr6hlO/jTI9qR9Zy7x0p74RulkEhGL20yLxxgu+5ffSxYEOlV
         gZrkG+JCv/q18fFnmNhbdZdmdopNJtM3kFKQVroItwg9IoKAq/LUcK6dLj/8JGcUxBsb
         uPOzyHrtkCSD+p4jTIPNBSY9r22MaFHDNTROOlWovuWOWb8drT+LZyecu3YFk5dvQt2E
         2t19Z7x2aOIQ6G2oXuz8LEQNWqQWUQU1rurBFZWwm6iS++tHHlMsu7QjWn24MQZ83BQ8
         YwRg==
X-Forwarded-Encrypted: i=1; AJvYcCV5EdZlZfLJIiYAwh0y4ZmTI/UAXkxjfPeZN9arXZSz/UQZiwhHqg2L/cC5DwwjG/iRRinJlNDjx5UqlnYOpPv/8sxj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy4Gz6E+fdDG+fDTo83pPzVPFp7bJmCWnGiPkRdUHRe1g5LVsW
	2rRbhhuD9HJCwwL9ouz295rM4uQzJrvlEKK24O3fMKW2PSLRtxmWdBfM
X-Gm-Gg: ASbGnctnTd9YMQkDXtNb22noP4EFdTR+CvqbRUmhQwK2aDpRXmNannWpVNzacnB7nSu
	ZU2I9U52xpabGj3EcC/tnGuXv0rACqy7d34qeam45i6aZCyIe0CRbAsRBzVkYn2K7HkwjwKHDvQ
	/e7HSdULtRpRDjW2ryeNCBW5UgEzylaBIIs3m/pA1RPBLqvnmNUi/ukv6PDGiL4hXZ4L1/Zkvis
	SZ8V8CwDxlPKy4RBCOBb8/SXEgtJh9mXPSBRbYcCJMfw57WVjKxIj2dzby8KFBU7u6B3fJqNKYB
	Ir5dSVPLsHTC8e6XnowyhOVtUrlOsgQlTjCDE9FgdoWT1WaVuV/aSSKVPQuA83Lf4D1Lq3akmB7
	l6ZgntI7kbzoK5SpwpqQ3iW1PrHLwCSyeOnpHVYZOKurrZFuFJ/TxzaERr8zWEdcyf/gPFILI2A
	zaw5XWkcD1jpgnDxIKiC8MNBvfh9WQv6+3NeOCbYhm4m8BSDNVexj2q75ShCtC24gfPfE=
X-Google-Smtp-Source: AGHT+IH826EutkUvFfzktmcjLwXuQGckXss6+pYKmU2ELz6Vx83zq+dwqtEf8PtHFijWmAc6wuQmlw==
X-Received: by 2002:a05:6a00:4b11:b0:7ab:c5b9:615f with SMTP id d2e1a72fcca58-7b0bd98b115mr1101362b3a.22.1762464085919;
        Thu, 06 Nov 2025 13:21:25 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953d0a6sm521360b3a.12.2025.11.06.13.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 13:21:25 -0800 (PST)
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
Subject: [PATCH v2 1/3] acpi: platform_profile - Add Extreme profile option
Date: Thu,  6 Nov 2025 13:21:19 -0800
Message-ID: <20251106212121.447030-2-derekjohn.clark@gmail.com>
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

Some devices, namely Lenovo Legion devices, have an "extreme" mode where
power draw is at the maximum limit of the cooling hardware. Add a new
"extreme" platform profile to properly reflect this operating mode.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-platform-profile | 2 ++
 drivers/acpi/platform_profile.c                        | 1 +
 include/linux/platform_profile.h                       | 1 +
 3 files changed, 4 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-platform-profile b/Documentation/ABI/testing/sysfs-class-platform-profile
index dc72adfb830a..9bee8deb4dc9 100644
--- a/Documentation/ABI/testing/sysfs-class-platform-profile
+++ b/Documentation/ABI/testing/sysfs-class-platform-profile
@@ -23,6 +23,8 @@ Description:	This file contains a space-separated list of profiles supported
 					power consumption with a slight bias
 					towards performance
 		performance		High performance operation
+		extreme			Higher performance operation that may exceed
+					internal battery draw limits when on AC power
 		custom			Driver defined custom profile
 		====================	========================================
 
diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_profile.c
index b43f4459a4f6..78da17e16d9b 100644
--- a/drivers/acpi/platform_profile.c
+++ b/drivers/acpi/platform_profile.c
@@ -37,6 +37,7 @@ static const char * const profile_names[] = {
 	[PLATFORM_PROFILE_BALANCED] = "balanced",
 	[PLATFORM_PROFILE_BALANCED_PERFORMANCE] = "balanced-performance",
 	[PLATFORM_PROFILE_PERFORMANCE] = "performance",
+	[PLATFORM_PROFILE_EXTREME] = "extreme",
 	[PLATFORM_PROFILE_CUSTOM] = "custom",
 };
 static_assert(ARRAY_SIZE(profile_names) == PLATFORM_PROFILE_LAST);
diff --git a/include/linux/platform_profile.h b/include/linux/platform_profile.h
index a299225ab92e..2bf178bde2b5 100644
--- a/include/linux/platform_profile.h
+++ b/include/linux/platform_profile.h
@@ -24,6 +24,7 @@ enum platform_profile_option {
 	PLATFORM_PROFILE_BALANCED,
 	PLATFORM_PROFILE_BALANCED_PERFORMANCE,
 	PLATFORM_PROFILE_PERFORMANCE,
+	PLATFORM_PROFILE_EXTREME,
 	PLATFORM_PROFILE_CUSTOM,
 	PLATFORM_PROFILE_LAST, /*must always be last */
 };
-- 
2.51.1

