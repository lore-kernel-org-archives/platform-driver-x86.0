Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF4A1E8332
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 05:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760333206; cv=none; b=hzf0RmfnvmhCNFg/Wy4r/kpy/q5ZGsJYrYpCjJy7/L39HTwuy01aB4W44UvXVvIQeiqlJ7zmPgjZEnc4Eeyh9l0XJlrxahX8Ll6OxoYp+jnJErr8YgmlFDxiu084bFZGQiglFh2dSPQBoJOQ/eNksQ5jpMzU3sVCfWKQ9smk9YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760333206; c=relaxed/simple;
	bh=bte+/wVXcSwCx7MOPocExUhSsc8jEuDiXCklRhPJ27Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Sql1EHJSXvRbhKFG59IZdryceE8DwlMD59cq+mQeeEPlFB3YW78bMrResuarXU+0lb5ogPYvWtLCRqPSjbDQ6nj2oZP49j8dj4R/vQK9i3/dz2d+bM1+VJc+5PBPCGURWgn3r5xdgyA9iJRLKSvT4vI/5EbJO0Gb29TyLhgnKic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koPUogAc; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koPUogAc"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-554dc795da7so710150e0c.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Oct 2025 22:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760333203; x=1760938003; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vf/bbB2S5/yiMGyiJS9WX49wXVFc70s9KvXRbsVke5k=;
        b=koPUogAcFjaXU0mvqo1vdCrhXDgRQoj/+6lZZUDDcGugQ7pgKKYKqje597SY4/n0Qq
         1+0s9JckCGE+gJ4/V4lPquso5oWb17zVF/tJkJB/NIR0U7/pgMtXV31427CHTeWPpYqQ
         vl2M/CcInNEif7Iu3UMOl++44yrsmrS6+E4GeHcIvZCyuLCbZsrcr0eQtcnJONdtH5Lg
         GoJ/0BogwAWJHoUO9ZpiFrZEvdE4nwhI1VDHhT4iN7GvelSIaSaTYfSYZMCygYnpuZPX
         Frc0Fz98m6jR+Cve3rJaQnqyy9gNBdTvNhCRVAGY1kqNAlIcDdzp4UGPhGdcAUuG4duP
         DalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760333203; x=1760938003;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vf/bbB2S5/yiMGyiJS9WX49wXVFc70s9KvXRbsVke5k=;
        b=ckaw1xZxFhhrYvEWRsZwqjzgqSwen8RdBH9mUgoC5krl/aGD4OdwhBhmo3S7VNsjry
         mgDs6T7W5FYrHvm8gt3/AYOat3z6n318RS4pOYXcjTtEmLJ2QHDIVDyjqJpJxW1bKi+E
         g8oPHFe8kX6GI0bqUb0xa4rP4RyYG+HoPGSGlsu8DDrT/yhYJ+Oin/CD311Dvh4+mPLm
         gBnOj4GGdOiimAtveWF6CAOe2nhMKYD88uIPisUl65vxVwAat6FE08rAntNw0wRNo0bl
         9YFgJK3Rj2bg/GwGoUHIbxuh2XwwcSTcy4OrE7MgLLtJk84LARArd1kc8RgwuRHbx3/n
         uJdw==
X-Gm-Message-State: AOJu0YxWsUwfJxUg8413MGUN8VxFrlLuBeMFmTVoT7umkENfP3KOph1j
	hywzO/+luZJRLwm+A2qvzKWtthYoRYo2NN+rQZkolcuvDvS6ftvWfc+v
