Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B84142C518
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 08:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128945; cv=none; b=T+v/Kf8K0w2s84k4Qs5dEvdTKhHBe7rgLucT3T68IjO0WLSnPqsZzxk87YbmIJVp1UzQ7gTeMYtbOJsBsGzkyPlwr3186PqwfZZYGeSgXj67ZIJn6bs9JVWsv8P4TA0Rqcpr5eeHapDn/JciToAnsYsebSXAj6jLQi2RxuRBI9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128945; c=relaxed/simple;
	bh=4cQw0pq/jjepvlo9ohv0JOqq+XlV7DYQraIl6fNArYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SBr4NtagtyP8JS8uzUnhh7qiIZILMziONlGH0KeJdyHSaT+BQoICK6eJ+qTfiop/TSVreOzhPt7PA1ZvAy/zKDgV9sDMPlVR/r/NFDe7iRW/FzqL7ZfoGMtWYp/3W0iE8DLPd48WKzgoI017FuY0iwVLb3Pl5M2+Opa8Ty+ita4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLi0iwLX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLi0iwLX"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so4085075e9.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 01:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787128943; x=1787733743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2FHuXv09poE+H5HGYip68omnxeMmk6P3u15moGjr2K0=;
        b=bLi0iwLXbFcU5cQK0ggUsv9rN3oEDxUY+IqFtVhsuG8kBzXaoDWVDQq8YaNPKHusJV
         j3ZGsSmsdXnXhY5xNghLhnLm1fSf0oqQSjwHe9SFzhF7y6FAChhJuuU/PW8KzVal1fEO
         n3KpDTUQL2969yo4S3pQU333lUK5Y4aenx8wres5qX6bZ+w1dCk5JNFXI48SMWUsMrHk
         ufPfiymGzTuF983X666RXB6uEkhGi5rCnXpKYmanQcQBSWahAbPH/puoEyHa4tI9Ddzm
         6PZuBCeOTQP5K8E2FYVTINAcXkNV2+PfF7C/BFaq1AT8jm6CfldvyzNceU/RTsLSpskQ
         zT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787128943; x=1787733743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2FHuXv09poE+H5HGYip68omnxeMmk6P3u15moGjr2K0=;
        b=Xju0fBYkJZO3iehfoeHqjCwlfH977PO40BId9vFe+2qPJlwEvrRc3SmmnlE2Q3lOrq
         Mdi5hHCTV17zuH2w0b+SxPG07QXMlBpenmyDIV+uFPJc5wKNVD4FyVsNNMgJPnQhO7gd
         bhxGbd/SEB64WQAVtSOf8XOjOhNNHzvbEkhvMI0wqolFAFn3OmS1ZjJYaVKmlZW812ZM
         W1GxPyhM6BmlsfXmvvMguJ5Goat5aph30AeIX+G0UnuCOUSK1cnRED89VBKtpOfQp1nR
         5x6ICrkM0oJRegI6yK1k4XpAWpNgmhkkxwa9eHv/LMhJmWPCf6MLjhdCDyRMEcu2wegP
         XIPQ==
X-Gm-Message-State: AOJu0YzjET+XfZs42uiNjhpWNt63bjQZaDWp2ggD9eONCpK34gHQhh8I
	lVOUktbImFEA4L7sV1NSNGAWvB6e86Rls0DPmFihjmTkpY2HY1NoLm+l5G9r/EAtnW/j4w==
X-Gm-Gg: AR+sD10Bhy60/GsAVOJxxTPTihzZA4E+Hcl8kxnFfXc952NhVqe29QbT3eCNqlJhFtM
	Xb17ODcsOwcs0n5O3OQygI5mrB0AQopGcNWy7XKQCVK/874aVV+lPiTfPAH5r9jY85APL9cXnZn
	Aw3rNNtzFSs18vPbKIKPpQUCFFnE2cKfQSPuh4CBTEBsMsUljNGMU4W9qm/0cKHmniTK+lehunH
	kQ1FPz4hpfeH99Rq0dvT901IiGdGhjGmZVdqqjQ2yvW7YksSqwoTDO/YNqvHyRsLu7N0CmhBd/t
	O7yXjxKIxKSfVDLJxVpZO4m/RZY+7Bz6S8kIGZvZXu2Y+TAqOuxWilvGwqGPmumxzpPFoYJ95dp
	Iy3TKR2ZijU7KzdSVw3fUL63XUPTqqU14c7AlV9HuLSFl7wxvcPFvEhQsLO6UcMws9LV4N8hFAy
	h7/tC1LiJuaJXgrQdBS4/87jPX+MRpGhNGa9W8JOp5lvInD8PIFzDMiiMF5j8ADqr9
X-Received: by 2002:a05:600c:528d:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-499aa17d6a0mr56432445e9.6.1787128941652;
        Wed, 19 Aug 2026 01:42:21 -0700 (PDT)
Received: from DESKTOP-25PDM0G ([2a09:bac1:1e20:8::3a3:5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17f202sm41536315e9.13.2026.08.19.01.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:42:20 -0700 (PDT)
From: Ruzal Daminov <daminovruzal7@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruzal Daminov <daminovruzal7@gmail.com>
Subject: [PATCH v2] platform/x86: huawei-wmi: add camera toggle keycode
Date: Wed, 19 Aug 2026 11:38:36 +0300
Message-ID: <20260819083836.1410-1-daminovruzal7@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.4
In-Reply-To: <20260814171324.16727-1-daminovruzal7@gmail.com>
References: <20260814171324.16727-1-daminovruzal7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Honor MagicBook laptops emit WMI event code 0x288 when pressing the
camera e-shutter / privacy toggle key (Fn+F8 on Honor).

Add the missing 0x288 keycode to huawei_wmi_keymap[] in correct numerical
order and map it to KEY_CAMERA_ACCESS_TOGGLE.

Tested on Honor MagicBook X14 Plus (FMI-76, AMD Ryzen 8845HS).

Signed-off-by: Ruzal Daminov <daminovruzal7@gmail.com>
---
v2:
 - Drop duplicate keys already present in the table.
 - Remove leading zeros to match existing table style.
 - Place 0x288 in correct numerical order.
 - Map 0x288 to KEY_CAMERA_ACCESS_TOGGLE.

 drivers/platform/x86/huawei-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 93cca17fdf5868..b5463edc4053d4 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -78,6 +78,7 @@ static const struct key_entry huawei_wmi_keymap[] = {
 	{ KE_KEY,    0x285, { KEY_VOLUMEDOWN } },
 	{ KE_KEY,    0x286, { KEY_VOLUMEUP } },
 	{ KE_KEY,    0x287, { KEY_MICMUTE } },
+	{ KE_KEY,    0x288, { KEY_CAMERA_ACCESS_TOGGLE } },
 	{ KE_KEY,    0x289, { KEY_WLAN } },
 	// Huawei |M| key
 	{ KE_KEY,    0x28a, { KEY_CONFIG } },
-- 
2.45.2
