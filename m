Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA4F39D6DB
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 20:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506449; cv=none; b=dHmC8TL2BwhUHWtHRaBS6r/r+YxFUidiGizyZglR/BD04n+1j7GWZdjTVXBkxURBUDcdrlDGEsLvjVUNzPuFrZuC2JdXZuiDwIbttG9Ktu+CUi+jUBIPtXJILOH9srURwPjqnKlOvzNjomGD2F4eaYIlUjhDmUJpxIwZmmStUyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506449; c=relaxed/simple;
	bh=rSDmCCEiDg6H2odhJiDoxieO0TKl6hml/thK1WrMGBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mOKT99uESHf+yYVScenGHlqqOh+2kV2ZMqnLIwJpB4jTJAnRV0Z57eQCImvE0uR17fAKb39SOqFcTgcDVax2qq/q4JHP3+I54Dey8g6UFxUELqxZ+zzgC2s65vzl/lxVcy1lRSaQ4bLkHIB8kDjcxXIMD11WSJyLzY9xfW4Wq94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWqkZ8OX; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWqkZ8OX"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1274204434bso4139954c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 13:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775506446; x=1776111246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VN+fnLwvwAoWFMaejyWO9zQ/OWEWR+6r67Ac0CIVd7Y=;
        b=HWqkZ8OXLuCwAX89PyH0UNW1dSsOeI9VjKb8cyR9RvZb9POP6HWGuWHCKA8Q6cm7KW
         IauvlkU3Rhk8INyMl9nKyh+Tn6gARv7eWdc+5OlLqJWtaG/DkUa7toSl6hiVJm3SDuOX
         Be3LvgvYfdC+FXaqXcjQHs42ltF/hk91Q8HZASX0WnEZaJJ6Rgl43BtV9DC8LlHLNiiZ
         wfLooP/NxOB+jJ+34VtdqvTDE+viKOLgavanQMqAILt++h8dDLplzxPDkr8f3a6bInRP
         texa1aaaSpo69OYTgU1bLc2XwiiB0FGJmGhw9/p5y/kiCYeQ1L6e4zTyCWFOfBS4lPNk
         iiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775506446; x=1776111246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VN+fnLwvwAoWFMaejyWO9zQ/OWEWR+6r67Ac0CIVd7Y=;
        b=Ji21JRhtRu7DrYs/IGsd6OHEPbhX4gZVIt8Bg+LJAky/OFsm2oAVOGZ2eqQ5zFirUt
         RQL1TnhWEnm9XFWiWJTOzaEqow2gUJspMkn9SBRZ+DxqcyT5GuB+PJhm8L2vXLxAX1rX
         ftdM+1k+20I1NvSbWTSLOjfaPgk3fhKP2APL/OgWVIHzp7OYgqQXWqdBzUJ7KtDjU+PG
         0NGFnNmPas+jDDzTnVF1OWA3KdrKtdAp+Z6gQV3sXcz1QuaGHHlSuho2LNxaOJII6zM4
         E5K3+bVwWGPp3V3jVBTPnUzni4Oovk4BYU5wuYojnK4jZuev1SEm6IQV5885nNcTcy6l
         8yOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX9Xj/nOoWaETZS4xHDJ2zVemei8Dku5D9lOwnNW0Eul6+o61mIfmJAWr8siTijGKLxn1c7bHuNpPHWkrM+GCk3179@vger.kernel.org
X-Gm-Message-State: AOJu0YxFrshKAGxGYcfNYyeieO+3HCwgmgzm36NYatmoFqZvyR0JDJGU
	w/RH+cpw0ouw8ejA6UZvePKKUCXmrWmpUD5ZbzSLKH18kQTUfZh06zSy
X-Gm-Gg: AeBDietDg/vCL6wOaLYhWC6AIfxJaLTLwMivh5FkJt5c+wytG5h8YQz6wjpS37vAsN7
	sqB5JWAs0P7xCga8uwTUi7HN7rcVcUkHCyiPB+qIAwXFbUX8wPdnXiFj0UD/u4KZYp3Uhios+qu
	qqJ5wB86BQlJ4wLy1u+eSfJaYxLpVrPi00QNZhDzCFklzT8Ne1sRrjARLuJKyp/aBvNXYh9+e5y
	7ZgXFOkXbItFra9hnwB3JNmh7pE9kbMBl7E/Kdh+lU11hFebahBwf+PL+Tjjw1ESTbKHy/gkMzM
	A02z+3XMYO7cxSmzdBvsQLLXX+PdNQVVVzl3hRoMllRUUxrgzL4M5CttZWDHS4NnydPpzUCKfc0
	+qfHF3RxvI3wga8EiCuGicnPxGhdWsxJBytFozRo/nALecrktrzLKn3l6zQ4eN40nA42xCZZ+PV
	OgbZN6ac1T1XPmMw0lzZAMPuswYS7A3D5pwWIyCtySNeT5NuDJd0mRcamwObOdhvP20sE5Es+Li
	ToHcVZzBHOZzek=
X-Received: by 2002:a05:701b:220c:b0:12c:839:7462 with SMTP id a92af1059eb24-12c083975ccmr1603169c88.12.1775506446333;
        Mon, 06 Apr 2026 13:14:06 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm17022333c88.0.2026.04.06.13.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:14:06 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v8 05/16] platform/x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
Date: Mon,  6 Apr 2026 20:13:49 +0000
Message-ID: <20260406201400.438221-6-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406201400.438221-1-derekjohn.clark@gmail.com>
References: <20260406201400.438221-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In struct tunable_attr_01 the capdata pointer is unused and the size of
the id members is u32 when it should be u8. Fix these prior to adding
additional members.

No functional change intended.

Fixes: e1a5fe662b59 ("platform/x86: Add Lenovo Capability Data 01 WMI Driver")
Cc: stable@vger.kernel.org
Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 985cb9859b44..0e8a69309ec4 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -546,11 +546,10 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
 /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
 
 struct tunable_attr_01 {
-	struct capdata01 *capdata;
 	struct device *dev;
-	u32 feature_id;
-	u32 device_id;
-	u32 type_id;
+	u8 feature_id;
+	u8 device_id;
+	u8 type_id;
 };
 
 static struct tunable_attr_01 ppt_pl1_spl = {
-- 
2.53.0

