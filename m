Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CD6335087
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 15:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764256576; cv=none; b=f+B7tU4S79uhdiAtQ1RSiVv/tTSvlO2wjmg/RbrMQP6HTaO/9fRhABgsG0i5mzVjdQ863buLfwwJ5FqIUdg4s2BC+79dh+vAzI+XMtUMi9U4Xbz0BC4wAIEVon0/k0vU0KWBcUjmCabUNqUDvPEDDF4Cm+IP9EvjS5TpXmqgEl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764256576; c=relaxed/simple;
	bh=AWNkJhYiQSm4mam341FTvs4ijlPyZ/HkhkFPW01BwM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y7l0oxiHXn3Xq19YG34JzbSLN71wTvXXOfRXsyzbMQ3vWQ5Epxd/oh54Zp1ED533fVfNZhj6sRWfw25aSm/0n1rT/MqFKlM29qxfxGRZYRLwF36GMes1lAZcee55KnN6937jwsQDbJfi7dSIx3r7NPsgLQDZESeBHMPTCU1tO0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVycLHNY; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVycLHNY"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29806bd47b5so5797075ad.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 07:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764256573; x=1764861373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FcvRrylsz8y/5M5RPfO3ICptGfI1sgN5Cn3FTmzcBZk=;
        b=FVycLHNY8xRLuaaqDGGv2Zi6HW4Sbk2XMb2nyCU+fm3HVx/BU3jtVS1KLz9TfScYPQ
         sypqfTAhS/chWJ5wOnypgCO1e7inaDPeuJAT7RM4s/UyL8pmlwNwOI91RxPJ8inoT1JT
         c+ash+G1ygFct5VJFbeI8BxQ43oXFc1qj7O4FQ9251vledxaVMmdGJKVKwTeFuYx7yWz
         Wnf4wCBgwnckcapMPU9KrB+3lN49FGHa+plG+kuHe0CXGOWWAhEMMxI9y/I0gcySYHhc
         Wwpl9ZHUctweesnOjP31F6ml9VbDiIgM+wlL4JW+dV41ZblrWSu5FMitKKgRtXwFD3+l
         n/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764256573; x=1764861373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FcvRrylsz8y/5M5RPfO3ICptGfI1sgN5Cn3FTmzcBZk=;
        b=wRaVmtZgxwx4udd5zbeJbU9IZDX3QpxHSgBMWxd0Qx+QYxuw0wriQLTTwfu5x0zU/9
         mIguSFhcnufQ+9rq0a8qBTd4WWJQ5Ojhzoy9nRdNjYcfRK4NKUdY7+Y7kwB8MH7pEcYF
         MkKFfEAd7QSCwHqtnm4kT+/Ug2JheBv4B5J5Rbu53kt2Hjpbala5MguhziHrkQdS5p1a
         h0m9UMATS2fx4NHIcn/Di2ZPfxc6zQJ9KOs/NYrs8Rb/X16a7v1VnDvoS16Eacl74qVR
         pR8DLbrS6gRabUHRpwb6XJAWKZNYZ6uZ6AAlz/qg50nRQZYouQ57HEkIL8bN6Xld3wec
         58rQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3Oq/drkY1142cwU+jaWVeIwSH2Xbm3dnoc6GqhigYPbFK8stHszdOZSpd4781fkVGVgvQSL63wDrb6MUXKIC9pRXm@vger.kernel.org
X-Gm-Message-State: AOJu0YzXegCn1m8ds6AwHmNeRTVNGiIvRBvc3422aQHJc2HIGdKWGntF
	+JAzrOJsVfF12Hv5gJ76+dfM6yxbFbNoPTRWs0Ddhxc5vATCaUarJiwt
X-Gm-Gg: ASbGncuSMm8EHXxm32dowLs9E4h9Q44DvxK4eYzgzYt9sSzUj+egIWhxdw/dp5SGIax
	cIR413K3nABqSml+ehzX4COeGgyeDvuI+g0jEwsrWaaXbxMZL6R5DbckJnagVE8sXTNvvKq4dea
	MZhSpMg1jrB6BRrBOE21DYoNC44Obxc5DuMgXu8kmRz6Ca13uT0XuJkDT4liwjJ1BvSxi+N7Ijl
	VF70BYveWZlNC2cbeoK/6wFsVo6aee8kx7WRod/vD/oq2T+eoxg5eHKUgBdO+F9mq4m8NfiDg4J
	QUEtmdtd/XLB5dV464aM5XDPW43+KEh4kaQXq1Z45xBZtYmdUaQk67RLq5rajmWchU4BzCmD6gW
	f528iQMYk7PqX7cKu9T/y0dyxiq1c0U771gydrxzCUzWE20UVNgyAisx7tucMPipnDC2Boha0yQ
	K7Mu7bX+ArAgGzoUSx+ziv7L1T2gLPbCaRwklEWiJ4afVwYitjre3Kshzxv+Yr8qeI3pvbOJSNO
	NS6Cw==