X-Gm-Gg: ASbGncsqjC0PklgQhFhwUmeRLmiS3nch7QfwTb08TuuL34RgknVU2bmVYefP8BxsSi8
	14wGrwydvN3lB84h1M1JdxNqdowEdYQOH7tIPwKjeAmQC3Sxm5lnl9Cycg4AIDfj0pDhq29yMhX
	PiD30H9l92X02DjyfJ/FOD3kTXYD5Tp0HwzR+sS+MVTJyJ0FZXQpi6smUhWQgdhN6EnDw30vetX
	e0I9KYJmlHVYC8gdyuK27XX8NQCvdS6KOMR73mDl3lBOkuO7R3rkiZTtf5fSF83i0o5ZD4hbn80
	HPkEP1DRvqVVqSEl6/hP20a7J72JEJSYWbe/pf0nKuhhOV4nWDH9PA3eZD4DSCplWKWRjQJaUJ1
	JptS1cLErkZ9ltSu/Jw8qvcuR8w+Q2rmDOaJyk1KEUbA=
X-Google-Smtp-Source: AGHT+IHxXC+pCZQx+aXV0IlhjLPkLiyhSlWgyNUpi8Iml6vF4L9jhh0Rvj5DdpwJ8PedQvRsqfXzrg==
X-Received: by 2002:a05:6122:2a0d:b0:554:afe3:1fb1 with SMTP id 71dfb90a1353d-554b8cf023dmr7141600e0c.14.1760333203045;
        Sun, 12 Oct 2025 22:26:43 -0700 (PDT)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d80a456csm2823171e0c.14.2025.10.12.22.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:26:42 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Mon, 13 Oct 2025 00:26:26 -0500
Subject: [PATCH v2] platform/x86: alienware-wmi-wmax: Fix null pointer
 derefence in sleep handlers
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-sleep-fix-v2-1-1ad8bdb79585@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIGN7GgC/03MQQrDIBCF4auEWdfiGAzYVe9RsjA6TQaSGDRIS
 /DutYFCl//j8R2QKDIluDUHRMqcOKw11KUBN9l1JMG+NiipNEpUIs1Em3jyS2gvtem8N8q2UP9
 bpDqf1qOvPXHaQ3yfdMbv+lPaPyWjQGHU4BCHjpyl+7hYnq8uLNCXUj56xq9logAAAA==
X-Change-ID: 20251012-sleep-fix-5d0596dd92a3
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Gal Hammer <galhammer@gmail.com>, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2073; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=bte+/wVXcSwCx7MOPocExUhSsc8jEuDiXCklRhPJ27Q=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBlveifKcc/+nSOSsjfYylpj8yOhFKW5b119Os6ohc79N
 l93wV/mjlIWBjEuBlkxRZb2hEXfHkXlvfU7EHofZg4rE8gQBi5OAZjI52uMDCs2x3aqxHp/169R
 v/Bx8tVU/YU7ArkdNa/7VL67tj/Z0prhf4ik59GDG3/LRu/9KNXfdWJOwlGbyK9/vnYX1z5WUnd
 NYwcA
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
Changes in v2:
- Little logic mistake in the `force_gmode` path... (oops)
- Link to v1: https://lore.kernel.org/r/20251013-sleep-fix-v1-1-92bc11b6ecae@gmail.com
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 31f9643a6a3b5c2eb74b089dc071964bd6df8b43..cefeef84d85d111e9cc15ebed35fb83f03c41c7c 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -393,7 +393,7 @@ static const enum platform_profile_option awcc_mode_to_platform_profile[AWCC_PRO
 	[AWCC_PROFILE_LEGACY_PERFORMANCE]		= PLATFORM_PROFILE_PERFORMANCE,
 };
 
-static struct awcc_quirks *awcc;
+static struct awcc_quirks *awcc = &empty_quirks;
 
 /*
  *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
@@ -1680,22 +1680,14 @@ int __init alienware_wmax_wmi_init(void)
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
 
 	if (force_gmode) {
-		if (awcc)
+		if (awcc->pprof)
 			awcc->gmode = true;
 		else
 			pr_warn("force_gmode requires platform profile support\n");

---
base-commit: 3ed17349f18774c24505b0c21dfbd3cc4f126518
change-id: 20251012-sleep-fix-5d0596dd92a3
-- 
 ~ Kurt

