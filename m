Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583FE17597
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 05:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760332888; cv=none; b=GOjW4vBv1yze7jy3+DXc7cQqtgjkI4m9Vc/Px3RhvpQVZeuNhFUREFY4l+Eo5m5PY/mVLa8GYGztTv+Ze0ZAGYdXv2SMVtyxd3f84wswTBz9scCfxkJuFJuPwJQnAoDhGkX5Vn/Q20Y3CjzX3iIB2JukyGH8h1VXgWjtPmj/iX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760332888; c=relaxed/simple;
	bh=qzVo+7LyZQ7Np+BQqMfvtJ7MzKbh4xb4FvvO+YQ7vDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EXm63LdFKD0pLXO4HNXzrJwbtr43j0xIdDJ/Nana5wYvrrA7jVcezMrIkXiBF1wxHMIw4B2qSyqh9TMfbJloHVJZK3NLU/7+cbplJWHcZYnIKi9t7FdyZ2Y2/PBjxCEomEuq/yk5Tq58W0PoO8sxy0lf7Di3P4WXxc+6TqnwXnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8LqQfUF; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8LqQfUF"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-8e261568020so646358241.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Oct 2025 22:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760332886; x=1760937686; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6gnW+HWmI+v0/T60f2xe+jmnQz86oor0v10hn5S+LMM=;
        b=E8LqQfUFxh80SsgJBGbgb+CUDrnPeV6Udaaehy9OOHKBHKzHDG4tTMydEQky9d1EA6
         JyA8SAl1gvQDYEbUzo/2m3Yat8aCwrrZJrWFMz0qLTusZmNhl20Cb+0uhFgFS6FRoNa6
         V7F5rpu23S8EXsFdUftixCaSNT9P/XMrk0TomCeLchSxOjOiWv9NzOZC/Tslgdiu47S/
         dqe+1D7cwQ1BLKfkeKDgAQpaoMm3YQBI/p1U73BQAfK6jErlVfNnAY4EK2VQjozWBAyt
         hi4aUBB1LZAKOE9ORHRIzApgs3zwSak6vg2HmXeDKl2RqX/hdYBJj82ip6qvMyARefT4
         FXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760332886; x=1760937686;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gnW+HWmI+v0/T60f2xe+jmnQz86oor0v10hn5S+LMM=;
        b=nuqMUZ03Xfagf7AXgXiqShhgAWa/kZC/DyHDl3++o842HquBNZmd/RRVhQm/Z4dsrH
         xqD2I2fr6i49FxgHrv42ub22hFUIOxyX/24TDdWhRIVzLxxRq0ySkASQ7XyWpRpTScsL
         EViPfvSmINO6xrHvfS//gcUSHuVWpGMG8izPo6nOw0D8YtpmyTL7vowIRORY3bQ24tA0
         lbZ1/WbDSoJ45t7bFChQK5r1YbmjfCrLNMi55AXzVc0+3TK5mHn/YP/tQPb9yw2xRYrX
         c49EwRbkzlM/1uW4Vz2Ax/LNRJ+9iBZ0FlVvm66/FdnfdZN/ny3xlXaTT8j0xAe+4bbj
         UcpA==
X-Gm-Message-State: AOJu0YzwVCVH66PIKoBW0191K8PWKgX/RX0dmITAlytZ/WkwyQ7hC/Zs
	6n7CiY02hL+W5O5D5eYxWTQkwk2NDTt5LtSwIwAUv9j+Q1rsQChaCvFh
X-Gm-Gg: ASbGnctdRRO3JI5Fu1IgRaKhdQqiw07YxMkYkib2/eMCoJ4hlJlYbbJPYZUK96jd7Mb
	7detkq7ZCGHgjvUWXjV2s23YN5sCx+dsxPIRqryCj1PU1Q6Dm7HFT3cvUJAOFBdfDyWWUqueD9T
	e8ekgYhCI0rPYeFeEWx44Nn+ubrMcQNyua3QDyHZHkBlh9eMUPKnBeLN5JCsmIflMPgiqF43Gx9
	TQpBO5T91gSrzUSscQ2I9FTHGJgpDS39yl1SCuo7mTvMrjHP67Dry3riaFk8w7zxYmI9MwZHAqy
	mTOwl9zQPf/tBwvYOUtxW7NZEdZzReVg++ymWZKhq8+2rDcELgNZrnoGb+xlMk7nYJfV2pCtrul
	ZLo+Wyf1m8y7j6WgC38+jgY1Ljaq2uJkQLbnq1akqZP+sxvr8nHKgIQ==
