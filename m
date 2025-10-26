Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EFC21D585
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 08:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761466368; cv=none; b=PO4Qas6DCkGO7yS1uJd7u7TSs3OHOFJZFQW36PkGVqiIr9coj92j8pE3dY5xg/Oag3VDHra+AIH27DWmingYXokzMaY0uZzWYnwFkmaTsD6XFryuiGUrduJd/+yihx9Eyy428YPk8VfS3xP1kRnQpz4tvOmSZyD3yd4iXh4AIfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761466368; c=relaxed/simple;
	bh=KfKya3ApWAx7jEzc+tOxx/V5zzMsaSdiqYDUBXDK5Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FL9YgBoztIV8UouB4n3sh3s+1nXkSIsTTg7InvMDFZ6pH1i4Gyxov4lvBtxZ8fjSeSoAD8dxCcreClejzeY6InXpNUZLgDY3y9ZL+3a2XcS3bCIbdo55sP+N8/gEeelUWdrNdlw3m6q0pRuwIb74rKA+Aa6OOjpkAQkH/zWBjjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m16Ombbe; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m16Ombbe"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-330b4739538so3614637a91.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 01:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761466366; x=1762071166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkzT8rhILn4Qaqc6zAgBKines7TQJhCcdPvDF4nghIs=;
        b=m16OmbbeNBdH7tl0pbdJjpRNXV8H0HXm1gCgoBRdq+n6ayfQK7rksGMNgFAuoDMqME
         5CQIPD06ez00bMznBwkthsCpY4pZBslVg0nTWpNLIp1zxxX2j/uA8jnuWytztXCedT5O
         8fjVjFYKKNKHUH8gbeHsI2GUlwdLcW8TwktZUzZ5zaUoZujAKz8mxKFu3hVEsTZxy2nM
         77e9wnWD6ZBUPdDgYWpoyaibgVmzOF18GW77nlvpevJCUBxqI66VRka0EJs1XRd1zXNH
         o+996Vm+auguJ7BW+ncEib165QwYUJ22Luw8AFUYTUCvJBscn5HaFMy0gKSVC1FQAugQ
         xo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761466366; x=1762071166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkzT8rhILn4Qaqc6zAgBKines7TQJhCcdPvDF4nghIs=;
        b=rWRN8ylJLLtS5r4BNCLwg0HuTJdmo3uMJGASy1O1UrPXER3NfzAu+bgE/aBR38sx6j
         ZMTg2N+2cZz4fOqX210sOrIF9+xTAc2eEINiuOQPCAT5gvqh0N8fBmnzk1+iHY+xqE/8
         HgZRCNpNk95CDE3G8EnbTdY5bVKeFAVA8I40BjTSA8NC1t5EVFRMuRo7/DWeJWy52oIk
         R/b3zva0CJ5Dhx++re65GBlAczmcaKpkMgfTJBsUz35U30XFHD+AC5sqWlKXL6Bqup6E
         V8PoKzdWc1OpO5iWM5q5bXExWREbUCMli4/6bINPVpXAuf+T7hh5YiKa1EhfniE/7uXJ
         bcdw==
X-Forwarded-Encrypted: i=1; AJvYcCUN+lnn0ljmWb9AQOObWKV/M5pPEnATOygIzrRO1tABLjwGNgWQ1tn3Cfg6XNe6iJJu0zoT3HXPcSeatX/ewjJ1mhGH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6GFRbDjKFBCXWdbSApfzI2/VEBlSphLqNg7Kg6Ek1L6J0dFk5
	RW92xJFuRkjvCWDgDGpXZ/joFKHMCCFSjWz0p0X46P8jbBuvk9UI/ylY
X-Gm-Gg: ASbGncsuOWVCNkJwUMIJsfBQelCizX8vfHUYcKgA420EG61aJ59Hpt9ucnvtR/EtKL7
	DrDBQK73vqi/MDDJNri5FXGRr6T901EcBJwlvO8PmaeF0NxdNvlnKlBRtVEPITXHSmvKyH18diy
	tXp+eDtxz14W1IiHCJiFxLVPCMd7ZWIgBzh8TZl6EuaW4Y8vn6xsSg7/TxuKdR2Qhn4+i7L/Zel
	qpaXCflZcZQS/z0q37ZhzUqqP4ixDO7pcl2D3obpCP9KHZGkVaP5bSeznUwXiJhtnt+4xYIjoH9
	iscQ/RFR0ig2+Gvh+DHXDHxb9MTfFthYed3L9Oig5nqzaEvjJ253qnLJQAvRRxF3btqMIGSzbyt
	LRfaBmnMHHKkWEPObZ0FBYJXvTosrHbjGB8qXZh5B6zMN1L7FfMkciCc45qOIPqByQcv+XrAhZ6
	YVJBB+PXwkHcKzE5GUyYXk7OTeFSWCmmQm6pnf5L0OhbOpLP+wvhkuJTspLmhO63Wpkt8=
X-Google-Smtp-Source: AGHT+IE5idy8ltBz4yyQv4LyCXJVQoIVOtH4PVAtTVzDIlLpQ2ipbqC0Mv+dwtrFwZLdO15KZ2mv4Q==
X-Received: by 2002:a17:90b:17c3:b0:33b:ae39:c297 with SMTP id 98e67ed59e1d1-33fd6502cb7mr9996760a91.16.1761466366364;
        Sun, 26 Oct 2025 01:12:46 -0700 (PDT)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fee8014f6sm2374654a91.0.2025.10.26.01.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 01:12:46 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
Subject: [PATCH 1/3] acpi: platform_profile - Add Extreme profile option
Date: Sun, 26 Oct 2025 01:12:38 -0700
Message-ID: <20251026081240.997038-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026081240.997038-1-derekjohn.clark@gmail.com>
References: <20251026081240.997038-1-derekjohn.clark@gmail.com>
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

