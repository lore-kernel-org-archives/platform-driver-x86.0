Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A6114F9FB;
	Sun,  5 Jan 2025 15:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091073; cv=none; b=TSAdeTnBYEOR99BipvfUSfiRirCQMRfJC0yTT9hd1Nxt0eqpVWc5CgHCvaNBHMylsg2g8SR30wrGlidriU6emny6WuTRKh/MaL8T76mrVrB3tuED9bwa/QLCzzepyZj16F0rMED7SlrouW6/bR7LxYJXDAmyePh72VVMgB6d43I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091073; c=relaxed/simple;
	bh=Z7FjuxtzNGdACXrFh8YIjDqvOFDSR8+NgzgA5dVIJQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yfyhu2q9H36SNmmMyK3tlgfFfmb/l5cwDH0H1j/OcbUvjJmQD9PNaaWjClN4yFSTV6cXVI+zJcb0BQXLExy0Hk9ODp8jWw5xrfTYww2Wxp0xEwaQY7MW21K2saQB3C9q1pooiZgLjnKXIkoYwy09rmXGKbbqxjePzyxA6D4fx0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABJhaya4; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABJhaya4"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-51889930cb1so3971800e0c.0;
        Sun, 05 Jan 2025 07:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091067; x=1736695867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4xidvvDQVdn9MHbPxeNeacaiw+noBQUp+1gjdq6/TQ=;
        b=ABJhaya4GGjLh4oD1gF3b6ZSNlTWGrn+fkzLlBtQN/adHXko+b4yQURNUnHXuJ4yw9
         +L4TryIxsHLBvHJb4ZJTkOVM8MSFJnErvDZPd6hm4pwpj4Bax3bts7sbM0F7uzfsTOP1
         JGZyONZFwrkyIM9joY/GkHTM5Tl0sAoU2OS56vf+fUgOzmgdFKZ0bDN44LBOTyp/ZOlB
         5CrlLOogaGunwRzvTe7AXmfn6PDbaRS9reduztog7dFP/SL5HwdKcm0+U/k8k2Ls0ST6
         9LxqyyUz+QObIyI/xk6LONOeEn3MwvpgxFnrrizw1IXatgKtwFNUHestxAOXyDdeuED3
         bJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091067; x=1736695867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4xidvvDQVdn9MHbPxeNeacaiw+noBQUp+1gjdq6/TQ=;
        b=kmtMScZTYMmpAal/DdBdwjl9Pp7OHYsTqZLNLpte1Lan7oa7aP8wg0QVeAkJLnWntF
         dvH5/ZzCFtMVi9qkkEQ+xUiLzGKGf+GksjGE4hH1w8EyofUEJrNaSz41EjdLkGKYo+3Z
         GHWrzdR9FkEN+Xa3gFzANBDS9S7Vh6qnEqMwaP/xroZtXFCAi0FbEaPNtHibvY0eZOW6
         K5x6mheSj80Yqu9kLFjNoz492wvOudCFpPM6AEVrotm0Ttlqbu53RKZbotOffeLaQLLo
         CL8I1USQaO3nFlCxfR5alEqyzhQTn9JY/I+R/syZxxU+ePb/eSXcVnLK8bcb//OGqhJc
         dWJA==
X-Forwarded-Encrypted: i=1; AJvYcCWGrRdbWsr0kTpAHj+eMD16cir1drNfoDuIPgbHV9xv/aqGv1YdJaY7M/DfPnMV7cu+/NkBFLyQCxg73mA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW5k45ds4xGFu/82rDqhl/m6lBrdLvbLxfW+OxEfaRDqQPV+AW
	jbmOhM1ph0XyZ/IE7HYN2qPHFs49UkEXHwoOfLJ59qIyVDMEo7yE3llqiA==
X-Gm-Gg: ASbGncsHwOSLq0Bnk1qRqI8ncotqUeiSflcOcybpjfxLfmnizrS5FOnMgRLppqBTf6s
	BG+YTaKGZxHsrX/NhcynlDBPTKwCUtsIhY/DbrhTJO8gz5eM4cnCT4sDvFGkWDyViLB03yolR/1
	XbYO1lmYTgRshPEVB1QAH8DNbq3x6B50ytJKwgCykeakMKRvgObmGhEsQo3JzEJZstrg+0dXTje
	qWBuo5zodn1173ldARoSbdc7HCcMaDfTP1I7I85iFirYXElCvWKzr8PRkOvUz9l
X-Google-Smtp-Source: AGHT+IH8i0DfOcZKX51apAm0woGYx1oVSNzOddA8x6uCPwJ3BH739BcltAZJUxM63C0H+ot0QUatOg==
X-Received: by 2002:a05:6102:32c1:b0:4b1:3409:93dd with SMTP id ada2fe7eead31-4b2cc45ebaamr45267598137.18.1736091067547;
        Sun, 05 Jan 2025 07:31:07 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:07 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	w_armin@gmx.de,
	mario.limonciello@amd.com,
	hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v3 03/20] platform/x86: alienware-wmi: Modify parse_rgb() signature
Date: Sun,  5 Jan 2025 10:30:03 -0500
Message-ID: <20250105153019.19206-5-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105153019.19206-2-kuurtb@gmail.com>
References: <20250105153019.19206-2-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

parse_rgb() now takes struct color_platform instead of struct
platform_zone to support upcoming refactor.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index ec64a8f22301..e54e3cc45691 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -434,7 +434,7 @@ static u8 global_brightness;
 /*
  * Helpers used for zone control
  */
-static int parse_rgb(const char *buf, struct platform_zone *zone)
+static int parse_rgb(const char *buf, struct color_platform *colors)
 {
 	long unsigned int rgb;
 	int ret;
@@ -454,7 +454,7 @@ static int parse_rgb(const char *buf, struct platform_zone *zone)
 	repackager.package = rgb & 0x0f0f0f0f;
 	pr_debug("alienware-wmi: r: %d g:%d b: %d\n",
 		 repackager.cp.red, repackager.cp.green, repackager.cp.blue);
-	zone->colors = repackager.cp;
+	*colors = repackager.cp;
 	return 0;
 }
 
@@ -538,7 +538,7 @@ static ssize_t zone_set(struct device *dev, struct device_attribute *attr,
 		pr_err("alienware-wmi: invalid target zone\n");
 		return 1;
 	}
-	ret = parse_rgb(buf, target_zone);
+	ret = parse_rgb(buf, &target_zone->colors);
 	if (ret)
 		return ret;
 	ret = alienware_update_led(target_zone);
-- 
2.47.1