X-Google-Smtp-Source: AGHT+IHWD/iz+M+SeJnAP21+zFM+eC3cketpbCHgFzv1UE8edmmlHFuRnvCAk/L0+ktqCi3aPzvlqg==
X-Received: by 2002:a05:6122:3707:b0:554:b927:dd96 with SMTP id 71dfb90a1353d-554b927deb3mr6755179e0c.0.1760332886190;
        Sun, 12 Oct 2025 22:21:26 -0700 (PDT)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d80aab53sm2825311e0c.15.2025.10.12.22.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:21:25 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Mon, 13 Oct 2025 00:21:05 -0500
Subject: [PATCH] platform/x86: alienware-wmi-wmax: Fix null pointer
 derefence in sleep handlers
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-sleep-fix-v1-1-92bc11b6ecae@gmail.com>
X-B4-Tracking: v=1; b=H4sIAECM7GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Mj3eKc1NQC3bTMCl3TFANTS7OUFEujRGMloPqColSgMNis6NjaWgC
 ORK2YWwAAAA==
X-Change-ID: 20251012-sleep-fix-5d0596dd92a3
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Gal Hammer <galhammer@gmail.com>, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2093; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=qzVo+7LyZQ7Np+BQqMfvtJ7MzKbh4xb4FvvO+YQ7vDU=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBlvejwKjTTettctczxw8djBnpWvBPK+bq+ZEbIthiGv5
 /lUdinTjlIWBjEuBlkxRZb2hEXfHkXlvfU7EHofZg4rE8gQBi5OAZjIVhOG/+43hXapdP97eCqq
 SnDi8/iQ3ad/+/nGTnLP7j3M91jNXY7hn9r+yVkfp88+9EOzpm6WpavzhnsfYs+GXZHacVv6055
 dFvwA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Initialize `awcc` with empty quirks to avoid a null pointer dereference
in sleep handlers for devices without the AWCC interface.

This also allows some code simplification in alienware_wmax_wmi_init().

Cc: stable@vger.kernel.org
Reported-by: Gal Hammer <galhammer@gmail.com>
Tested-by: Gal Hammer <galhammer@gmail.com>
Fixes: 07ac275981b1 ("platform/x86: alienware-wmi-wmax: Add support for manual fan control")
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 31f9643a6a3b5c2eb74b089dc071964bd6df8b43..2c4b71b03c264edaffcb0341bbd9e6acefced8b8 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -393,7 +393,7 @@ static const enum platform_profile_option awcc_mode_to_platform_profile[AWCC_PRO
 	[AWCC_PROFILE_LEGACY_PERFORMANCE]		= PLATFORM_PROFILE_PERFORMANCE,
 };
 
-static struct awcc_quirks *awcc;
+static struct awcc_quirks *awcc = &empty_quirks;
 
 /*
  *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
@@ -1680,26 +1680,16 @@ int __init alienware_wmax_wmi_init(void)
 	if (id)
 		awcc = id->driver_data;
 
-	if (force_hwmon) {
-		if (!awcc)
-			awcc = &empty_quirks;
-
+	if (force_hwmon)
 		awcc->hwmon = true;
-	}
-
-	if (force_platform_profile) {
-		if (!awcc)
-			awcc = &empty_quirks;
 
+	if (force_platform_profile)
 		awcc->pprof = true;
-	}
 
-	if (force_gmode) {
-		if (awcc)
-			awcc->gmode = true;
-		else
-			pr_warn("force_gmode requires platform profile support\n");
-	}
+	if (force_gmode && awcc->pprof)
+		awcc->gmode = true;
+	else
+		pr_warn("force_gmode requires platform profile support\n");
 
 	return wmi_driver_register(&alienware_wmax_wmi_driver);
 }

---
base-commit: 3ed17349f18774c24505b0c21dfbd3cc4f126518
change-id: 20251012-sleep-fix-5d0596dd92a3
-- 
 ~ Kurt