X-Google-Smtp-Source: AGHT+IFbJD3W3TjYyXHCl+ByEYJBSKUdDrYv+tvqK3Wa3b2N0x9VAT+uS1rulv/XgzRItzjJ76/F1g==
X-Received: by 2002:a05:7022:438e:b0:11a:51a8:eca with SMTP id a92af1059eb24-11c9d812055mr17767856c88.18.1764256572310;
        Thu, 27 Nov 2025 07:16:12 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb067088sm5099656c88.10.2025.11.27.07.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 07:16:12 -0800 (PST)
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
Subject: [PATCH v4 1/3] acpi: platform_profile - Add max-power profile option
Date: Thu, 27 Nov 2025 07:16:03 -0800
Message-ID: <20251127151605.1018026-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251127151605.1018026-1-derekjohn.clark@gmail.com>
References: <20251127151605.1018026-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some devices, namely Lenovo Legion devices, have an "extreme" mode where
power draw is at the maximum limit of the cooling hardware. Add a new
"max-power" platform profile to properly reflect this operating mode.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-platform-profile | 2 ++
 drivers/acpi/platform_profile.c                        | 7 +++++--
 include/linux/platform_profile.h                       | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-platform-profile b/Documentation/ABI/testing/sysfs-class-platform-profile
index dc72adfb830a..fcab26894ec3 100644
--- a/Documentation/ABI/testing/sysfs-class-platform-profile
+++ b/Documentation/ABI/testing/sysfs-class-platform-profile
@@ -23,6 +23,8 @@ Description:	This file contains a space-separated list of profiles supported
 					power consumption with a slight bias
 					towards performance
 		performance		High performance operation
+		max-power		Higher performance operation that may exceed
+					internal battery draw limits when on AC power
 		custom			Driver defined custom profile
 		====================	========================================
 
diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_profile.c
index b43f4459a4f6..ea04a8c69215 100644
--- a/drivers/acpi/platform_profile.c
+++ b/drivers/acpi/platform_profile.c
@@ -37,6 +37,7 @@ static const char * const profile_names[] = {
 	[PLATFORM_PROFILE_BALANCED] = "balanced",
 	[PLATFORM_PROFILE_BALANCED_PERFORMANCE] = "balanced-performance",
 	[PLATFORM_PROFILE_PERFORMANCE] = "performance",
+	[PLATFORM_PROFILE_MAX_POWER] = "max-power",
 	[PLATFORM_PROFILE_CUSTOM] = "custom",
 };
 static_assert(ARRAY_SIZE(profile_names) == PLATFORM_PROFILE_LAST);
@@ -506,7 +507,8 @@ int platform_profile_cycle(void)
 		if (err)
 			return err;
 
-		if (profile == PLATFORM_PROFILE_CUSTOM ||
+		if (profile == PLATFORM_PROFILE_MAX_POWER ||
+		    profile == PLATFORM_PROFILE_CUSTOM ||
 		    profile == PLATFORM_PROFILE_LAST)
 			return -EINVAL;
 
@@ -515,7 +517,8 @@ int platform_profile_cycle(void)
 		if (err)
 			return err;
 
-		/* never iterate into a custom if all drivers supported it */
+		/* never iterate into a custom or max power if all drivers supported it */
+		clear_bit(PLATFORM_PROFILE_MAX_POWER, data.aggregate);
 		clear_bit(PLATFORM_PROFILE_CUSTOM, data.aggregate);
 
 		next = find_next_bit_wrap(data.aggregate,
diff --git a/include/linux/platform_profile.h b/include/linux/platform_profile.h
index a299225ab92e..855b28340e95 100644
--- a/include/linux/platform_profile.h
+++ b/include/linux/platform_profile.h
@@ -24,6 +24,7 @@ enum platform_profile_option {
 	PLATFORM_PROFILE_BALANCED,
 	PLATFORM_PROFILE_BALANCED_PERFORMANCE,
 	PLATFORM_PROFILE_PERFORMANCE,
+	PLATFORM_PROFILE_MAX_POWER,
 	PLATFORM_PROFILE_CUSTOM,
 	PLATFORM_PROFILE_LAST, /*must always be last */
 };
-- 
2.51.2

